# targets that aren't filenames
.PHONY: all clean deploy build serve

all: build

BIBBLE = bibble

# Source Files
dirs := _data _layouts _posts _projects bib css img js php
SRC := $(foreach dir, $(dirs), $(shell git ls-tree -r --name-only HEAD -- $(dir)/*))
SRC += $(shell git ls-tree -r --name-only HEAD -- *.md)
SRC += $(shell git ls-tree -r --name-only HEAD -- *.html)
SRC += _config.yml site.webmanifest browserconfig.xml

.DELETE_ON_ERROR: _includes/%.html
_includes/%.html: bib/%.bib bib/publications.tmpl
	mkdir -p _includes
	$(BIBBLE) $+ > $@

# Build target for testing and depolyment to collections/incepts
_site/ : _includes/pubs.html _includes/related.html $(SRC)
	jekyll build -d $@
	touch $@

# Build target for publishing to energy/incepts
_site-publish/ : _includes/pubs.html _includes/related.html $(SRC)
	jekyll build -d $@ --config _config.yml,_publish.yml
	touch $@

# Build site
build: _site/

# you can configure these at the shell, e.g.:
# SERVE_PORT=5001 make serve
SERVE_HOST ?= 127.0.0.1
SERVE_PORT ?= 5000
serve: _site/
	jekyll serve -l -I \
		-b $(BASE_DIR) -d $< \
		--port $(SERVE_PORT) --host $(SERVE_HOST)

clean:
	$(RM) -r _site _site-publish _includes/pubs.html _includes/related.html

DEPLOY_HOST ?= cmu-awps
BASE_DIR ?= /collections/incepts
deploy-publish: _site-publish/
	rclone sync -P $< $(DEPLOY_HOST):$(BASE_DIR)
deploy-preview: _site/
	rclone sync -P $< $(DEPLOY_HOST):$(BASE_DIR)

test: _site/
	htmlproofer \
	--http-status-ignore 999 \
	--check-html --check-favicon --check-img-http \
	--url-swap '$(BASE_DIR)': \
	--typhoeus-config='{"headers":{"UserAgent":"htmlproofer"}}' \
	_site
