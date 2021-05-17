# targets that aren't filenames
.PHONY: all clean deploy build serve

all: build

BIBBLE = bibble

# Source Files
dirs := _data _layouts _posts _projects _includes bib css img js php
SRC := $(foreach dir, $(dirs), $(shell git ls-tree -r --name-only HEAD -- $(dir)/*))
SRC += $(shell git ls-tree -r --name-only HEAD -- *.md)
SRC += $(shell git ls-tree -r --name-only HEAD -- *.html)
SRC += _config.yml site.webmanifest browserconfig.xml

.DELETE_ON_ERROR: _includes/%.html
_includes/%.html: bib/%.bib bib/publications.tmpl
	mkdir -p _includes
	$(BIBBLE) $+ > $@

# Build target for previewing at collections/incepts
PREVIEW_DIR ?= /collections/incepts
_site/ : _includes/pubs.html _includes/related.html $(SRC)
	rm -rf $@
	jekyll build -d $(join $@, $(PREVIEW_DIR)) -b $(PREVIEW_DIR)
	touch $@

# Build target for publishing to energy/incepts
PUBLISH_DIR ?= /energy/incepts
_site-publish/ : _includes/pubs.html _includes/related.html $(SRC)
	rm -rf $@
	jekyll build -d $(join $@, $(PUBLISH_DIR)) -b $(PUBLISH_DIR)
	touch $@

# Build site
build: _site/

# you can configure these at the shell, e.g.:
# SERVE_PORT=5001 make serve
SERVE_HOST ?= 127.0.0.1
SERVE_PORT ?= 5000
serve: _site/
	jekyll serve -l -I \
		-b $(PREVIEW_DIR) -d $<$(PREVIEW_DIR) \
		--port $(SERVE_PORT) --host $(SERVE_HOST)

clean:
	$(RM) -r _site _site-publish _includes/pubs.html _includes/related.html

DEPLOY_HOST ?= cmu-awps
deploy-publish: _site-publish/
	rclone sync -P $<$(PUBLISH_DIR) $(DEPLOY_HOST):$(PREVIEW_DIR)
deploy-preview: _site/
	rclone sync -P $<$(PREVIEW_DIR) $(DEPLOY_HOST):$(PREVIEW_DIR)

test: _site/ _site-publish/
	@echo "Checking preview version"
	htmlproofer \
	--disable-external \
	--check-html --check-favicon --check-img-http \
	--typhoeus-config='{"headers":{"UserAgent":"htmlproofer"}}' \
	_site

	@echo "Checking published version"
	htmlproofer \
	--http-status-ignore 999 \
	--disable-external \
	--check-html --check-favicon --check-img-http \
	--typhoeus-config='{"headers":{"UserAgent":"htmlproofer"}}' \
	_site-publish/

# Archive Site for Publishing
site-publish.zip: _site-publish/
	cd _site-publish/$(PUBLISH_DIR) &&  zip -r $(abspath site-publish.zip) .
