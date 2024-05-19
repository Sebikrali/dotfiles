# General .zshrc settings

# Lines configured by zsh-newuser-install
HISTFILE=~/.bash_history
HISTSIZE=10000
SAVEHIST=10000
setopt autocd nomatch notify
unsetopt beep extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sxk/.zshrc'

autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)               # Include hidden files.

compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
# End of lines added by compinstall





# ====[[ User Config ]]====

# ===================== Options =====================

# ===================== Remaps =====================

bindkey '^[a' autosuggest-accept

# Set Clear to Ctrl+Alt+l because of tmux vim navigation collision
bindkey '^[' clear


# ===================== Environment =====================
source $HOME/dotfiles/shell/environment

# ===================== Functions =====================
source $HOME/dotfiles/shell/functions

# ===================== Aliase =====================
source $HOME/dotfiles/shell/aliase


# ===================== Plugins =====================

# Better vi mode
source /home/sxk/dotfiles/.config/zsh/zsh-vi-mode-master/zsh-vi-mode.plugin.zsh
# Syntax Highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Autosuggestions
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh


# ===================== Evals =====================
eval "$(mcfly init zsh)"
eval "$(starship init zsh)"
# eval $(thefuck --alias)
eval "$(zoxide init zsh)"
