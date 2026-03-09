{ lib, config, pkgs, ... }:
{
  options.core.video.enable =
    lib.mkEnableOption "enable video";

  config = lib.mkIf config.core.video.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;

      # Современный способ включить OpenCL + Vulkan для AMD
      extraPackages = with pkgs; [
        rocmPackages.clr.icd        # OpenCL runtime (новое имя пакета)
        rocmPackages.clr            # ROCm core runtime
        vulkan-loader
        vulkan-tools
        vulkan-validation-layers
        mesa                        # включает OpenGL + OpenCL для AMD
      ];
    };

    # Gamemode — динамически повышает приоритет игр
    programs.gamemode.enable = true;
    
    environment = {
      sessionVariables = {
        NIXOS_OZONE_WL = "1"; # Enable wayland for chromium-based apps (VSCode Discord Brave)
      };
    };

    services.xserver.videoDrivers = [ "amdgpu" ]; # nvidia / amdgpu
  };
}

