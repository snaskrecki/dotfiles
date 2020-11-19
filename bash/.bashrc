# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# default PS1
# if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]$ '

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# shortens relative path in command line to 3 last folders
PROMPT_DIRTRIM=3

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# this shoult be set by default
# export TERM="xterm-256color"
# export TERM="rxvt-unicode-256color"

export PATH="$PATH:$HOME/bin"

export VISUAL=vi
export EDITOR=vi
# export MANPAGER="/bin/sh -c \"col -b | view -c 'set ft=man nomod noma nolist' -\""

# use emacs key bindings (default)
set -o emacs

export VIMCONFIG=~/.vim
export VIMDATA=~/.vim
export VIMWIKI="$HOME/Dropbox/vimwiki"
export DOTFILES="$HOME/Dropbox/dotfiles"

export COMPROG="$HOME/Dropbox/competitive_programming"
export CODEFORCES="$COMPROG/codeforces"
export MACROS="$COMPROG/macros"
export CONTESTS="$COMPROG/contests"
export ATCODER="$COMPROG/atcoder"
export UVA="$COMPROG/uva"
export USACO="$COMPROG/usaco"
export LEETCODE="$COMPROG/leetcode"

alias ll="ls -lah"
alias la="ls -a"
alias rm="rm -i"

# Git aliases
alias gs="git status"
alias ga="git add"
alias gc="git commit"

# Vim aliases
alias vim="vim"
alias vi="vim"
alias rvim="vim -u NONE -N" # :s/NONE/NORC/g
alias rvi="rvim"
alias pvim="vim -u $VIMCONFIG/essential.vim"
alias pvi="pvim"
alias view="vim -R"

# Tmux aliases
alias tsf="tmux source-file ~/.tmux.conf"
alias cls="clear"
alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"

# Emacs aliases
alias emacs="emacs -nw" # start emacs in cmdline mode

alias _df="cd $DOTFILES"
alias _cp="cd $COMPROG"
alias _cf="cd $CODEFORCES"
alias _at="cd $ATCODER"
alias _ma="cd $MACROS"
alias _co="cd $CONTESTS"
alias _oj="cd $UVA"
alias _us="cd $USACO"
alias _lc="cd $LEETCODE"
alias _mkenv="cp -r $MACROS/* . && cp -r $MACROS/.vscode ."
alias _vi="cd $VIMCONFIG"

alias eb="vi ~/.bashrc"
alias ebp="vi ~/.bash_profile"
alias ev="vi $VIMCONFIG/vimrc"
alias sb="source ~/.bashrc"
alias ee="emacs ~/.emacs.d/init.el"
alias ex="vi ~/.Xdefaults"
alias py="python"
alias py3="python3"
alias et="vi ~/.tmux.conf"
alias ei="vi ~/.inputrc"
alias ew="vi $VIMWIKI/index.wiki"
alias _cw="cd $VIMWIKI"

# alias python="python3"
# alias ipython="ipython3"
# alias pip="pip3"

alias xup="xrdb ~/.Xdefaults" # update Xresources

# colors in the manual {{{
# 31 red
# 32 green
# 33 yellow
# 34 blue
# 35 purple
# 36 cyan
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
# }}}

# powerline-shell {{{
# function _update_ps1() {
#     PS1=$(powerline-shell $?)
# }
#
# if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#     PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
# fi
# }}}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
