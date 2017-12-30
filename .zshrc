#----------------------------------
# Environment variables

# LANG
#export LANG=ja_JP.UTF-8

export PATH=PATH:/usr/x86_64-pc-linux-gnu/gcc-bin/6.4.0:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin

# for less options
export LESS='-i -M -R -W -q'

# for default ediror
#export EDITOR=vim

#----------------------------------
# aliases
#source $HOME/.alias.sh
alias gb="git branch"
alias gl="git log"
alias gs="git status"
alias pc='git checkout `git branch | peco | sed -e "s/\* //g" | awk "{print \$1}"`'
alias pd='docker exec -it $(docker ps | peco | cut -d " " -f 1) /bin/bash'
alias pds='docker exec -it $(docker ps | peco | cut -d " " -f 1) /bin/sh'
alias pv='vi $(ls -a | peco)'
alias pcd='cd $(ls -a | peco)'
alias mm='cd $HOME/mmm && ls -a'
alias wo='cd $HOME/work && ls -a'
alias b='cd $HOME/work/ygnmhdtt.github.io'
alias be='bundle exec'
alias mpx='ssh mmpxy01p'
alias ap='export AWS_DEFAULT_PROFILE=$(grep -iE "^[]+[^*]" ~/.aws/credentials | tr -d [| tr -d ] | peco)'
alias ll='ls -alh'

#----------------------------------
# Appearance

# enable colors
autoload -Uz colors
colors

# prompt
export PROMPT='
[%~'
export PROMPT=$PROMPT'${vcs_info_msg_0_}'
export PROMPT=$PROMPT']'
export PROMPT=$PROMPT'
%F{012}gentoo <%f '

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

#----------------------------------
# Auto completion

# file of git-completion
#fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

# enable autoload
autoload -Uz compinit
compinit -u

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# auto complete for aws cli
#complete -C aws_completer aws
#source /usr/local/bin/aws_zsh_completer.sh

# git prompt
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
function precmd () { vcs_info }

#----------------------------------
# etc

# settings for history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd

# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# historyコマンドは履歴に登録しない
setopt hist_no_store

# 高機能なワイルドカード展開を使用する
setopt extended_glob

# vim:set ft=zsh:
export PATH="/usr/local/opt/qt/bin:$PATH"

#----------------------------------
# my

# loadkey
sudo loadkeys ~/work/keymap/my.kmap
