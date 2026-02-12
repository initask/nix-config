{ lib, config, pkgs, ... }:
{
  options.core.networking.enable =
    lib.mkEnableOption "enable networking";

  config = lib.mkIf config.core.networking.enable {
    networking.hostName = "initask";
    networking.networkmanager.enable = true;
  };
}

