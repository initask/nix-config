{ config, ... }: {
  programs.plasma.panels = [
    {
      location = "top";
      height = 40;
      floating = true;
      hiding = "autohide";
      widgets = [
        { name = "org.kde.plasma.kickoff"; config.General.icon = "nix-snowflake-white"; }
        "org.kde.plasma.icontasks"
        "org.kde.plasma.panelspacer"
        {
          name = "org.kde.plasma.systemtray";
          config.General.knownItems = [
            "org.kde.plasma.mediacontroller"
            "org.kde.plasma.manage-inputmethod"
          ];
        }
        {
          name = "org.kde.plasma.digitalclock";
          config.Appearance = {
            showDate = "true";
            use24hFormat = "0";
          };
        }
      ];
    }
  ];
}