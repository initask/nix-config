{ inputs, config, pkgs, lib, ... }:
let
  togglePanelAutoHidden = pkgs.writeShellScript "toggle-panel-hiding" ''
    dbus-send --session --dest=org.kde.plasmashell --type=method_call /PlasmaShell org.kde.PlasmaShell.evaluateScript "string:
      var panels = panels();
      for (var i = 0; i < panels.length; i++) {
        var panel = panels[i];
        if (panel.location === 'top') {
          panel.hiding = panel.hiding === 'autohide' ? 'none' : 'autohide';
        }
      }
    "
  '';
in
{
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
  ];
  home.packages = with pkgs; [
    whitesur-kde
    whitesur-gtk-theme # Для обычных приложений
  ];

  programs.plasma = {
    enable = true;
    # --- Appearance & Style ---
    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop"; 
      theme = "WhiteSur-dark";
      colorScheme = "WhiteSurDark";
      iconTheme = "breeze-dark";
      cursorTheme = "Breeze_Snow";
    };

    fonts = {
      general = { family = "Noto Sans"; pointSize = 10; };
      fixedWidth = { family = "Noto Sans"; pointSize = 10; };
      small = { family = "Noto Sans"; pointSize = 8; };
    };

    # --- Minimalist Floating Panel ---
    panels = [
      {
        location = "top";
        height = 40;
        floating = true;
        alignment = "center";
        hiding = "autohide";
        widgets = [
	  {
            name = "org.kde.plasma.kickoff";
	    config.General.icon = "nix-snowflake-white";
	  } 
          "org.kde.plasma.icontasks"

          "org.kde.plasma.panelspacer"

          {
            name = "org.kde.plasma.systemtray";
            config = {
              General = {
                extraItems = [
		  "org.kde.plasma.volume"
                  "org.kde.plasma.networkmanagement"
                  "org.kde.plasma.keyboardlayout"
                  "org.kde.plasma.bluetooth"
                ];
                knownItems = [
                  "org.kde.plasma.clipboard"
                  "org.kde.plasma.mediacontroller"
                  "org.kde.plasma.battery"
                  "org.kde.plasma.manage-inputmethod"
                ];
              };
            };
          }
	  {
            name = "org.kde.plasma.digitalclock";
            config = {
	      "Appearance" = {
                "autoFontAndSize" = "false";
                "customDateFormat" = "d/M/yy";
                "dateDisplayFormat" = "shortDate";
                "dateFormat" = "custom";
                "fontFamily" = "Noto Sans";
                "fontSize" = "12";
                "fontStyleName" = "Regular";
                "fontWeight" = "400";
                "showDate" = "true";
                "timeFormat" = "12h";
                "use24hFormat" = "0";
                "useCustomFont" = "true";
              };
              "Configuration" = {
                "popupHeight" = "451";
                "popupWidth" = "396";
              };            
	    };
          }
	];
      }
    ];

    # --- Glass Effects (Blur & Translucency) ---
    kwin = {

      effects = {
        blur = {
          enable = true;
          strength = 15;      # Интенсивность размытия (от 1 до 15)
          noiseStrength = 0;  # Зернистость (лучше 0 для "чистого" стекла)
        };
	translucency.enable = false;
      };	

      titlebarButtons.right = [ "maximize" "minimize" "close" ];
      titlebarButtons.left = [ ];
      virtualDesktops = {
        number = 2;
        rows = 1;
      };
    };

    # --- Shortcuts ---
    shortcuts = {
      "kwin" = {
        "Window Close" = [ "Meta+Q" "Alt+F4" ];
        "Overview" = "Meta+Tab";
        "ExposeClassCurrentDesktop" = "Meta+Ctrl+Down";
	"Window Fullscreen" = "Meta+F";
      };
      "services/kitty.desktop"."_launch" = "Meta+Return";
    };

    hotkeys.commands = {
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

    # --- System Behavior ---
    krunner = {
      position = "center";
      activateWhenTypingOnDesktop = true;
    };

    session = {
      general.askForConfirmationOnLogout = false;
      sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
    };

    # --- Extra Config (Transparency & Cleanup) ---
    configFile = {
      "baloofilerc"."Basic Settings"."Indexing-Enabled" = false;
      "ksplashrc"."KSplash"."Engine" = "none"; 
      "kdeglobals"."KFileDialog Settings"."View Style" = "Detail";

      "plasmashellrc"."PlasmaViews/Panel 2"."panelOpacity".value = 2;
      "plasmarc"."PanelAppearance"."Appearance".value = 2;
   }; 
   powerdevil = {
      AC = {
        # Ставим число напрямую, как просит ошибка
        displayBrightness = 100; 
        
        # Отключаем авто-сон и затемнение
        autoSuspend.action = "nothing";
        dimDisplay.enable = false;
      };

      # Для батареи (если есть) тоже ставим "ничего не делать"
      battery = {
        autoSuspend.action = "nothing";
      };
    };
    kscreenlocker = {
      lockOnResume = false;    # Не блокировать при пробуждении
      timeout = 0;             # 0 обычно отключает автоблокировку по времени
      appearance = {
        showMediaControls = false;
        wallpaperPictureOfTheDay.provider = "bing";
      };
    };
  };
}
