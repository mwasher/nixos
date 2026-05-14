{ inputs, pkgs, lib, config, osConfig, ... }:

let
  cfg = config.local.eza;
in
{
  options.local.eza.enable = lib.mkEnableOption "Enables the 'eza' file listing utility";

  config = lib.mkIf cfg.enable {
    programs.eza = {
      enable = true;
      enableZshIntegration = true;
      icons = "always";
      git = true;
      extraOptions = [
        "-gb"
        "--group-directories-last"
      ];
    };

    home.file."${osConfig.system.xdg.configHome}/eza/theme.yml" = {
      source = "${inputs.dotfiles}/eza/theme.yml";
    };
  };
}
