all: index.html index.pdf index_ger.pdf


# index.docx index.txt

pdf: index_ger.pdf
index_ger.pdf: index_ger.org
	pandoc --standalone --template style.tex \
	--from org --to context \
	-V papersize=A4 \
	-o index_ger.tex index_ger.org; \
context index_ger.tex

index.html: index.org style.css
	pandoc --standalone -c style.css --from org --to html -o index.html index.org

index_ger.html: index_ger.org style.css
	pandoc --standalone -c style.css --from org --to html -o index_ger.html index_ger.org

# index.pdf: index.html
# 	wkhtmltopdf index.html index.pdf

# index_ger.pdf: index_ger.html
# 	wkhtmltopdf index_ger.html index_ger.pdf


# index.docx: index.md
# 	pandoc --from markdown --to docx -o index.docx index.org

# index.txt: index.md
# 	pandoc --standalone --smart --from markdown --to plain -o index.txt index.org

clean:
	rm -f *.html *.pdf *.docx *.txt
