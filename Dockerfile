FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y \
  build-essential \
  curl \
  libgmp3-dev \
  libmpfr-dev \
  libmpc-dev \
  zlib1g-dev \
  texinfo

RUN apt-get install -y nasm

COPY ./scripts .

RUN bash -c "./binutils.sh"
RUN bash -c "./gcc.sh"
RUN bash -c "./gdb.sh"

RUN apt-get install -y grub2-common grub-pc-bin xorriso

ENV PATH="${PATH}:/root/.local/cross/bin"

