{ lib, config, pkgs, ... }:
{
  options.my.hello.enable =
    lib.mkEnableOption "enable hello";

  config = lib.mkIf config.my.hello.enable {
     environment.systemPackages = with pkgs; [
       hello
     ];

  };
}

