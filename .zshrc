ZSH=$HOME/.oh-my-zsh

export ZSH_THEME="spaceship"
export SPACESHIP_PACKAGE_SHOW=false
export SPACESHIP_NODE_SHOW=false

plugins=(
  brew
  docker
  docker-compose
  git
  git-extras
  rust
  pip
)


eval "$(brew shellenv)"

fpath=($HOMEBREW_PREFIX/share/zsh/site-functions $fpath)

source $ZSH/oh-my-zsh.sh

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/local/sbin:/usr/local/scripts:/usr/local/share/npm/bin:/usr/local/texbin:$PATH"

source $HOME/.local/bin/env

export EDITOR='nvim'

# Git Aliases
alias gh=github
alias gx=gitx
alias gd='git diff'
alias grb='git rebase --rebase-merges=rebase-cousins'

# Docker Clean Containers - Removes all stopped containers
alias dcc='docker rm $(docker ps -a -q)'

# Docker Clean Images - Remove the <none> images
alias dci='docker rmi $(docker images -a | grep "^<none>" | awk '\''{if (NR!=1) {print $3}}'\'')'

# Docker kill all running containers
alias dka='docker kill $(docker ps | awk '\''{if (NR!=1) {print $1}}'\'')'

alias dk="dka; dcc;"

# Run docker-compose process with --rm
alias dcr='docker-compose run '
alias dcrr='docker-compose run --rm'

# SSH, This makes it so you don't have to type your ssh private key passphrase after a reboot
ssh-add -K ~/.ssh/id_rsa &> /dev/null

# DOCKER SETTINGS
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

# # Initialize direnv
# eval "$(direnv hook zsh)"
# export PATH=/opt/homebrew/bin:$PATH

alias o='ollama'
alias urp='uv run python'

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/thomaslazarus/.lmstudio/bin"
# End of LM Studio CLI section

alias cr='cargo r'
alias cc='cargo c'
alias ct='cargo t'
alias cb='cargo b'

. "$HOME/.local/bin/env"

alias jg='just -g'

alias t='tmux'
alias activate='source .venv/bin/activate'

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/thoamslazarus/.lmstudio/bin"
# End of LM Studio CLI section

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/thoamslazarus/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

