
# Makefile for Arev package documentation

# Main file
arevdoc.pdf: arevdoc.tex fontsample.pdf prosper-arev.pdf prosper-helvetica.pdf prosper-lcmss.pdf prosper-cmss.pdf prosper-cmbright.pdf prosper-kerkis.pdf
	pdflatex arevdoc
	pdflatex arevdoc

clean:
	rm arevdoc.pdf fontsample.pdf prosper-*.pdf *.dvi *.eps *.aux *.log

# Font sample
fontsample.pdf: fontsample.dvi
	dvips -o fontsample.eps -E fontsample
	epstopdf fontsample.eps -o=fontsample.pdf
fontsample.dvi: fontsample.tex
	latex fontsample

# Prosper samples

prosper-arev.pdf: prosper-arev.dvi
	dvips -o prosper-arev.eps -E prosper-arev
	epstopdf prosper-arev.eps -o=prosper-arev.pdf
prosper-arev.dvi: prosper-arev.tex prosper-header.tex prosper-text.tex
	latex prosper-arev

prosper-helvetica.pdf: prosper-helvetica.dvi
	dvips -o prosper-helvetica.eps -E prosper-helvetica
	epstopdf prosper-helvetica.eps -o=prosper-helvetica.pdf
prosper-helvetica.dvi: prosper-helvetica.tex prosper-header.tex prosper-text.tex
	latex prosper-helvetica

prosper-lcmss.pdf: prosper-lcmss.dvi
	dvips -o prosper-lcmss.eps -E prosper-lcmss
	epstopdf prosper-lcmss.eps -o=prosper-lcmss.pdf
prosper-lcmss.dvi: prosper-lcmss.tex prosper-header.tex prosper-text.tex
	latex prosper-lcmss

prosper-cmss.pdf: prosper-cmss.dvi
	dvips -o prosper-cmss.eps -E prosper-cmss
	epstopdf prosper-cmss.eps -o=prosper-cmss.pdf
prosper-cmss.dvi: prosper-cmss.tex prosper-header.tex prosper-text.tex
	latex prosper-cmss

prosper-cmbright.pdf: prosper-cmbright.dvi
	dvips -o prosper-cmbright.eps -E prosper-cmbright
	epstopdf prosper-cmbright.eps -o=prosper-cmbright.pdf
prosper-cmbright.dvi: prosper-cmbright.tex prosper-header.tex prosper-text.tex
	latex prosper-cmbright

prosper-kerkis.pdf: prosper-kerkis.dvi
	dvips -o prosper-kerkis.eps -E prosper-kerkis
	epstopdf prosper-kerkis.eps -o=prosper-kerkis.pdf
prosper-kerkis.dvi: prosper-kerkis.tex prosper-header.tex prosper-text.tex
	latex prosper-kerkis
