# According to the standard:
# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"


zvm_config() {
    ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
    ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLOCK
    ZVM_VISUAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
    ZVM_VISUAL_LINE_MODE_CURSOR=$ZVM_CURSOR_BLOCK
    ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_BLOCK
    # Retrieve default cursor styles
    local ncur=$(zvm_cursor_style $ZVM_NORMAL_MODE_CURSOR)
    local icur=$(zvm_cursor_style $ZVM_INSERT_MODE_CURSOR)
    local vcur=$(zvm_cursor_style $ZVM_VISUAL_MODE_CURSOR)

  # Append your custom color for your cursor
  ZVM_NORMAL_MODE_CURSOR=$icur'\e\e]12;#FFFFFF\a'
  ZVM_INSERT_MODE_CURSOR=$icur'\e\e]12;#F38BA8\a'
  ZVM_VISUAL_MODE_CURSOR=$vcur'\e\e]12;#B4BEFE\a'

  ZVM_VI_HIGHLIGHT_FOREGROUND=#ffffff           # Hex value
  ZVM_VI_HIGHLIGHT_BACKGROUND=#24273A           # Hex value
  ZVM_VI_HIGHLIGHT_EXTRASTYLE=bold,underline    # bold and underline
}

source ${0:h}/zsh-vi-mode.zsh
