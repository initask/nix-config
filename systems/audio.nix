{ lib, config, pkgs, ... }:
{
  options.core.audio.enable =
    lib.mkEnableOption "enable audio";

  config = lib.mkIf config.core.audio.enable {
    services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
    };
    security.rtkit.enable = true;
  };
}

