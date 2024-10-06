
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate _prefix
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' special-dirs true
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
setopt autocd beep nomatch
bindkey -e
# End of lines configured by zsh-newuser-install

autoload -Uz promptinit
promptinit

prompt_custom_prompt_setup() {
    PS1="%F{cyan}%n%f:%F{default}%~%f%(!.%F{red}#%f.%%) "
}

prompt_themes+=custom_prompt

prompt custom_prompt

# Aliases
alias ls="ls --color=auto"
alias la="ls -a"
alias ll="ls -la"
alias nnn="nnn -eor"
alias vim="nvim"
alias vi="nvim"
alias v="nvim"



[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env" # ghcup-env
