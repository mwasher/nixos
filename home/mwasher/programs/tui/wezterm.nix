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
      colorSchemes = {
        "Mono Glow" = {
          background = "#121212";
          foreground = "#cccccc";
          cursor_bg = "#cccccc";
          cursor_fg = "#121212";
          cursor_border = "#cccccc";
          selection_bg = "#2a2a2a";
          selection_fg = "#dddddd";
          ansi = [
            "#2a2a2a" "#ba0959" "#1bfd9c" "#b4b4b4"
            "#7a7a7a" "#708090" "#66b2b2" "#f1f1f1"
          ];
          brights = [
            "#4a4a4a" "#fd1b7c" "#66ffad" "#dddddd"
            "#aaaaaa" "#879aad" "#49c4c4" "#ffffff"
          ];
          tab_bar = {
            background = "#121212"; 
            active_tab = {
              bg_color = "#121212";
              fg_color = "#1bfd9c";
            };
            inactive_tab = {
              bg_color = "#121212";
              fg_color = "#7a7a7a";
            };
            inactive_tab_hover = {
              bg_color = "#2a2a2a";
              fg_color = "#cccccc";
            };
            new_tab = {
              bg_color = "#121212";
              fg_color = "#7a7a7a";
            };
            new_tab_hover = {
              bg_color = "#444444";
              fg_color = "#cccccc";
            };
          };
        };
      };
    };
  };
}
