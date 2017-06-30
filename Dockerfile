FROM alpine:latest
MAINTAINER Appu Joseph <woodstok@outlook.com>

RUN apk add --update \
  git \
  alpine-sdk build-base\
  libtool \
  automake \
  m4 \
  autoconf \
  linux-headers \
  unzip \
  ncurses ncurses-dev ncurses-libs ncurses-terminfo \
  python \
  python-dev \
  py-pip \
  clang \
  go \
  nodejs \
  xz \
  curl \
  make \
  cmake \
  && rm -rf /var/cache/apk/*

WORKDIR /tmp
ENV CMAKE_EXTRA_FLAGS=-DENABLE_JEMALLOC=OFF

# Required for running this on my archbox
RUN adduser -S appumj -G appumj

RUN adduser -S arastra -G arastra

RUN git clone https://github.com/neovim/libtermkey.git && \
  cd libtermkey && \
  make && \
  make install && \
  cd ../ && rm -rf libtermkey

RUN git clone https://github.com/neovim/libvterm.git && \
  cd libvterm && \
  make && \
  make install && \
  cd ../ && rm -rf libvterm

RUN git clone https://github.com/neovim/unibilium.git && \
  cd unibilium && \
  make && \
  make install && \
  cd ../ && rm -rf unibilium

RUN  git clone https://github.com/neovim/neovim.git && \
  cd neovim && \
  make && \
  make install && \
  cd ../ && rm -rf nvim

# Install neovim python support
RUN pip install neovim pep8
RUN chgrp -R users .

COPY install /usr/local/bin/install-neovim
USER appumj

ENV TERM xterm256-color

WORKDIR /data
COPY neovim /neovim
CMD /usr/local/bin/nvim 
