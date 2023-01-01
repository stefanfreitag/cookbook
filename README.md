# Recipes

A collection of cooking and baking recipes

# Usage

- Generate the pdf version of the collection

  ```sh
  make pdf
  ```

- Generate the html version of the collection

  ```sh
  make html
  ```

- Transforming html file to asciidoc

  ```sh
  pandoc -f html -t asciidoc <filename>
  ```

- Compress the pdf

  ```sh
   gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook \
  -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf book.pdf
  ```
