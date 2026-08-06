# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

# Enabling pure prompt
fpath+=($HOME/.zsh/pure)

autoload -U promptinit; promptinit
prompt pure

# Adding time to the prompt
PROMPT='%F{white}%* '$PROMPT

# Tweaking colors
zstyle :prompt:pure:git:branch          color "#329F5B"

# Set language env variable
export LANG="en_US.UTF-8"

# Plugins
plugins=(z zsh-autosuggestions git fzf-zsh-plugin zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='mvim'
fi

# Setup rust
source "$HOME/.cargo/env"

# Zoxide setup
compinit
eval "$(zoxide init zsh)"



# Rofi themes
export PATH=$HOME/.config/rofi/bin:$PATH


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="$HOME/.sdkman"
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Python binaries
export PATH="$HOME/.local/bin:$PATH"

# User scripts
export PATH="$HOME/.local/scripts:$PATH"


export PATH="$PATH:$HOME/minio-binaries/"
