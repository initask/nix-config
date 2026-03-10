{ ... }: {
  programs.plasma = {
    powerdevil.AC = {
      displayBrightness = 100;
      autoSuspend.action = "nothing";
    };
    kscreenlocker = {
      lockOnResume = false;
      timeout = 0;
    };
    krunner = {
      position = "center";
      activateWhenTypingOnDesktop = true;
    };
    session = {
      general.askForConfirmationOnLogout = false;
      sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
    };
    configFile = {
      "baloofilerc"."Basic Settings"."Indexing-Enabled" = false;
      "ksplashrc"."KSplash"."Engine" = "none";
      "plasmashellrc"."PlasmaViews/Panel 2"."panelOpacity".value = 2;
      "plasmarc"."PanelAppearance"."Appearance".value = 2;
    };
  };
}
