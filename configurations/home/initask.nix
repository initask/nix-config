{ inputs, config, pkgs, lib, ... }:
{
  imports = [
    ../../modules/programs
    ../../modules/desktop/home
  ];

  home.username = "initask";
  home.homeDirectory = "/home/initask";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    fastfetch
    obsidian
  ];
  home.stateVersion = "24.05";
}