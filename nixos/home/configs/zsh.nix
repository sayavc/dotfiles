{ pkgs, config, ... }:
{
    programs.zsh = {
      enable = true;
      autocd = true;
      history = {
        path = "${config.home.homeDirectory}/.zsh_history";
        size = 10000;
        save = 10000;
        ignoreDups = true;
        share = true;
      };
      initContent = ''
        export PATH="$HOME/.local/bin:$PATH"
        export PATH="$HOME/.cargo/bin:$PATH"
        eval "$(zoxide init zsh)"
        eval "$(direnv hook zsh)"
        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
        autoload -U compinit && compinit
        zstyle ':completion:*' menu select
	    zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
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
      '';
      plugins = [
        { name = "powerlevel10k"; src = pkgs.zsh-powerlevel10k; file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme"; }
        { name = "zsh-autosuggestions"; src = pkgs.zsh-autosuggestions; file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh"; }
        { name = "zsh-syntax-highlighting"; src = pkgs.zsh-syntax-highlighting; file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"; }
        { name = "zsh-history-substring-search"; src = pkgs.zsh-history-substring-search; file = "share/zsh-history-substring-search/zsh-history-substring-search.zsh"; }
      ];
      shellAliases = {
          ls = "eza --icons=auto";
          sudo = "doas";
          lofi = "mpv --no-video 'https://www.youtube.com/watch?v=rFZHOHl-L8A'";
          pc = "procs";
          aria = "aria2c --max-connection-per-server=16 --split=16";
          lsusb = "cyme --lsusb";
          glutris = "PULSE_SERVER=unix:/run/user/1000/pulse/native doas -u saya-games lutris";
          "minecraft-fabric_base" = ''portablemc --main-dir /home/saya/.minecraft/instances/fabric-base start fabric:1.20.5 -u Vazhniygoose --jvm-arg="-Xmx4G" --jvm-arg="-XX:+UseZGC" --jvm-arg="-XX:+ZGenerational"'';
          "minecraft-create" = ''portablemc --main-dir /home/saya/.minecraft/instances/create start neoforge:1.21.1 -u Vazhniygoose --jvm-arg="-XmX4G" --jvm-arg"-Xms2G" --jvm-arg="-XX:+UseG1GC"'';
      };
    };
}
