# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export DEFAULT_USER="isakjones"


# Disable updates
export DISABLE_AUTO_UPDATE=true
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# POWERLEVEL10K_MODE=nerdfont-complete
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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	brew
	zsh-autosuggestions
	zsh-syntax-highlighting
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"

# ## For compilers to find libffi you may need to set:
# export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"
# #
# # For pkg-config to find libffi you may need to set:
# export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig" alias ohmyzsh="mate ~/.oh-my-zsh"

# January stuff
export DEBTSY_EMAIL="isak.jones@january.com"

# For brew
if [ "$(arch)" = "arm64" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    # export PATH="/opt/homebrew/opt/python@3.8/bin:$PATH"
    # export LDFLAGS="-L/opt/homebrew/opt/python@3.8/lib" # For compilers to find python@3.8
else
    eval "$(/usr/local/bin/brew shellenv)"
    # export PATH="/usr/local/opt/python@3.7/bin:$PATH"
    # export PATH="/usr/local/opt/python@3.9/bin:$PATH"
    # export LDFLAGS="-L/usr/local/opt/python@3.7/lib" # For compilers to find python@3.7
fi

# alias mbrew="arch -arm64 /usr/local/bin/brew"
# alias ibrew="arch -x86_64 /opt/homebrew/bin/brew"

# architecture
alias tox86="arch -x86_64 zsh && arch"
alias toa64="arch -arm64 zsh && arch"

# keyboard stuff
export COLEMAK=false
alias kq="source ~/scripts/to_qwerty.sh"
alias kc="source ~/scripts/to_cole.sh"

# updating neovim
alias update_nvim="~/scripts/update_nvim.sh"
alias update_nvim_shared="~/scripts/update_nvim_shared.sh"

# navigation
alias tod="cd ~/january/debtsy/debtsy"
alias tow="cd ~/january/debtsy/web"

# apps
alias bp='PYTHONPATH=~/Users/isakjones/.pyenv/versions/3.9.15/bin/python python3.9 -m bpython'
alias nvim="/opt/homebrew/bin/nvim"
# alias lvim="~/.local/bin/lvim"
alias tmux="/opt/homebrew/bin/tmux"
alias lazygit="/opt/homebrew/bin/lazygit"
alias lg=lazygit



# export PATH="/usr/local/opt/python@3.7/libexec/bin:$PATH"
export PATH="/Users/isakjones/.pyenv/versions/3.7.13/lib/python3.7/site-packages:$PATH"
# export PATH="/Users/isakjones/.pyenv/versions/3.10.2/lib/python3.10/site-packages:$PATH"
export PATH="/Users/isakjones/.local/bin:$PATH"
export PATH="/Users/isakjones/Library/Caches/pypoetry/virtualenvs/debtsy-QuGcJ2U7-py3.7:$PATH"
# Rust
export PATH="/Users/isakjones/.cargo/bin:$PATH"
# Roc
export PATH="/Users/isakjones/code/roc/roc_nightly-macos_apple_silicon-2023-09-15-85c0ead:$PATH"
# LLVM

export PATH="/opt/homebrew/opt/llvm@13/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm@13/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm@13/include"
eval "$(pyenv init -)"

# To use pip with pyenv:
pip() {
    "$(pyenv which pip)" "$@"
}


# ===================================================================
# The below is needed to install Python 3.7.2 if your OS is >= 11.0.0
# ===================================================================
# export PATH="$HOME/.pyenv/bin:$PATH"
# export PATH="/usr/local/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
# export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
# export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

# [ -f "/Users/isakjones/.ghcup/env" ] && source "/Users/isakjones/.ghcup/env" # ghcup-env

# Convert to X86
# arch -x86_64 zsh 
# test -d ~/.january && emulate bash -c 'for i in ~/.january/profile.d/*; do source $i; done'
#

# I need this for the SSH agent to store the right keys for some unknown fucking reason
# eval $(ssh-agent -s)
alias actper=eval $(ssh-agent -s)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/isakjones/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/isakjones/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/isakjones/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/isakjones/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/isakjones/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/Users/isakjones/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

#compdef gt
###-begin-gt-completions-###
#
# yargs command completion script
#
# Installation: gt completion >> ~/.zshrc
#    or gt completion >> ~/.zprofile on OSX.
#
# _gt_yargs_completions()
# {
#   local reply
#   local si=$IFS
#   IFS=$'
# ' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" gt --get-yargs-completions "${words[@]}"))
#   IFS=$si
#   _describe 'values' reply
# }
# # compdef _gt_yargs_completions gt
# ###-end-gt-completions-###
#
export PATH="/opt/homebrew/opt/libxml2/bin:$PATH"
export HOMEBREW_EDITOR="nvim"
export PATH="/opt/homebrew/opt/postgresql@12/bin:$PATH"
# # export DYLD_LIBRARY_PATH="/opt/homebrew/Cellar/postgresql@12/12.16/lib"
#
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
