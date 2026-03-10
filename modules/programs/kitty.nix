{ config, lib, ... }:
let
  vars = import ../../vars.nix;
  de = vars.de;
in
{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 14;
    };
    settings = {
      confirm_os_window_close = 0;
      scrollback_lines = 10000;
      enable_audio_bell = false;
      update_check_interval = 0;
      background_opacity = "0.80";
      linux_display_server = "wayland";
    } // (if de != "dms" then { background = "#242424"; } else {}); 
    extraConfig = ''
      include dank-tabs.conf
      include dank-theme.conf
    '';
  };
}
