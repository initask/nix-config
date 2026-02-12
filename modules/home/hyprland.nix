{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      exec-once = [
        # "dms run"
      ];
      general = {
        gaps_in = 3;
        gaps_out = 6;
        border_size = 0;
	layout = "dwindle";
      };
      decoration = {
        rounding = 16;
        rounding_power = 2;
        active_opacity = 1.0;
        inactive_opacity = 0.99;
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      input = {
        kb_layout = "us,ru";
        kb_options = "grp:win_space_toggle";
      };
      misc = {
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
      };
      "$terminal" = "kitty";
      "$fileManager" = "nautilus";
      "$menu" = "dms ipc call spotlight toggle";
      "$mod" = "SUPER";
      
      bind = [
        "$mod, RETURN, exec, $terminal"
        "$mod, Q, killactive"
        "$mod, E, exec, $fileManager"
        "$mod, V, togglefloating"
        "$mod, R, exec, $menu"
        "$mod, D, movetoworkspace, special:minimized"
        "$mod SHIFT, D, togglespecialworkspace, minimized"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

  	"$mod, left, movefocus, l"
 	"$mod, right, movefocus, r"
  	"$mod, up, movefocus, u"
  	"$mod, down, movefocus, d"
  	"$mod SHIFT, left, movewindow, l"
	"$mod SHIFT, right, movewindow, r"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };
}
