all: index.html index.pdf index_ger.pdf index_ger.pdf


# index.docx index.txt

index.html: index.org style.css
	pandoc --standalone -c style.css --from org --to html -o index.html index.org

index.pdf: index.html
	wkhtmltopdf index.html index.pdf

# index.docx: index.md
# 	pandoc --from markdown --to docx -o index.docx index.org

# index.txt: index.md
# 	pandoc --standalone --smart --from markdown --to plain -o index.txt index.org

clean:
	rm -f *.html *.pdf *.docx *.txt
