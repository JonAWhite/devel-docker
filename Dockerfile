FROM debian:jessie

MAINTAINER Jonathan White "jonathan.jawhite@gmail.com"

# Update to latest version
RUN apt-get update && apt-get install -y --no-install-recommends \
	ca-certificates \
        clang-3.5 \
        clang++-3.5 \
	clang-format-3.5 \
        cmake \
	curl \
	git \
	less \
	locate \
	make \
        python \
	python-dev \
	silversearcher-ag \
	ssh \
	vim-nox \
	wget

ADD .vimrc* /root/
ADD .bashrc /root/
ADD .clang-format /root/

RUN apt-get clean
RUN ln -s /usr/bin/clang-3.5 /usr/bin/clang && ln -s /usr/bin/clang++-3.5 /usr/bin/clang++ && ln -s /usr/bin/clang-format-3.5 /usr/bin/clang-format
RUN mkdir -p /root/.vim/autoload /root/.vim/bundle && curl -LSso /root/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim 
RUN git clone https://github.com/gmarik/Vundle.vim.git /root/.vim/bundle/Vundle.vim
RUN mkdir -p /root/.vim/colors && curl -LSso /root/.vim/colors/distinguished.vim https://raw.githubusercontent.com/Lokaltog/vim-distinguished/develop/colors/distinguished.vim
RUN vim +PluginInstall +qall
WORKDIR /root/.vim/bundle/YouCompleteMe
RUN ./install.sh --clang-completer --system-libclang
WORKDIR /usr/local/bin
RUN wget https://raw.githubusercontent.com/JonAWhite/cpplint/master/cpplint.py &&  chmod +x cpplint.py
WORKDIR /root/
