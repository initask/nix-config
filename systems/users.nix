{ lib, config, pkgs, ... }:
{
  options.core.users.enable =
    lib.mkEnableOption "enable users";

  config = lib.mkIf config.core.users.enable {
    users.users.initask = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "wireshark" ];
      initialPassword = "1";
      shell = pkgs.zsh;
    };
  };
}

