{ inputs, config, pkgs, system, lib, ... }:
let
  vars = import ./vars.nix;
  de = vars.de;
in
{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    ./modules/nixos
    ./systems
    ./services
  ]
  ++ lib.optionals (de == "dms") [
    ./modules/de/dms-shell.nix
  ]
  ++ lib.optionals (de == "kde") [
    ./modules/de/kde.nix
  ]
  ++ lib.optionals (de == "gnome") [
    ./modules/de/gnome.nix
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

  home-manager = {
    extraSpecialArgs = { inherit inputs system pkgs; };
    backupFileExtension = "backup";
    users = {
      initask = import ./home.nix;
    };
  };
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases =
      let
        flakeDir = "/etc/nixos/";
        host = "initask";    # FIXME replace with your hostname
        user = "initask"; # FIXME replace with your username
      in {

      rebulid = "sudo nixos-rebuild switch";
      home-switch = "sudo home-manager switch";

      conf = "sudo nvim ${flakeDir}";

      ll = "ls -l";
      devfront = "nix-shell /etc/nixos/devshells/frontend-shell.nix"; 
    };

    ohMyZsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
      theme = "agnoster";
    };
  };

  services.openssh.enable = true;

  system.stateVersion = "24.05";
}

