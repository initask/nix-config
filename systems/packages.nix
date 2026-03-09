{ lib, config, pkgs, ... }:
{
  options.core.packages.enable =
    lib.mkEnableOption "enable basepkgs";

  config = lib.mkIf config.core.packages.enable {
    environment.systemPackages = with pkgs; [
      cmake
      curl
      wget
      git
      tree
      gnome-software	
    ];
    nixpkgs.config.allowUnfree = true;
    services.flatpak.enable = true;
  };
}

