clean:
	@rm -rf build

build-js:
	@mkdir -p build
	@./node_modules/.bin/make-plural --ordinal=false > ./build/plurals.js
	@./node_modules/.bin/make-plural --ordinal=false --categories > ./build/pluralCategories.js
	@./node_modules/.bin/browserify ./lib/polyglot.js --standalone Polyglot --outfile ./build/polyglot.js
	@./node_modules/.bin/uglifyjs -o ./build/polyglot.min.js ./lib/polyglot.js
	@gzip -c ./build/polyglot.min.js > ./build/polyglot.min.js.gz

annotate:
	@./node_modules/.bin/docco ./lib/polyglot.js

build: clean build-js


.PHONY: clean build build-js annotate
