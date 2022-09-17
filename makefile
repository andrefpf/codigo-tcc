encode:
	./scripts/shift.sh
	./scripts/ppm2pgx.sh
	./scripts/run.sh

pdf:
	./scripts/tex2pdf.sh

pre-commit:
	./scripts/pre-commit.sh

clean:
	rm -rf examples/pgx/*
	rm -rf examples/shifted/*