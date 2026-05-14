{ inputs, pkgs, lib, config, osConfig, ... }:

let
  cfg = config.local.starship;
in
{
  options.local.starship.enable = lib.mkEnableOption "Enables the 'starship' zsh prompt";

  config = lib.mkIf cfg.enable {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      settings = builtins.fromTOML (builtins.readFile "${inputs.dotfiles}/starship/starship.toml");
    };
  };
}

