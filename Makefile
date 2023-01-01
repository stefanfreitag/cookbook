OUTPUT_DIRECTORY=output
OUTPUT_DIRECTORY_IMAGES=OUTPUT_DIRECTORY/images

default: html_images html
pdf:
	mkdir -p output_pdf/images
	asciidoctor-pdf book.adoc -D output

html:
	mkdir -p docs/images
	asciidoctor -b html5 book.adoc -o docs/index.html -n

html_multipage:
	mkdir -p docs/images
	asciidoctor -r asciidoctor-multipage -b multipage_html5 book.adoc -o docs/index.html -n

pdf_images:
	for f in $(shell ls images); do \
		echo $${f}; \
		if [ ! -f output/images/$$f ]; \
		then \
  			convert -strip -interlace Plane -gaussian-blur 0.05 -quality 85% -resize 1024x768 images/$$f output_pdf/images/$$f; \
		fi \
	done

html_images:
	mkdir -p docs/images
	for f in $(shell ls images); do \
		echo $${f}; \
		if [ ! -f docs/images/$$f ]; \
		then \
  			convert -resize 1024x768 images/$$f docs/images/$$f; \
		fi \
	done
