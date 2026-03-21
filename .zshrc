# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
eval "$(zoxide init zsh)"
alias ls='eza --icons'
alias sudo='doas'
alias lofi="mpv --no-video 'https://www.youtube.com/watch?v=jfKfPfyJRdk'"
alias aria="aria2c --max-connection-per-server=16 --split=16"
hasdir() { 7z l "$1" | grep -m1 ' D\.'; }

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

bindkey '^[[A' history-substring-search-up 
bindkey '^[[B' history-substring-search-down 
bindkey "\e[1;2D" backward-word
bindkey "\e[1;2C" forward-word

HISTFILE=$HOME/.zsh_history 
HISTSIZE=10000 
SAVEHIST=10000 
setopt HIST_IGNORE_DUPS 
setopt SHARE_HISTORY


source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
autoload -U compinit && compinit 
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
