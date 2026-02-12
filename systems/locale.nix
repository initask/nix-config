{ lib, config, pkgs, ... }:
{
  options.core.locale.enable =
    lib.mkEnableOption "enable locale";

  config = lib.mkIf config.core.locale.enable {
    time.timeZone = "Europe/Moscow";
    i18n.defaultLocale = "ru_RU.UTF-8";
    services.xserver.xkb.layout = "us,ru";
    services.xserver.xkb.options = "grp:win_space_toggle";
  };
}

