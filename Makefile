all: application.zip

-include config.mk

PACKAGE_ROOT ?= http://people.mozilla.com/~vladimir/misc/webgl-perf

SOURCES = \
	jquery-1.9.0.min.js \
	app-index.html \
	hello-gles.html \
	webgl-draw-once.html \
	webgl-draw-perf.html \
	webgl-simple-perf.html \
	manifest.webapp \
	$(NULL)

all: application.zip

application.zip: $(SOURCES) index.html package.manifest
	zip -9r $@ $^

%: %.in
	sed 's,PACKAGE_ROOT,$(PACKAGE_ROOT),g' < $< > $@

clean:
	rm -f application.zip index.html package.manifest manifest.webapp

