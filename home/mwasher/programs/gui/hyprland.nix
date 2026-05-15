{ inputs, lib, config, ... }:

let
  cfg = config.local.hyprland;
in
{
  options.local.hyprland.enable = lib.mkEnableOption "Enables the 'Hyprland' compositor";

  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      extraConfig = builtins.readFile "${inputs.dotfiles}/hypr/hyprland.conf";
    };
  };
}
