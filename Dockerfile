FROM debian:jessie

MAINTAINER Jonathan White "jonathan.jawhite@gmail.com"

# Update to latest version
RUN apt-get update && apt-get install -y --no-install-recommends \
	ca-certificates \
        clang-3.5 \
        clang++-3.5 \
        cmake \
	curl \
	git \
	make \
        python \
	python-dev \
	vim-nox \
	wget

ADD .vimrc* /root/

RUN apt-get clean
RUN ln -s /usr/bin/clang-3.5 /usr/bin/clang && ln -s /usr/bin/clang++3.5 /usr/bin/clang++
RUN mkdir -p /root/.vim/autoload /root/.vim/bundle && curl -LSso /root/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
RUN git clone https://github.com/gmarik/Vundle.vim.git /root/.vim/bundle/Vundle.vim
RUN mkdir -p /root/.vim/colors && curl -LSso /root/.vim/colors/distinguished.vim https://raw.githubusercontent.com/Lokaltog/vim-distinguished/develop/colors/distinguished.vim
RUN vim +PluginInstall +qall
WORKDIR /root/.vim/bundle/YouCompleteMe
RUN ./install.sh --clang-completer --system-libclang
