typeset -U path cdpath fpath manpath

plugin_dirs=(
  powerlevel10k zsh-autosuggestions zsh-syntax-highlighting
  zsh-history-substring-search
)
for plugin_dir in "${plugin_dirs[@]}"; do
  path+="/home/saya/.zsh/plugins/$plugin_dir"
  fpath+="/home/saya/.zsh/plugins/$plugin_dir"
  for plugin_fpath_dir in \
    "$plugin_dir/share/zsh/plugins/$plugin_dir" \
    "$plugin_dir/share/zsh/site-functions" \
    "$plugin_dir/share/zsh/vendor-completions"; do
    [[ -d "/home/saya/.zsh/plugins/$plugin_fpath_dir" ]] && fpath+="/home/saya/.zsh/plugins/$plugin_fpath_dir"
  done
done
unset plugin_dir plugin_dirs plugin_fpath_dir


autoload -U compinit && compinit

# Source plugins
ZSH_PLUGIN_DIR="$HOME/.zsh/plugins"

source "$ZSH_PLUGIN_DIR/powerlevel10k/powerlevel10k.zsh-theme"
source "$ZSH_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZSH_PLUGIN_DIR/zsh-history-substring-search/zsh-history-substring-search.zsh"
source "$ZSH_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

HISTSIZE="10000"
SAVEHIST="10000"
HISTFILE="$HOME/.zsh_history"

setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt EXTENDED_HISTORY
setopt AUTO_CD

[[ -d ${HISTFILE:h} ]] || mkdir -p "${HISTFILE:h}"

# Set shell options
set_opts=(
  HIST_FCNTL_LOCK HIST_IGNORE_DUPS HIST_IGNORE_SPACE SHARE_HISTORY autocd
  NO_APPEND_HISTORY NO_EXTENDED_HISTORY NO_HIST_EXPIRE_DUPS_FIRST
  NO_HIST_FIND_NO_DUPS NO_HIST_IGNORE_ALL_DUPS NO_HIST_SAVE_NO_DUPS
)
for opt in "${set_opts[@]}"; do
  setopt "$opt"
done
unset opt set_opts

        export PATH="$HOME/.local/bin:$PATH"
        export PATH="$HOME/.cargo/bin:$PATH"
        eval "$(zoxide init zsh)"
        eval "$(direnv hook zsh)"
        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
        autoload -U compinit && compinit
        zstyle ':completion:*' menu select
	    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
        compdef _eza eza ls
	    bindkey "\e[1;2D" backward-word
	    bindkey "\e[1;2C" forward-word
        bindkey "^[OA" history-substring-search-up
        bindkey "^[OB" history-substring-search-down
        _saved_dir=""
        pin() { _saved_dir=$PWD; echo "pinned $_saved_dir" }
        jump() { [[ -z "$_saved_dir" ]] && echo "nothing pinned" && return; cd "$_saved_dir" }
        egrep() {
            echo "egrep: warning: egrep is obsolescent; using grep -E" >&2
            grep -E "$@"
        }

alias -- aria='aria2c --max-connection-per-server=16 --split=16'
alias -- lofi='mpv --no-video '\''https://www.youtube.com/watch?v=rFZHOHl-L8A'\'''
alias -- ls='eza --icons=auto'
alias -- lsusb='cyme --lsusb'
alias -- lutris-isolated='bwrap --chdir /home/saya-games --bind / / --bind /home/saya-games/.home /home/saya --ro-bind-try /home/saya/.nix-profile /home/saya/.nix-profile --bind /home/saya-games /home/saya-games --ro-bind-try /home/saya/.config/gtk-3.0 /home/saya/.config/gtk-3.0 --ro-bind-try /home/saya/.config/gtk-4.0 /home/saya/.config/gtk-4.0 --ro-bind-try /home/saya/.config/dconf /home/saya/.config/dconf --ro-bind-try /home/saya/.gtkrc-2.0 /home/saya/.gtkrc-2.0 --ro-bind-try /home/saya/.icons /home/saya/.icons --ro-bind-try /home/saya/.themes /home/saya/.themes --ro-bind-try /home/saya/.local/share/icons /home/saya/.local/share/icons --ro-bind-try /home/saya/.local/share/themes /home/saya/.local/share/themes --dev-bind /dev /dev --proc /proc lutris'
alias -- minecraft-create='portablemc --main-dir /home/saya/.minecraft/instances/create start neoforge:1.21.1 -u Vazhniygoose --jvm-arg="-XmX4G" --jvm-arg"-Xms2G" --jvm-arg="-XX:+UseG1GC"'
alias -- minecraft-fabric_base='portablemc --main-dir /home/saya/.minecraft/instances/fabric-base start fabric:1.20.5 -u Vazhniygoose --jvm-arg="-Xmx4G" --jvm-arg="-XX:+UseZGC" --jvm-arg="-XX:+ZGenerational"'
alias -- pc=procs
