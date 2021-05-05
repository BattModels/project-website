# targets that aren't filenames
.PHONY: all clean deploy build serve

all: build

BIBBLE = bibble

.DELETE_ON_ERROR: _includes/pubs.html
_includes/pubs.html: bib/pubs.bib bib/publications.tmpl
	mkdir -p _includes
	$(BIBBLE) $+ > $@

build: _includes/pubs.html
	jekyll build -b $(BASE_DIR)

# you can configure these at the shell, e.g.:
# SERVE_PORT=5001 make serve
SERVE_HOST ?= 127.0.0.1
SERVE_PORT ?= 5000

serve: _includes/pubs.html
	jekyll serve -l -I \
		-b $(BASE_DIR) \
		--port $(SERVE_PORT) --host $(SERVE_HOST)

clean:
	$(RM) -r _site _includes/pubs.html

DEPLOY_HOST ?= cmu-awps
BASE_DIR ?= /collections/incepts
deploy:
	rclone sync -P _site/ $(DEPLOY_HOST):$(BASE_DIR)

test:
	htmlproofer \
	--only-4xx \
	--check-html \
	--url-swap '$(BASE_DIR)': \
	_site
