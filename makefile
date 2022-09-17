encode:
	./scripts/encode.sh

decode:
	./scripts/decode.sh

pdf:
	./scripts/tex2pdf.sh

pre-commit:
	./scripts/pre-commit.sh

clean:
	rm -rf examples/pgx/*
	rm -rf examples/shifted/*