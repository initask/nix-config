{ pkgs, ... }:
let
  togglePanelAutoHidden = pkgs.writeShellScript "toggle-panel-hiding" ''
    dbus-send --session --dest=org.kde.plasmashell --type=method_call /PlasmaShell org.kde.PlasmaShell.evaluateScript "string:
      var panels = panels();
      for (var i = 0; i < panels.length; i++) {
        var panel = panels[i];
        if (panel.location === 'top' || panel.location === 'botton' || panel.location === 'left' || panel.location === 'right') {
          panel.hiding = panel.hiding === 'autohide' ? 'none' : 'autohide';
        }
      }
    "
  '';
in {
  programs.plasma.shortcuts = {
    "kwin"."Window Close" = [ "Meta+Q" "Alt+F4" ];
    "services/kitty.desktop"."_launch" = "Meta+Return";
  };
  programs.plasma.hotkeys.commands = {
    "toggle-panel-autohide" = {
      name = "Toggle Panel Autohide";
      key = "Meta+B";
      command = "${togglePanelAutoHidden}";
    };
    "launch-browser" = {
      name = "Launch Browser";
      key = "Meta+W";
      command = "firefox";
    };
    "run-krunner" = {
      name = "Run KRunner";
      key = "Meta+R";
      command = "krunner";
    };
  };
}