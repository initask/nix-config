{ config, lib, pkgs, ... }:
let
  vars = import ../../vars.nix;
  de = vars.de;
in
{
    programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        pkief.material-icon-theme
        bbenoist.nix
        esbenp.prettier-vscode
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
        name = "dms-theme";
        publisher = "DankLinux";
        version = "0.0.2";
        sha256 = "sha256-wNymDgXGfvd8tTp4LFPEMUHh+kgwqhsMBr92lwR5W2g=";
        }
      ];


      userSettings = {
            "workbench.statusBar.visible" = false;
            "editor.minimap.enabled" = false;
            "editor.minimap.renderCharacters" = false;
            "workbench.activityBar.location" = "bottom";
            "window.menuBarVisibility" = "compact";
            "workbench.secondarySideBar.defaultVisibility" = "hidden";

            "window.commandCenter" = false;
            "window.titleBarStyle" = "custom";
            "workbench.layoutControl.enabled" = false;
            "chat.commandCenter.enabled" = false;
            "workbench.navigationControl.enabled" = false;

            "editor.defaultFormatter" = "esbenp.prettier-vscode";
            "editor.formatOnSave" = true;

	    "workbench.iconTheme" = "material-icon-theme";
	};
        keybindings = [
            {
            key = "ctrl+alt+z";
            command = "workbench.action.toggleSidebarVisibility";
            }
        ];
    };
    };
}
