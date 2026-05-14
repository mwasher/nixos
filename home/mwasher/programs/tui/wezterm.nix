{ inputs, pkgs, lib, config, ... }:

let
  cfg = config.local.wezterm;
in
{
  options.local.wezterm.enable = lib.mkEnableOption "Enables the 'wezterm' terminal emulator";

  config = lib.mkIf cfg.enable {
    programs.wezterm = {
      enable = true;
      enableZshIntegration = true;
      extraConfig = builtins.readFile "${inputs.dotfiles}/wezterm/wezterm.lua";
      colorSchemes = builtins.fromTOML (builtins.readFile "${inputs.dotfiles}/wezterm/colors/monoglow_z.toml");
    };
  };
}
