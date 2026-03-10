{ pkgs, ... }: {
  home.packages = with pkgs; [ whitesur-kde whitesur-gtk-theme ];

  programs.plasma = {
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
    };
    kwin.effects.blur = {
      enable = true;
      strength = 15;
      noiseStrength = 0;
    };
  };
}