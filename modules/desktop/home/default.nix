{ lib, ... }:
let
  vars = import ../../../vars.nix;
  de = vars.de;
in
{
  imports = [
  ]
  ++ lib.optionals (de == "dms") [
    ./hyprland
  ]
  ++ lib.optionals (de == "kde") [
    ./kde
  ];
}