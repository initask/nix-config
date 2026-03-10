{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    plugins = [
      pkgs.hyprlandPlugins.hyprscrolling
    ];
    settings = {
      plugin = {
        hyprscrolling = {
          active = true;
	  mode = 1;
	  column_width = 0.8;
	  gaps_out = 6;
        };
      };	
      exec-once = [
        # "dms run"
        # "hyprctl plugin load ${pkgs.hyprlandPlugins.hyprscrolling}/lib/libhyprscrolling.so"
      ];
      general = {
        gaps_in = 4;
        gaps_out = 8;
        border_size = 1;
        "col.active_border" = "rgba(ffffff1a)";
        "col.inactive_border" = "rgba(00000000)";
        layout = "dwindle";
      };
      decoration = {
        rounding = 12;
        rounding_power = 2.0;
        active_opacity = 1.0;
        inactive_opacity = 0.99;
        shadow = {
          enabled = true;
          range = 30;
          render_power = 3;
          color = "rgba(00000066)";
          offset = "0 10";
        };
        blur = {
          enabled = true;
          size = 5;
          passes = 3;
          new_optimizations = true;
        };
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
      "$control-center" = "dms ipc call control-center toggle";
      "$bar" = "dms ipc call bar toggleAutoHide index 0";
      "$mod" = "SUPER";
      
      bind = [
        "$mod, RETURN, exec, $terminal"
        "$mod, Q, killactive"
        "$mod, E, exec, $fileManager"
        "$mod, V, togglefloating"
        "$mod, R, exec, $menu"
	"$mod, B, exec, $bar"
	"$mod, N, exec, $control-center"
        "$mod, D, fullscreen, 1"
	"$mod, F, fullscreen, 2"

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

	"$mod, H, movefocus, l"
	"$mod, L, movefocus, r"
	"$mod, K, movefocus, u"
	"$mod, J, movefocus, d"
	"$mod, left, movefocus, l"
	"$mod, right, movefocus, r"
	"$mod, up, movefocus, u"
	"$mod, down, movefocus, d"
	"$mod SHIFT, H, movewindow, l"
	"$mod SHIFT, L, movewindow, r"
	"$mod SHIFT, K, movewindow, u"
	"$mod SHIFT, J, movewindow, d"
	"$mod SHIFT, left, movewindow, l"
	"$mod SHIFT, right, movewindow, r"
	"$mod SHIFT, up, movewindow, u"
	"$mod SHIFT, down, movewindow, d"

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
      windowrule = [
        "match:class .*, rounding 12"
      ];
    };
  };
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 14;
  };
}
