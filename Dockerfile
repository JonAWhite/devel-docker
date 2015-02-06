FROM debian:jessie

MAINTAINER Jonathan White "jonathan.jawhite@gmail.com"

# Update to latest version
RUN apt-get update && apt-get install -y --no-install-recommends \
	vim-nox \
        clang-3.5 \
        clang++-3.5 \
        cmake \
        python

RUN apt-get clean

ADD .vimrc* /root/

RUN mkdir -p /root/.vim/autoload /root/.vim/bundle && curl -LSso /root/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
RUN git clone https://github.com/gmarik/Vundle.vim.git /root/.vim/bundle/Vundle.vim
RUN vim +PluginInstall +qall
