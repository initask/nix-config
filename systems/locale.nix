{ lib, config, pkgs, ... }:
{
  options.core.locale.enable =
    lib.mkEnableOption "enable locale";

  config = lib.mkIf config.core.locale.enable {
    time.timeZone = "Europe/Moscow";
    i18n.defaultLocale = "en_US.UTF-8";
    services.xserver.xkb.layout = "us,ru";
    services.xserver.xkb.options = "grp:win_space_toggle";
  };
}

