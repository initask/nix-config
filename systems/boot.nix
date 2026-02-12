{ lib, config, pkgs, ... }:
{
  options.core.boot.enable =
    lib.mkEnableOption "enable boot";

  config = lib.mkIf config.core.boot.enable {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  };
}
