pdflatex -output-directory=dissertation --interaction=batchmode dissertation/example.tex 2>&1 > /dev/null
rm -f dissertation/*.aux dissertation/*.log