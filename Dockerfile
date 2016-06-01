FROM alpine:latest
MAINTAINER Nick Lang <nick@nicklang.com>

RUN apk add --update \
  git \
  alpine-sdk \
  libtool \
  cmake \
  automake \
  m4 \
  autoconf \
  linux-headers \
  unzip \
  ncurses-dev \
  python \
  python-dev \
  py-pip \
  curl \
  && rm -rf /var/cache/apk/*

WORKDIR /tmp
ENV CMAKE_EXTRA_FLAGS=-DENABLE_JEMALLOC=OFF

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
RUN pip install neovim

# install vim-plug
RUN curl -fLo /root/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# copy init.vim into container
COPY init.vim /root/.config/nvim/init.vim

# install all plugins
RUN nvim +PlugInstall +qa 
ENV TERM xterm256-color

WORKDIR /data
COPY neovim /neovim
# remove packages now... 
RUN apk del alpine-sdk libtool cmake automake m4 autoconf unzip py-pip curl
CMD /usr/local/bin/nvim 
