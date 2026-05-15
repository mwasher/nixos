{ inputs, lib, config, osConfig, ... }:

let
  cfg = config.local.hyprpaper;
in
{
  options.local.hyprpaper.enable = lib.mkEnableOption "Enables the 'hyprpaper' wallpaper manager";

  config = lib.mkIf cfg.enable {
    services.hyprpaper = {
      enable = true;
      settings = {
        splash = false;
        wallpaper = [
          {
            monitor = "";
            path = "${inputs.dotfiles}/artifacts/wallpaper.png";
          }
        ];
      };
    };
  };
}
