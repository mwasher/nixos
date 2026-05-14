{ lib, config, pkgs, ... }:

let
  cfg = config.local.bat;
in
{
  options.local.bat.enable = lib.mkEnableOption "Enables the 'bat' alternative cat utility";

  config = lib.mkIf cfg.enable {
    programs.bat = {
      enable = true;
      config = {
        theme = "ansi";
      };
    };
  };
}

