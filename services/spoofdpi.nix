{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [spoofdpi];

  systemd.services.spoof-dpi = {
    description = "Spoof DPI service";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.spoofdpi}/bin/spoofdpi -addr 0.0.0.0 -port 8080 -silent";
      Restart = "always";
      RestartSec = "5s";
      StandardOutput = "journal";
      StandardError = "journal";
    };
  };

  # environment.sessionVariables = {
  #   http_proxy  = "http://127.0.0.1:8080";
  #   https_proxy = "http://127.0.0.1:8080";
  #   all_proxy   = "http://127.0.0.1:8080";
  #   no_proxy    = "localhost,127.0.0.1,*.lan,discord.com,gateway.discord.gg";
  # };
}
