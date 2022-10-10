FROM ubuntu:jammy

WORKDIR /home

ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ

RUN apt-get update

# Install utilities
RUN apt-get install -y \
        wget \
        make \
        cmake \
        git

# Install compiler stuff
RUN apt-get install -y \
        g++ \
        libx11-*

# Install latex stuff
RUN apt-get install -y \
        texlive-publishers \
        texlive-lang-portuguese \
        texlive-latex-extra \
        texlive-fonts-recommended

VOLUME /code
WORKDIR /code

CMD ["bash"]
