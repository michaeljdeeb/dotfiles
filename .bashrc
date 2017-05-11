# export TERM='xterm-color' 
export TERM='screen-256color' # Must match what ~/.tmux.conf has set for terminal-override
alias tmux='tmux -2'            # Tells tmux to force 256 colors
export PATH=$PATH:/usr/local/bin
alias dotfiles='/usr/bin/git --git-dir=/Users/michaeljdeeb/.dotfiles/ --work-tree=/Users/michaeljdeeb'

