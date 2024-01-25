# Use a imagem Ubuntu 22.04
FROM ubuntu:22.04

ENV HOST=0.0.0.0 PORT=3000 USER_OWNER=allca WORDKDIR_OWNER=/toolchain



RUN mkdir -p ${WORDKDIR_OWNER}

WORKDIR ${WORDKDIR_OWNER}

# Atualize os pacotes e instale as ferramentas necessárias
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    file \
    cmake \
    gcc-arm-linux-gnueabihf \
    g++-arm-linux-gnueabihf \
    ssh \
    iputils-ping \
    nfs-common \
    sudo \
    tar \
    xz-utils \
    && rm -rf /var/lib/apt/lists/*

# Instale dependências adicionais para o Buildroot
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    libncurses-dev \
    gcc \
    g++ \
    autoconf \
    automake \
    libtool \
    bison \
    flex \
    gettext \
    patch \
    texinfo \
    wget \
    git \
    gawk \
    curl \
    lzma \
    bc \
    quilt \
    cpio \
    unzip \
    rsync \
    python3 \
    && rm -rf /var/lib/apt/lists/*

# Configurar o SSH
RUN mkdir /var/run/sshd
RUN mkdir /toolchain/gcc

COPY ./docker/*.xz ./


# Expor a porta SSH
EXPOSE 22

# Comando padrão para iniciar o sshd
CMD ["/usr/sbin/sshd", "-D"]

