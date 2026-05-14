{ lib, pkgs, config, ... }:

{
  options.system = {
    username = lib.mkOption {
      type = lib.types.str;
      default = "mwasher";
    };
    homeDir = lib.mkOption {
      type = lib.types.str;
      default =
        if pkgs.stdenv.isDarwin then
          "/Users/${config.system.username}"
        else
          "/home/${config.system.username}";
    };
    dotDir = lib.mkOption {
      type = lib.types.str;
      default = "${config.system.homeDir}/.dotfiles";
    };

    xdg = lib.mkOption {
      type = lib.types.submodule {
        options = {
          configDir = lib.mkOption {
            type = lib.types.str;
            default = ".config";
          };
          configHome = lib.mkOption {
            type = lib.types.str;
            default = "${config.system.homeDir}/${config.system.xdg.configDir}";
          };
          dataHome = lib.mkOption {
            type = lib.types.str;
            default = "${config.system.homeDir}/.local/share";
          };
          stateHome = lib.mkOption {
            type = lib.types.str;
            default = "${config.system.homeDir}/.local/state";
          };
          cacheHome = lib.mkOption {
	          type = lib.types.str;
            default = "${config.system.homeDir}/.cache";
          };
        };
      };
      default = { };
    };
  };
}
