{ inputs, pkgs, ... }:
{
  imports = [
    inputs.zapret.nixosModules.default
  ];

  services.zapret-discord-youtube = {
    enable = true;
    config = "general(ALT5)";

    # Блокируем только Discord и YouTube
    listGeneral = [
      "discord.com"
      "discord.gg"
      "discordapp.com"
      "discord.media"
      "cdn.discordapp.com"
      "youtube.com"
      "www.youtube.com"
      "m.youtube.com"
      "youtu.be"
      "ytimg.com"
      "googlevideo.com"
    ];

    # Исключаем всё остальное
    listExclude = [
      "github.com"
      "raw.githubusercontent.com"
      "developer.mozilla.org"
      "accounts.google.com"
      "google.com"
      "gstatic.com"
      "cloudflare.com"
      "fastly.com"
      "nixos.org"
    ];

    # Оставляем ipset пустым, чтобы блокировка была только по доменам
    ipsetAll = [];
    ipsetExclude = [];
  };
}

