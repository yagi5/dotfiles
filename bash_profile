export LESS='-i -M -R -W -q -S -N'
export EDITOR="vim"

export HISTCONTROL=ignoredups:erasedups
# unlimited history
export HISTSIZE=
export HISTFILESIZE=
shopt -s histappend
shopt -s histverify
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

export JDK_HOME="/usr/lib/jvm/java-11-openjdk-amd64/bin/java"
export GOPATH="$HOME/repos"
export PATH=$PATH:/usr/local/go/bin # for go
export PATH=$PATH:$JDK_HOME # for java
export PATH=$PATH:$GOPATH/bin # for go built binary
export PATH=$PATH:/usr/local/opt/llvm/bin/ # for clangd from brew
export PATH=$PATH:/usr/local/opt/mysql-client/bin # for MySQL cli from brew
export PATH=$PATH:$GOPATH/src/github.com/dty1er/kubernetes/third_party/etcd # for etcd for k8s local integration test

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

[ -x "$(command -v stern)" ] && source <(stern --completion=bash)
[ -x "$(command -v kubectl)" ] && source <(kubectl completion bash)

__git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d'  -e 's/* \(.*\)/\1/'
}

__short_pwd() {
	pwd \
	| sed -e 's#'"$HOME"'#~#g' \
	| sed -e 's#repos#r#g' \
	| sed -e 's#src#s#g' \
	| sed -e 's#github.com#g#g'
}

export PS1="\$(__short_pwd) \[\033[36m\]\$(__git_branch)\[\033[00m\] $ "

alias ls='ls --color -F'
alias ll='ls --color -Falh'
alias g='git'
alias vi='vim'

# for mac
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f /usr/local/etc/bash_completion.d/git-prompt.sh ] && . /usr/local/etc/bash_completion.d/git-prompt.sh
[ -f /usr/local/etc/bash_completion.d/git-completion.bash.sh ] && . /usr/local/etc/bash_completion.d/git-completion.bash

# ubuntu
[ -f /usr/share/bash-completion/completions/git ] && . /usr/share/bash-completion/completions/git
[ -f /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

__git_complete g __git_main

# complete -F __start_kubectl kubecolor

bind -f ~/.inputrc
