# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=4
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/pepol/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob
unsetopt beep nomatch notify
#bindkey -e
bindkey -v
# End of lines configured by zsh-newuser-install
#
#autoload -U promptinit
#promptinit

### PROMPT
autoload -U colors
colors

setopt PROMPT_SUBST

PROMPT='%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}%1~ %{$fg_no_bold[magenta]%}$(~pepol/bin/vcprompt)%{$reset_color%} %# '
RPROMPT='[%{$fg_no_bold[yellow]%}${${KEYMAP/vicmd/N}/(main|viins)/I} %* %? !%h%{$reset_color%}]'

# vi mode prompt
function zle-line-init zle-keymap-select {
  RPROMPT='[%{$fg_no_bold[yellow]%}${${KEYMAP/vicmd/N}/(main|viins)/I} %* %? !%h%{$reset_color%}]'
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

### END PROMPT

### HELP
autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
alias help=run-help
### END HELP

bindkey "^r" history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-backward
bindkey -M vicmd 'q' push-line

export EDITOR=vim
export PATH="/home/pepol/bin:$PATH"
export PYTHONPATH='/home/pepol/src'
export GOPATH='/home/pepol/go'

export PYENV_ROOT="/home/pepol/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

export KONVOY_ROOT="/home/pepol/konvoy"
export PATH="$KONVOY_ROOT:$PATH"

eval "$(pyenv init -)"

source /home/pepol/src/personal/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
