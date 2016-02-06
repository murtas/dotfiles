# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
    # Shell is non-interactive.  Be done now!
    return
fi

# Put your fun stuff here.

# Alias
source ~/.bash_aliases

# VI mode
set -o vi

# Ruby options
RUBYOPT=""

# rbenv
eval "$(rbenv init -)"
export PATH="~/.rbenv/shims:$PATH"

# Git branch in prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

#"\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
export PS1="[\t] \u@\h \033[01;34m\]\w\033[00m\]\033[32m\]\$(parse_git_branch)\033[00m\] \$ "
