# dotfiles

## How I Set This Up

```bash
git init $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/.git/ --work-tree=$HOME'
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/.git/ --work-tree=$HOME'" >> $HOME/.zsh/aliases
config config --local status.showUntrackedFiles no
```

## Installation

```bash
echo ".cfg" >> .gitignore
git clone <remote-git-repo-url> $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/.git --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config checkout
```
