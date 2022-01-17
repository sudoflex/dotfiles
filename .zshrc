# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/bolide/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="ceable"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
plugins=(zsh-syntax-highlighting git brew zsh-autosuggestions zsh-completions)

source $ZSH/oh-my-zsh.sh

# User configuration

# Fixing "no matches" error @Nov20
unsetopt nomatch

# Auto-suggest font color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'

# Tab completion @May1020
autoload -U compinit && compinit

# Brew PATH precedence request
export PATH="/usr/local/sbin:$PATH"