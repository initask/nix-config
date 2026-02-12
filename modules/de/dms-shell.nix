{ pkgs, config, inputs, ... }: {
  programs.dms-shell = {
    enable = true;

    systemd = {
      enable = true;             # Systemd service for auto-start
      restartIfChanged = true;   # Auto-restart dms.service when dms-shell changes
    };
  
  # Core features
    enableSystemMonitoring = true;     # System monitoring widgets (dgop)
    enableClipboardPaste = true;            # Clipboard history manager
    enableVPN = true;                  # VPN management widget
    enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
    enableAudioWavelength = true;      # Audio visualizer (cava)
    enableCalendarEvents = true;       # Calendar integration (khal)
  };
  services.displayManager.gdm.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  services.displayManager.defaultSession = "hyprland";
  environment.systemPackages = [
    pkgs.nautilus
  ];
}

