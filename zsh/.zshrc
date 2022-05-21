# Path to your oh-my-zsh installation.
export ZSH="/home/lain/.oh-my-zsh"

# Load ZSH Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Theming
ZSH_THEME="" # Unset theme so that pure works
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

# Preferred programs
export VISUAL='nvim'
export EDITOR="$VISUAL"
export READER='zathura'

# Required exports for NNN previews to work
export NNN_PLUG='p:preview-tui'
export NNN_FIFO='/tmp/nnn.fifo'
export PAGER='less -Ri'

# Export directory for competitive programming
export COMPETE='/home/lain/compete'

# Export default command for FZF
export FZF_DEFAULT_COMMAND="find . -type f"

# Set up rbenv
eval "$(rbenv init -)"

# Aliases
alias vi='nvim'
alias path='echo -e ${PATH//:/\\n}'
alias mkdir='mkdir -pv' # More verbose and useful mkdir
alias nnn='nnn -e -a' # Autoload preview plugin when using nnn

# Add to path
export PATH=$PATH:~/.bin
export PATH=$PATH:~/compete/.scripts
