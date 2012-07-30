OUT=out/
SRC=src/
WEBINTERFACE_DIR=$(OUT)files/common/www/

all: prepare html css js img


prepare:
	mkdir -p $(WEBINTERFACE_DIR)service/css
	mkdir -p $(WEBINTERFACE_DIR)service/js
	mkdir -p $(WEBINTERFACE_DIR)service/img
clean:
	rm -rf $(OUT)
css:
	yuicompressor -o 'src/service/css/:$(WEBINTERFACE_DIR)service/css/' $(SRC)service/css/*
js:
	yuicompressor -o 'src/service/js/:$(WEBINTERFACE_DIR)service/js/' $(SRC)service/js/*
img:
	cp -r $(SRC)service/img/ $(WEBINTERFACE_DIR)service/
html:
	cp -r $(SRC)service/cgi-bin $(WEBINTERFACE_DIR)service/
	htmlcompressor --remove-intertag-spaces --compress-js --compress-css --js-compressor yui -o $(WEBINTERFACE_DIR)  $(SRC)service/
	htmlcompressor --remove-intertag-spaces --compress-js --compress-css --js-compressor yui -o $(WEBINTERFACE_DIR)  $(SRC)redirection/
