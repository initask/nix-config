{ lib, ... }: 
let
  vars = import ../../vars.nix;
  de = vars.de;
in
{
  imports = [
    ./kitty.nix
    ./git.nix
  ]
  ++ lib.optionals (de == "dms") [
    ./hyprland.nix
  ];
}
