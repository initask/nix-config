{ ... }:{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases =
      let
        flakeDir = "/etc/nixos/";
        host = "initask";    # FIXME replace with your hostname
        user = "initask"; # FIXME replace with your username
      in {

      rebulid = "sudo nixos-rebuild switch";
      home-switch = "sudo home-manager switch";

      conf = "sudo nvim ${flakeDir}";

      ll = "ls -l";
      devfront = "nix-shell /etc/nixos/modules/devshells/frontend-shell.nix"; 
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
      theme = "agnoster";
    };
  };
}
