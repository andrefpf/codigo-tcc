## Requisitos
- Docker

## Instruções (para mim mesmo no futuro)

Clone o repositório
    
    git clone --recurse-submodules https://github.com/andrefpf/tcc

Crie a imagem usando o Dockerfile

    docker build -t tcc:latest -f Dockerfile .

Baixe o dataset das bikes

    mkdir -p datasets/
    wget http://plenodb.jpeg.org/lf/pleno_lf/Bikes.zip -O datasets/bikes.zip
    unzip datasets/bikes.zip -d datasets/

Crie um link simbólico para o modelo do latex 

    ln -s dissertation/ufsc-thesis-rn46-2019/ufsc-thesis-rn46-2019.cls

Adicione o hook para compilar o pdf sempre que o arquivo tex for modificado

    echo make pre-commit >> .git/hooks/pre-commit

Pode executar o que quiser com ```./docktcc``` no início