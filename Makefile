# targets that aren't filenames
.PHONY: all clean deploy build serve

all: build

BIBBLE = bibble

_includes/pubs.html: bib/pubs.bib bib/publications.tmpl
	mkdir -p _includes
	$(BIBBLE) $+ > $@

build serve: BASE_DIR ?= /collections/incepts
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
DEPLOY_PATH ?= /collections/incepts/
deploy:
	rclone sync -P _site/ $(DEPLOY_HOST):$(DEPLOY_PATH)
