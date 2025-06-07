# This is the order for an interactive login shell:

#   /etc/zshenv
#   ${ZDOTDIR:-$HOME}/.zshenv
#   /etc/zprofile                 (login)
#   ${ZDOTDIR:-$HOME}/.zprofile   (login)
#   /etc/zshrc                    (interactive)
#   ${ZDOTDIR:-$HOME}/.zshrc      (interactive)
#   /etc/zlogin                   (login)
#   ${ZDOTDIR:-$HOME}/.zlogin     (login)
#   /etc/zlogout                  (login - loaded on logout)
#   ${ZDOTDIR:-$HOME}/.zlogout    (login - loaded on logout)
#

# If not running interactively, don't do anything
[[ ! -o interactive ]] && return

# this script's directory, not the current working directory or home
export DOT=${0:A:h}

export EDITOR="nvim"
export VISUAL="nvim"

source $DOT/history.zsh
source $DOT/colors.zsh

# nvm
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
source $DOT/plugins/zsh-nvm/zsh-nvm.plugin.zsh

# TODO pyenv, rg, fzf

source $DOT/completions.zsh
source $DOT/vimish.zsh
source $DOT/keybinds.zsh
source $DOT/alias.zsh

eval "$(starship init zsh)"
