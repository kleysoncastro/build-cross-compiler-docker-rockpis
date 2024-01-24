# Use a imagem Ubuntu 22.04
FROM ubuntu:22.04

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
    && rm -rf /var/lib/apt/lists/*

# Configurar o SSH
RUN mkdir /var/run/sshd
RUN mkdir /toolchain

# Configurar o compartilhamento NFS
RUN mkdir /mnt/nfs_share

# Expor a porta SSH
EXPOSE 22

# Comando padrão para iniciar o sshd
CMD ["/usr/sbin/sshd", "-D"]