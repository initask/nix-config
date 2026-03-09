# /etc/nixos/services/virtualmic.nix

{ config, lib, pkgs, ... }:  # Нужный формат для NixOS конфигурации

{
  services.pipewire = {
    enable = true;
    extraConfig.pipewire = {
      # Подключаем модуль для loopback
      context.modules = [
        # Модуль для AudioRelay Virtual Mic
        {
          name = "libpipewire-module-loopback";
          args = {
            "node.description" = "AudioRelay Virtual Mic";
            "capture.props" = {
              "node.name" = "audiorelay_virtual_mic_sink";  # Название устройства захвата
              "media.class" = "Audio/Sink";
            };
            "playback.props" = {
              "node.name" = "audiorelay_virtual_mic";      # Название устройства воспроизведения
              "media.class" = "Audio/Source";
            };
          };
        }

        # Добавляем соединение между capture_2 и playback_2 (monitor_2)
        {
          name = "libpipewire-module-loopback";
          args = {
            "node.description" = "Loopback for capture_2 to playback_2 and monitor_2";
            "capture.props" = {
              "node.name" = "capture_2";                    # Захват
              "media.class" = "Audio/Source";
            };
            "playback.props" = {
              "node.name" = "playback_2";                   # Воспроизведение
              "media.class" = "Audio/Sink";
            };
            "monitor.props" = {
              "node.name" = "monitor_2";                    # Монитор
              "media.class" = "Audio/Monitor";
            };
          };
        }
      ];
    };
  };
}
