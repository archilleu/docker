FROM ubuntu:17.04
MAINTAINER archilleu
ENV REFRESHED_AT 2017-10-18

#update 163 source
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
ADD sources.list /etc/apt/sources.list
RUN apt -yqq update

#enable root login
RUN apt install -yyq openssh-server
RUN mv /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
ADD sshd_config /etc/ssh/sshd_config
EXPOSE 22

ADD .vimrc /root/.vimrc
ADD .ycm_extra_conf.py /root/.ycm_extra_conf.py 

#git
RUN apt install -yyq git
RUN apt install -yyq g++ gdb
RUN apt install -yyq cmake
RUN apt install -yyq python3-dev
RUN apt install -yyq vim-nox
#RUN apt install -yyq llvm clang libclang-dev libboost-all-dev

RUN git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
RUN git clone https://github.com/Valloric/YouCompleteMe.git /root/.vim/bundle/YouCompleteMe
WORKDIR /root/.vim/bundle/YouCompleteMe
RUN git submodule update --init --recursive
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN /root/.vim/bundle/YouCompleteMe/install.py --clang-completer

#WORKDIR /root
#RUN mkdir .ycm_build
#WORKDIR /root/.ycm_build
#RUN cmake -G "Unix Makefiles" -DUSE_SYSTEM_BOOST=ON -DUSE_SYSTEM_LIBCLANG=ON . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
#RUN cmake --build . --target ycm_core --config Release
#WORKDIR /root


#WORKDIR /root/.vim/bundle
#RUN git clone https://github.com/scrooloose/nerdtree
#RUN git clone https://github.com/ctrlvim/ctrlp.vim
#RUN git clone https://github.com/tacahiroy/ctrlp-funky
#RUN git clone https://github.com/isnowfy/python-vim-instant-markdown
#RUN git clone https://github.com/jtratner/vim-flavored-markdown
#RUN git clone https://github.com/suan/vim-instant-markdown
#RUN git clone https://github.com/nelstrom/vim-markdown-preview
#RUN git clone https://github.com/nvie/vim-flake8
#RUN git clone https://github.com/vim-scripts/Pydiction
#RUN git clone https://github.com/vim-scripts/indentpython.vim
#RUN git clone https://github.com/scrooloose/syntastic
#RUN git clone https://github.com/klen/python-mode
#RUN git clone https://github.com/klen/rope-vim
#RUN git clone https://github.com/davidhalter/jedi-vim
#RUN git clone https://github.com/tmhedberg/SimpylFold
#RUN git clone https://github.com/altercation/vim-colors-solarized
#RUN git clone https://github.com/jnurmine/Zenburn
#RUN git clone https://github.com/majutsushi/tagbar
#RUN git clone https://github.com/fholgado/minibufexpl.vim
#RUN git clone https://github.com/bling/vim-airline
#RUN git clone https://github.com/nathanaelkane/vim-indent-guides


