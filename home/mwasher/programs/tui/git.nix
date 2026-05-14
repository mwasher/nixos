{ lib, config, ... }:

let
  cfg = config.local.git;
in
{
  options.local.git.enable = lib.mkEnableOption "Enables the 'git' version control utility";

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "Matt Washer";
          email = "github@mwasher.com";
        };
      };
    };
  };
}
