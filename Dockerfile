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
RUN vim +PluginInstall +qall
