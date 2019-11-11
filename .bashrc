# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=1000
export HISTFILESIZE=2000

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# Prepend cd when entering a path
shopt -s autocd

# Disallow regular files to be overwritten by redirection of shell output
set -o noclobber

[ -f ~/.bash_aliases ] && source ~/.bash_aliases
[ -f ~/.bash_git ] && source ~/.bash_git

export FZF_DEFAULT_COMMAND="fd -H . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d -H -E '.git' . $HOME"

PYTHON_USER_SITE="/home/karsten/.local/bin/"
export GOPATH="/home/karsten/go"
export PATH="$PATH:$(yarn global bin):$GOPATH/bin:$PYTHON_USER_SITE"
export EDITOR=/usr/local/bin/vim
export VISUAL="$EDITOR"
export NVM_DIR="$HOME/.nvm"

# This loads nvm and nvm bash_completion
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Source FZF bash completion
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash

# Source GIT bash completion
[ -f /usr/share/git/completion/git-completion.bash ] && source /usr/share/git/completion/git-completion.bash

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
      . /usr/share/bash-completion/bash_completion

__git_complete gco _git_checkout
__git_complete gc _git_commit
__git_complete gb _git_checkout
__git_complete ga _git_add

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac
if [ "$color_prompt" = yes ]; then
  PS1='\[\e[0;33m\]\w\[\e[m\]|\[\e[0;32m\]$(__git_ps1 "%s")\[\e[m\]$ '
fi
unset color_prompt

eval $(keychain --eval --nogui --quiet)
