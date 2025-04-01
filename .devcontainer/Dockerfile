ARG GO_VERSION=1.24

FROM golang:${GO_VERSION}-bookworm

ARG USERNAME=vscode

# Install packages and Go language server
RUN apt update && apt dist-upgrade -y && apt install -y --no-install-recommends \
  git \
  sudo \
  openssh-client \
  zsh \
  gcc \
  curl \
  ca-certificates \
  unzip  \
  luarocks \
  && rm -rf /var/lib/apt/lists/*

#RUN useradd $USERNAME -s '/usr/bin/zsh' -D

RUN useradd $USERNAME -s /usr/bin/zsh
RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME
RUN chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME
# Setup shell
WORKDIR /home/$USERNAME
ENV EDITOR=nvim 
RUN sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended \
  && printf 'ZSH_THEME="robbyrussell"\nENABLE_CORRECTION="false"\nplugins=(git copyfile extract colorize dotenv encode64 golang)\n' | cat .zshrc > .zshrc2 \
  && rm .zshrc \
  && mv .zshrc2 .zshrc
#USER radekg
