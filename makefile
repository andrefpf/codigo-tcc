run:
	./scripts/run.sh

shift:
	./scripts/shift.sh

pgx:
	./scripts/ppm2pgx.sh

pdf:
	pdflatex -output-directory=dissertation --interaction=batchmode dissertation/example.tex 2>&1 > /dev/null
	rm -f dissertation/*.aux dissertation/*.log