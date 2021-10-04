# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Fix slow handle_completion_insecurities
ZSH_DISABLE_COMPFIX=true

# Path to your oh-my-zsh installation.
export ZSH="/Users/jhallinan/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
export DEFAULT_USER="jhallinan"
ZSH_THEME="powerlevel10k/powerlevel10k"
export P10K_THEME_PATH="${HOME}/.p10k-lean1.zsh"


# Uncomment the following line to disable auto-setting terminal title.
export DISABLE_AUTO_TITLE="true"

# Enable for
ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=yes

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  git-open
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Need this so that "poetry add" / "pip install"  psycopg works
LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/

# Direnv
eval "$(direnv hook zsh)"

# dotfiles repo
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# Homebrew
export HOMEBREW_BUNDLE_FILE="${HOME}/.Brewfile"

# Python
alias python='python3'

# Flutter
export PATH="$PATH:$HOME/flutter/bin"

# Ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"

# Rust
export PATH=$HOME/.cargo/bin:$PATH

# Golang
export GOPATH="${HOME}/go"
export GOROOT="$(brew --prefix golang)/libexec"
export GOPROXY="direct"
export GOSUMDB="off"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
test -d "${GOPATH}" || mkdir "${GOPATH}"

  # Add private domains to prevent DNS error
export GOPRIVATE=*.fanatics.corp,*.frg.tech
  # Add go-build-scripts to the path
export PATH="$HOME/Code/forge/go-build-scripts/modules:$PATH"

# Groovy
export EDITOR="code -w"
export JAVA_HOME=$(/usr/libexec/java_home)
export GROOVY_HOME=/usr/local/opt/groovy/libexec

# OMG Repo
alias omg-db="cd ~/Code/order_management_api && docker run -d --rm --name timescaledb -p 5432:5432 -e POSTGRES_PASSWORD='BlueKn!ght2020'  -v omg-postgres:/var/lib/postgresql/data --net omg_net timescale/timescaledb:latest-pg11"
alias omg-prisma="cd ~/Code/order_management_api && docker run -d -e PRISMA_CONFIG_PATH=\"/prisma-config/prisma-config.yml\" -v \"$(pwd)/env\":\"/prisma-config\" -p 4466:4466 --name \"prisma\" --net \"omg_net\" prismagraphql/prisma:1.34"

# Salesforce B2B Aliases
alias retrieveall="sfdx force:source:retrieve --sourcepath main/default"
alias retrieve="sfdx force:source:retrieve --sourcepath"
alias deployall="sfdx force:source:deploy -p main/default"
alias deploy="sfdx force:source:deploy -p"

# Django Aliases
alias dm='python3 manage.py'

# Kafka
export PATH="/usr/local/opt/kafka/bin:$PATH"

# Setup podman env vars
# Pulled from here https://www.redhat.com/sysadmin/replace-docker-podman-macos
export CONTAINER_HOST=ssh://vagrant@127.0.0.1:2222/run/podman/podman.sock
export CONTAINER_SSHKEY=~/tools/podman/.vagrant/machines/default/virtualbox/private_key
#

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $P10K_THEME_PATH ]] || source $P10K_THEME_PATH

export PATH="$HOME/.poetry/bin:$PATH"

# Created by `userpath` on 2021-02-14 16:59:48
export PATH="$PATH:/Users/jhallinan/.local/bin"
