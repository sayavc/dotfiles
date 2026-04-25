{ config, lib, pkgs, inputs, ... }:
{
    nixpkgs.config.allowUnfree = true;
    home.stateVersion = "25.11";
    home.username = "saya";
    home.homeDirectory = "/home/saya";

    home.packages = with pkgs; [
      proton-vpn-cli
      nautilus
      portablemc
      wayvnc
      wl-clipboard
      atop
      gallery-dl
      gamescope
      gamemode
      clang
      mold
      cargo-generate
      radeontop
      nh
      flatpak
      jdk17
      apktool
      parted
      gparted
      dust
      duf
      nvd
      veracrypt
      ffmpeg
      file
      yazi
      tree
      jq
      tmux
      chameleos
      mpv
      btop
      fastfetch
      materialgram
      librewolf
      zoxide
      eza
      aria2
      foot
      bibata-cursors
      nwg-look
      papirus-icon-theme
      noctalia-shell
      noctalia-qs
      rustup 
      lutris
      p7zip
      alsa-lib
      inputs.niux.packages.${pkgs.system}.default 
      home-manager
    ];
    nixpkgs.overlays = [
    (final: prev: {
        openldap = prev.openldap.overrideAttrs (_: {
            doCheck = false;
            doInstallCheck = false;
            });
     })
    ];

    programs.git = {
        enable = true;
	settings = {
        user.name = "sayavc";
        user.email = "sayme.git@gmail.com";
        init.defaultBranch = "main";
        pull.rebase = false;
        };
    };

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
        lofi = "mpv --no-video 'https://www.youtube.com/watch?v=jfKfPfyJRdk'";
        aria = "aria2c --max-connection-per-server=16 --split=16";
        "minecraft-fabric_base" = ''portablemc --main-dir /home/saya/.minecraft/instances/fabric-base start fabric:1.20.5 -u Vazhniygoose --jvm-arg="-Xmx4G" --jvm-arg="-Xms2G" --jvm-arg="-XX:+UseG1GC"'';
      };
    };
}