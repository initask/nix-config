{ lib, ... }: 
let
  vars = import ../../vars.nix;
  de = vars.de;
in
{
  imports = [
    ./kitty.nix
    ./git.nix
    ./nixvim.nix
    ./vscode.nix
    ./librewolf.nix
    ./vesktop.nix
  ]
  ++ lib.optionals (de == "dms") [
    ./hyprland.nix
  ]
  ++ lib.optionals (de == "kde") [
    ./kde.nix
  ];
}
