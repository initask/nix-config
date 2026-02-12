{ lib, config, pkgs, ... }:
{
  options.core.nix.enable =
    lib.mkEnableOption "enable nix";

  config = lib.mkIf config.core.nix.enable {
    nix.settings = {
      substituters = [
        "https://cache.nixos.org/"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      ];
    };
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-then 30d";
    };
  };
}

