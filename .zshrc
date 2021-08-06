# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/jhallinan/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# previous theme:
ZSH_THEME="powerlevel10k/powerlevel10k"
export P10K_THEME_PATH="${HOME}/.p10k-lean1.zsh"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
export DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Enable for
ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=yes

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  git-open
  poetry
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Need this so that "poetry add" / "pip install"  psycopg works
LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/

# Direnv
eval "$(direnv hook zsh)"

# dotfiles repo
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

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

# nvm
export NVM_DIR=$HOME/.nvm
export PATH=$NVM_DIR/versions/node/v12.16.1/bin:$PATH
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Use instead of nvm plugin
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh" --no-use

# pyenv
if [[ -z "$VIRTUAL_ENV" ]]; then
    eval "$(pyenv init -)"
fi

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $P10K_THEME_PATH ]] || source $P10K_THEME_PATH

export PATH="$HOME/.poetry/bin:$PATH"

# Created by `userpath` on 2021-02-14 16:59:48
export PATH="$PATH:/Users/jhallinan/.local/bin"
