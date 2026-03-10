{ inputs, ... }: {
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
    ./settings/appearance.nix
    ./settings/panels.nix
    ./settings/shortcuts.nix
    ./settings/system.nix
  ];
  programs.plasma.enable = true;
}