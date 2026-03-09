{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    byedpi
    nftables
  ];

  systemd.services.byedpi = {
    description = "ByeDPI to unblock YouTube previews";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.byedpi}/bin/ciadpi -i 127.0.0.1 -p 1080 -d 1 --auto=torst -r 1+s";
      # This for bypass gov of blocked services
      Restart = "always";
    };
  };
}
