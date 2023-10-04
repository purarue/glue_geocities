OUTFILE=./assets/bundle.css

dist: build
	@echo "Copying files..."
	mkdir -p ./dist/assets/images
	cp ./index.html ./dist/index.html
	cp ./assets/stars.js ./dist/assets/stars.js
	cp ./assets/elm_port.js ./dist/assets/elm_port.js
	cp ./assets/bundle.css ./dist/assets/bundle.css
	cp ./assets/images/* ./dist/assets/images/
	@echo "Done."


build: css ./assets/stars.js
	@echo "Done."

./assets/stars.js: elm/src/Stars.elm
	./compile_elm

css:
	# only the most classic CSS bundler, cat.
	@echo "Building..."
	cat ./assets/css/skeleton.css > $(OUTFILE)
	cat ./assets/css/normalize.css >> $(OUTFILE)
	cat ./assets/css/dos_buttons.css >> $(OUTFILE)
	cat ./assets/css/app.css >> $(OUTFILE)
	cat ./assets/css/star_keyframes.css >> $(OUTFILE)
	cat ./assets/css/index.css >> $(OUTFILE)

clean:
	rm -rf dist
	rm -f ./assets/stars.js
	rm -f ./assets/bundle.css
