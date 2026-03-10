{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    nodejs_20
    nodePackages.pnpm
    git
    eslint
    prettier
    lolcat
    figlet
  ];

  shellHook = ''
    clear
    if [ -d "$HOME/dev/frontend" ]; then
      cd "$HOME/dev/frontend"
    else
      mkdir -p "$HOME/dev/frontend"
      cd "$HOME/dev/frontend"
    fi

    export PATH="${pkgs.figlet}/bin:${pkgs.lolcat}/bin:$PATH"

    figlet -f slant "Welcome to frontend!" | lolcat

    export PATH="${pkgs.nodePackages.pnpm}/bin:$PATH"

    create-vite() {
      pnpm create vite "$@"
    }

    echo "Используй: create-vite чтобы создать новый проект"
    echo "pnpm: $(pnpm -v), node: $(node -v)"
  '';
}

