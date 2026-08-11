{ pkgs, ... }:
let
    makeGameWrapper = name: originalPkg: pkgs.writeShellScriptBin name ''
        export HOME="/home/saya-games"
        export XDG_CONFIG_HOME="/home/saya/.config"
        export XDG_DATA_HOME="/home/saya/.local/share"
        export XDG_CACHE_HOME="/home/saya/.cache"

        exec ${originalPkg}/bin/${name} "$@"
    '';
    in
    {
        home.packages = [
            (makeGameWrapper "lutris" pkgs.lutris)
        ];
    }
