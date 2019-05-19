#!/bin/bash

set -e

export GOPATH=$HOME/ghq
export PATH=$PATH:$HOME/ghq/bin
export XDG_CONFIG_HOME=$HOME/.config

git clone https://github.com/yagi5/dotfiles.git --depth=1 $HOME/ghq/src/github.com/yagi5/dotfiles
ln -sf $HOME/ghq/src/github.com/yagi5/dotfiles/.config/bash $HOME/.config/
ln -sf $HOME/ghq/src/github.com/yagi5/dotfiles/.config/docker $HOME/.config/
ln -sf $HOME/ghq/src/github.com/yagi5/dotfiles/.config/git $HOME/.config/
ln -sf $HOME/ghq/src/github.com/yagi5/dotfiles/.config/kube $HOME/.config/
ln -sf $HOME/ghq/src/github.com/yagi5/dotfiles/.config/nvim $HOME/.config/
ln -sf $HOME/ghq/src/github.com/yagi5/dotfiles/.config/scripts $HOME/.config/
ln -sf $HOME/ghq/src/github.com/yagi5/dotfiles/.config/ssh $HOME/.config/
ln -sf $HOME/ghq/src/github.com/yagi5/dotfiles/.config/telepresence $HOME/.config/
ln -sf $HOME/ghq/src/github.com/yagi5/dotfiles/.config/tmux $HOME/.config/

source $HOME/.config/bash/profile

/bin/pull-secrets.sh

go get github.com/motemen/ghq

echo "Executing goget..."
goget

echo "Executing ghqget..."
ghqget

sudo /usr/sbin/sshd -D
