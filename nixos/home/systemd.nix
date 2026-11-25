{ config, lib, pkgs, ... }:
{
  systemd.user.targets.nyasa = {
    Unit = {
      Description = "Nyasa Assistant Suite";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };

  systemd.user.services = {
    nyasa-tts = {
      Unit = {
        Description = "Nyasa Applio TTS Worker";
        After = [ "sound.target" "pipewire.service" ];
      };
      Install = {
        WantedBy = [ "nyasa.target" ];
      };
      Service = {
        Type = "simple";
        WorkingDirectory = "/home/saya/git/Applio2";
        Environment = [
          "PATH=/home/saya/.nix-profile/bin:/run/current-system/sw/bin"
        ];
        ExecStart = "/home/saya/git/Applio2/.venv/bin/python nyasa_daemon.py";
        Restart = "always";
        RestartSec = 3;
      };
    };

    nyasa-stt = {
      Unit = {
        Description = "Nyasa STT Rust Worker";
        After = [ "sound.target" "pipewire.service" ];
      };
      Install = {
        WantedBy = [ "nyasa.target" ];
      };
      Service = {
        Type = "simple";
        ExecStart = "/home/saya/.nix-profile/bin/nyasa-stt";
        Restart = "always";
        RestartSec = 2;
        Environment = [
          "RUST_LOG=debug"
        ];
      };
    };

    nyasa-daemon = {
      Unit = {
        Description = "Nyasa Assistant Rust Daemon";
        After = [ "sound.target" "pipewire.service" ];
      };
      Install = {
        WantedBy = [ "nyasa.target" ];
      };
      Service = {
        Type = "simple";
        ExecStart = "/home/saya/.nix-profile/bin/nyasa-daemon";
        Restart = "always";
        RestartSec = 2;
        Environment = [
          "RUST_LOG=debug"
        ];
      };
    };
  };
}
