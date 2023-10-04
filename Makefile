OUTFILE=./assets/bundle.css

dist: build
	@echo "Copying files..."
	mkdir -p ./dist/assets/images
	cp ./index.html ./dist/index.html
	cp ./assets/stars.js ./dist/assets/stars.js
	cp ./assets/elm_port.js ./dist/assets/elm_port.js
	cp ./assets/bundle.css ./dist/assets/bundle.css
	cp ./assets/images/* ./dist/assets/images/
	@echo "Done, check ./dist"

build: $(OUTFILE) ./assets/stars.js

./assets/stars.js: elm/src/Stars.elm
	@echo "Compiling Elm..."
	cd ./elm; elm make src/Stars.elm --optimize --output=./../assets/stars.js

$(OUTFILE): $(wildcard ./assets/css/*.css)
	# blazingly fast CSS bundler
	@echo "Bundling CSS..."
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
