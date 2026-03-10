{ config, pkgs, lib, ... }:
{

  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.enable = true;
  services.xserver.enable = true;

  services.xrdp = {
    defaultWindowManager = "startplasma-x11";
    enable = true;
    openFirewall = true;
  };
  services.xserver.excludePackages = with pkgs; [
    xterm 
  ];
  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.konsole 
    kdePackages.elisa
    kdePackages.kdepim-runtime
    kdePackages.kmahjongg
    kdePackages.kmines
    kdePackages.konversation
    kdePackages.kpat
    kdePackages.ksudoku
    kdePackages.ktorrent
    kdePackages.discover
    kdePackages.kcalc
    kdePackages.kcharselect
    kdePackages.kclock
    kdePackages.kcolorchooser
    kdePackages.isoimagewriter
    kdePackages.okular
    kdePackages.ark
    kdePackages.kate
    kdePackages.kwrited
    kdePackages.kwalletmanager
    kdePackages.gwenview
  ];
}

