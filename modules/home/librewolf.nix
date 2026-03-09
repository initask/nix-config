{ pkgs, config, lib, ... }:
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    profiles = {
      "user" = {
        id = 0;
        isDefault = true;
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          sponsorblock
          darkreader
          tampermonkey
          foxyproxy-standard
          i-dont-care-about-cookies
	  simple-dark-vlasak
	  vimium
	  plasma-integration
        ];
      };
    };
  };
}
