FROM ubuntu:16.10

RUN apt-get update -y \
	&& apt-get install -y \
    dos2unix \
    build-essential cmake curl \
    fontconfig git gitk \
    nodejs npm \
    python-dev python-pip \
    silversearcher-ag tmux \
    vim wget \
    cscope clang \
  && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip \
  && pip install --upgrade virtualenv \
  && pip install powerline-status

# Set the locale
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

ADD https://tpo.pe/pathogen.vim /root/.vim/autoload/pathogen.vim
ADD vim_plugins_install.sh /root/.vim/bundle/vim_plugins_install.sh
ADD vimrc /root/.vimrc
ADD tmux.conf /root/.tmux.conf

WORKDIR /root

RUN wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf \
  && mv PowerlineSymbols.otf /usr/share/fonts/ \
  && fc-cache -vf \
  && mv 10-powerline-symbols.conf /etc/fonts/conf.d/ \
  && dos2unix .vimrc && dos2unix .tmux.conf


# ENV NVM_DIR /usr/local/nvm
# ENV NODE_VERSION 6.3.1

# # Install nvm with node and npm
# RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh | bash \
#     && source $NVM_DIR/nvm.sh \
#     && nvm install $NODE_VERSION \
#     && nvm alias default $NODE_VERSION \
#     && nvm use default

# ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
# ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH


WORKDIR /root/.vim/bundle
RUN dos2unix vim_plugins_install.sh && ./vim_plugins_install.sh

#RUN /bin/bash -c 'cd ~/.vim/bundle && ./vim_plugins_install.sh'
#RUN mkdir -p /root/projects
#WORKDIR /root/projects
#VOLUME [ "/root/projects" ]
ENTRYPOINT ["/bin/bash"]
