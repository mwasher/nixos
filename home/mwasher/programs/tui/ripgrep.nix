{ lib, config, ... }:

let
  cfg = config.local.ripgrep;
in
{
  options.local.ripgrep.enable = lib.mkEnableOption "Enables the 'ripgrep' line search utility";

  config = lib.mkIf cfg.enable {
    programs.ripgrep.enable = true;
  };
}

