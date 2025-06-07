# Jace's ZSH Config

This is my personal zsh configuration. Good Luck.

## Prerequisites

Portions of this depend on having the following installed locally:

- fzf
- rg
- coreutils

## Installation

To surrender entirely, just set $HOME/.zshenv to something like:

```
export ZDOTDIR=$HOME/.config/zsh
source $ZDOTDIR/.zshenv
```

Then you can delete .zshrc, .zprofile, .zlogin, and .zlogout from your home dir.

Otherwise, source these files into your dotfiles.