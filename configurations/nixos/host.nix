{ system, pkgs, inputs, ... }: {
  home-manager = {
    extraSpecialArgs = { inherit inputs system pkgs; };
    backupFileExtension = "backup";
    users = {
      initask = import ../home/initask.nix;
    };
  };
}
