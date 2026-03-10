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
    ./zsh.nix
  ];
}
