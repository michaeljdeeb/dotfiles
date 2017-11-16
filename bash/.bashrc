#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Import colorscheme from 'wal'
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(wal -r &)
export PATH=$PATH:$HOME/dotfiles/utils/
export BROWSER="firefox"
neofetch
