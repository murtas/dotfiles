# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Put your fun stuff here.

# Alias
alias ll="ls -la"

# VI mode
set -o vi

RUBYOPT=""

# Custom command line tools path
heroku="/opt/heroku-client"
rbenv="$HOME/.rbenv/bin"
export PATH="$heroku:$rbenv:$PATH"

# Enable rbenv shims and autocompletion
eval "$(rbenv init -)"

# Load in the git branch prompt script.
source ~/.git-prompt.sh

PS1="[\t] \u@\h\[\033[01;34m\] \w \$(__git_ps1) \$\[\033[00m\] "
