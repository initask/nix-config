{ lib, config, pkgs, ... }:
{
  options.core.packages.enable =
    lib.mkEnableOption "enable basepkgs";

  config = lib.mkIf config.core.packages.enable {
    environment.systemPackages = with pkgs; [
      home-manager
      cmake
      curl
      wget
      git
      tree
      neovim 
      nur.repos.mio.firefox_nightly
      firefox
    ];
    nixpkgs.config.allowUnfree = true;
  };
}

