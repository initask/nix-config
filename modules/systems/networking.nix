{ lib, config, pkgs, ... }:
{
  options.core.networking.enable =
    lib.mkEnableOption "enable networking";

  config = lib.mkIf config.core.networking.enable {
    networking.hostName = "nixos";
    networking.networkmanager.enable = true;

    networking.networkmanager.dns = "default";
    networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];

    networking.firewall = {
      enable = true;
      allowedTCPPorts = [ 80 443 1080 25510 53 ];
      allowedUDPPorts = [ 53 1194 443 51820 ]; 
      allowedUDPPortRanges = [
        { from = 4000; to = 4010; }
        { from = 8000; to = 8020; }
        { from = 50000; to = 60000; }
      ];
    };

    programs.wireshark.enable = true;
    programs.wireshark.package = pkgs.wireshark;
  };
}

