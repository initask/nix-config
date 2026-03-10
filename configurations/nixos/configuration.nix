{ inputs, config, pkgs, system, lib, ... }:
let
  vars = import ../../vars.nix;
  de = vars.de;
in
{
  imports = [
    ./host.nix
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    ../../modules/systems
    ../../modules/services
  ]
  ++ lib.optionals (de == "dms") [
    ../../modules/desktop/nixos/dms-shell.nix
  ]
  ++ lib.optionals (de == "kde") [
    ../../modules/desktop/nixos/kde.nix
  ]
  ++ lib.optionals (de == "gnome") [
    ../../modules/desktop/nixos/gnome.nix
  ];
  
  core.audio.enable = true;
  core.boot.enable = true;
  core.fonts.enable = true;
  core.locale.enable = true;
  core.networking.enable = true;
  core.nix.enable = true;
  core.packages.enable = true;
  core.users.enable = true;
  core.video.enable = true;

  services.openssh.enable = true;
  system.stateVersion = "24.05";
}

