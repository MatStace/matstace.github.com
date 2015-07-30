all: html pdf docx rtf

pdf: CV-Mat-Stace.pdf
CV-Mat-Stace.pdf: CV-Mat-Stace.md
	pandoc --standalone --template cv-template.tex \
	--from markdown  \
	-V papersize=A4 \
	-o CV-Mat-Stace.pdf CV-Mat-Stace.md

html: cv-mat-stace.html
cv-mat-stace.html: cv.css CV-Mat-Stace.md
	pandoc --standalone -H cv.css \
        --from markdown -o html \
        -o cv-mat-stace.html CV-Mat-Stace.md

docx: CV-Mat-Stace.docx
CV-Mat-Stace.docx: CV-Mat-Stace.md
	pandoc -s -S CV-Mat-Stace.md -o CV-Mat-Stace.docx

rtf: CV-Mat-Stace.rtf
CV-Mat-Stace.rtf: CV-Mat-Stace.md
	pandoc -s -S CV-Mat-Stace.md -o CV-Mat-Stace.rtf

clean:
	rm cv-mat-stace.html
	rm CV-Mat-Stace.tex
	rm CV-Mat-Stace.tuc
	rm CV-Mat-Stace.log
	rm CV-Mat-Stace.pdf
	rm CV-Mat-Stace.docx
	rm CV-Mat-Stace.rtf
