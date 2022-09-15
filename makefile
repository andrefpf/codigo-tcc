encode:
	./scripts/shift.sh
	./scripts/ppm2pgx.sh
	./scripts/run.sh

pdf:
	pdflatex -output-directory=dissertation --interaction=batchmode dissertation/example.tex 2>&1 > /dev/null
	rm -f dissertation/*.aux dissertation/*.log

clean:
	rm -rf examples/pgx/*
	rm -rf examples/shifted/*
