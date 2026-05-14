{ lib, config, ... }:

let
  cfg = config.local.hyprshot;
in
{
  options.local.hyprshot.enable = lib.mkEnableOption "Enables the 'hyprshot' screen snipping tool";

  config = lib.mkIf cfg.enable {
    programs.hyprshot = {
      enable = true;
    };
  };
}
