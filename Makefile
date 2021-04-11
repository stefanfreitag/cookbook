OUTPUT_DIRECTORY=output
OUTPUT_DIRECTORY_IMAGES=OUTPUT_DIRECTORY/images

pdf:
	mkdir -p output_pdf/images
	asciidoctor-pdf book.adoc -D output

html:
	mkdir -p output/images
	asciidoctor -b html5 book.adoc -D output -n

pdf_images:
	for f in $(shell ls images); do \
		echo $${f}; \
		if [ ! -f output/images/$$f ]; \
		then \
  			convert -strip -interlace Plane -gaussian-blur 0.05 -quality 85% -resize 1024x768 images/$$f output_pdf/images/$$f; \
		fi \
	done
	
html_images:
	for f in $(shell ls images); do \
		echo $${f}; \
		if [ ! -f output/images/$$f ]; \
		then \
  			convert -resize 1024x768 images/$$f output/images/$$f; \
		fi \
	done
	