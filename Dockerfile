FROM r-base:4.0.2
MAINTAINER Freddy Drennan
RUN apt-get update --allow-releaseinfo-change -qq && apt-get install -y \
    sudo \
    gdebi-core \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    xtail \
    wget \
    libssl-dev \
    libxml2-dev \
    python3-venv \
    libpq-dev \
    libsodium-dev \
    libudunits2-dev \
    libgdal-dev \
    systemctl \
    git \
    libssh2-1 \
    libssh2-1-dev \
    texlive \
    unzip \
    curl
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
WORKDIR /www
RUN R -e "install.packages('devtools')"
RUN R -e "install.packages('bslib')"
RUN R -e "devtools::install_github('fdrennan/drenr')"
