{ config, pkgs, ... }:

{
  imports = [
    ./modules/home
  ];
  home.username = "initask";
  home.homeDirectory = "/home/initask";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    vim            # stable vim
    fastfetch   # unstable vim
  ];

  home.stateVersion = "24.05";
}

