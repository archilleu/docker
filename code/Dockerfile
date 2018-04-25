FROM ubuntu:latest
MAINTAINER archilleu
ENV REFRESHED_AT 2017-10-18

#update 163 source
#RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
#ADD sources.list /etc/apt/sources.list
RUN apt  update

#enable root login
RUN apt install -yyq openssh-server
RUN mv /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
ADD sshd_config /etc/ssh/sshd_config
EXPOSE 22

ADD .vimrc /root/.vimrc
ADD .ycm_extra_conf.py /root/.ycm_extra_conf.py 

#git
RUN apt install -yyq exuberant-ctags
RUN apt install -yyq git
RUN apt install -yyq g++ gcc gdb
RUN apt install -yyq build-essential cmake
RUN apt install -yyq python-dev python3-dev

RUN git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
RUN git clone https://github.com/Valloric/YouCompleteMe.git /root/.vim/bundle/YouCompleteMe
WORKDIR /root/.vim/bundle/YouCompleteMe
RUN git submodule update --init --recursive
RUN /root/.vim/bundle/YouCompleteMe/install.py --clang-completer

RUN apt install -yyq libncurses5-dev libgnome2-dev libgnomeui-dev \
libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git


#vim
RUN apt remove vim vim-runtime gvim vim-tiny vim-common vim-gui-common vim-nox
RUN git clone https://github.com/vim/vim.git /root/.vim/bundle/vim
WORKDIR /root/.vim/bundle/vim
RUN ./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr/local
RUN make VIMRUNTIMEDIR=/usr/local/share/vim/vim80
RUN make install
RUN update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
RUN update-alternatives --set editor /usr/local/bin/vim
RUN update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
RUN update-alternatives --set vi /usr/local/bin/vim

WORKDIR /root/.vim/bundle
RUN git clone https://github.com/tpope/vim-fugitive
RUN git clone https://github.com/scrooloose/nerdtree
#RUN git clone https://github.com/ctrlvim/ctrlp.vim
RUN git clone https://github.com/tacahiroy/ctrlp-funky
RUN git clone https://github.com/isnowfy/python-vim-instant-markdown
RUN git clone https://github.com/jtratner/vim-flavored-markdown
RUN git clone https://github.com/suan/vim-instant-markdown
RUN git clone https://github.com/nelstrom/vim-markdown-preview
RUN git clone https://github.com/nvie/vim-flake8
RUN git clone https://github.com/vim-scripts/indentpython.vim
RUN git clone https://github.com/scrooloose/syntastic
RUN git clone https://github.com/klen/rope-vim
RUN git clone https://github.com/davidhalter/jedi-vim
RUN git clone https://github.com/tmhedberg/SimpylFold
RUN git clone https://github.com/altercation/vim-colors-solarized
RUN git clone https://github.com/jnurmine/Zenburn
RUN git clone https://github.com/majutsushi/tagbar
RUN git clone https://github.com/fholgado/minibufexpl.vim
RUN git clone https://github.com/bling/vim-airline
RUN git clone https://github.com/nathanaelkane/vim-indent-guides

WORKDIR /root
RUN /etc/init.d/ssh start
