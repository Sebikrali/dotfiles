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


# # ====[[ User Config ]]====

# ===================== Options =====================
# History
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# cd
setopt cd_silent
# completion
setopt always_to_end list_packed

# Recommended for vi mode
export KEYTIMEOUT=1

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# ===================== Remaps =====================

bindkey '^F' autosuggest-accept
bindkey '^Z' history-search-backward
bindkey '^T' history-search-forward
bindkey '^[.' insert-last-word

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Set Clear to Ctrl+Alt+l because of tmux vim navigation collision
bindkey '^[l' clear-screen


# ===================== Environment =====================
source $HOME/dotfiles/shell/environment

# ===================== Functions =====================
source $HOME/dotfiles/shell/functions

# ===================== Aliase =====================
source $HOME/dotfiles/shell/aliase

# ===================== Plugins =====================

# Better vi mode
source /home/sxk/.config/zsh/zsh-vi-mode-master/zsh-vi-mode.plugin.zsh
# Syntax Highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# ===================== Evals =====================
# eval "$(mcfly init zsh)"
eval "$(starship init zsh)"
# eval $(thefuck --alias)
eval "$(zoxide init zsh)"
