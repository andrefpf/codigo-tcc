Este repositório contém todos os códigos necessários para executar as análises e para criar as figuras que foram utilizadas neste TCC.

O arquivo tcc.diff contém todas as alterações criadas no [código do JPLM](https://gitlab.com/wg1/jpeg-pleno-refsw) para este trabalho.
O arquivo foi gerado comparando a versão da branch utilizada para o desenvolvimento (rate_control),
com a branch base (omp_parallel) através do seguinte comando:
```
git diff omp_parallel > tcc.diff
```

Os arquivos contendo os light fields testados podem ser baixados no [database do JPEG Pleno](https://plenodb.jpeg.org/).
Instruções para conversão dos arquivos estão disponíveis no [repositório do JPLM](https://gitlab.com/wg1/jpeg-pleno-refsw).

Alguns dos plots dependem de dados extraídos por bloco através da codificação de alguns dos light fields das CTCs.
Estes dados serão disponibilizados na seção de releases deste repositório.
