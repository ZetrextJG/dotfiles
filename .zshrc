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

# Aliases

alias ls="exa"
alias l="exa -lh"
alias ll="exa -alh"
alias tree="exa --tree"

function cs () {
    z "$@" && exa
}
alias cd="cs"

alias v="nvim"
alias ra="ranger"
alias c="clear"

alias tmux="tmux -u" # Always output utf-8 characters in tmux

alias matlab="matlab -softwareopengl ."

alias "docker a"="docker attach --sig-proxy=false"

alias uw="update-worktree"
alias ts="tmux-sessionizer"

alias av="source ./venv/bin/activate"
alias cv="python3 -m venv venv"


# SETUP PRIVATE PARTS
if [ -f ~/personal/dotfiles/.priv-zshrc ]; then
    source ~/personal/dotfiles/.priv-zshrc
fi
if [ -f ~/personal/dotfiles/work/.zshrc ]; then
    source ~/personal/dotfiles/work/.zshrc
fi

# OTHER
export EDITOR=nvim

# Monitor scaling
export GDK_SCALE=0.5

# Custom fzf keybinds
bindkey -r "^O"
bindkey "^O" fzfv.sh
bindkey -r "^K"
bindkey "^K" fkill.sh

# More custome keybinds
bindkey -r "^G"
bindkey -s "^G" 'git status^M'

# Spicetify setup
export PATH=$PATH:/home/zetrext/.spicetify

# Rofi themes
export PATH=$HOME/.config/rofi/bin:$PATH

# Setup tmux colors
export TERM="xterm-256color"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="$HOME/.sdkman"
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Python binaries
export PATH="$HOME/.local/bin:$PATH"

# User scripts
export PATH="$HOME/.local/scripts:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/zetrext/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/zetrext/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/zetrext/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/zetrext/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Zoxide setup
compinit
eval "$(zoxide init zsh)"


