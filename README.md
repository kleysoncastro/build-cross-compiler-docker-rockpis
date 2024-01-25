# Imagem Ubuntu 22.04 para Cross-Compile Buildroot

### Principais Objetivos

1 - Gerar sysroot para compilação cruzada para chips `radxa`, especialmente rockpi s.

2 - Compilar projetos arm64

3 - Evitar instalação de lib e ferramentas na máquina host

4 - compilação com toolchain gcc linaro 11

### Visao geral

Arquivo de construção `docker/DockerFile` tem como base ubuntu 22.04.

Adiciona as seguintes dependências

```sh
    libncurses-dev gcc g++ autoconf automake libtool bisonflex gettext patch texinfo wget git gawk curl lzma bc quiltcpio unzip rsync python3
    \   build-essential file cmake gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf ssh iputils-ping nfs-common sudo tar xz-utils
```

### Build imagem

1 Download do gcc dentro de `./docker`

```sh
$ cd docker
$ wget https://snapshots.linaro.org/gnu-toolchain/11.3-2022.06-1/aarch64-linux-gnu/gcc-linaro-11.3.1-2022.06-x86_64_aarch64-linux-gnu.tar.xz

```

2 Para build basta executar `./build.sh`

### Notas

#### Para construir um sysroot customizado para rockpi XX

Acesse a imagem com `docker exex -it` ou com script `./ssh.sh`

E siga os passas do repo rockpis
