{ inputs, pkgs, config, osConfig, ... }:

{
  home = {
    stateVersion = "25.11";  
    username = osConfig.system.username;
    homeDirectory = osConfig.system.homeDir;
    sessionPath = [
      "${osConfig.system.homeDir}/.local/bin"
    ];
    sessionVariables = {
        GOPATH = "${osConfig.system.homeDir}/.go";

        XDG_CONFIG_HOME = "${osConfig.system.xdg.configHome}";
        XDG_DATA_HOME = "${osConfig.system.xdg.dataHome}";
        XDG_STATE_HOME = "${osConfig.system.xdg.stateHome}";
        XDG_CACHE_HOME = "${osConfig.system.xdg.cacheHome}";

        ZSH_CACHE_DIR = "${osConfig.system.xdg.cacheHome}/zsh";
    };
    packages = with pkgs; [
      tmux
      curl
      waybar
      hyprpaper
      spotify
      go
    ];

  };

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${osConfig.system.dotDir}/nvim";

  imports = [ 
    ./programs/base
    ./programs/tui
    ./programs/gui
  ];

  local.hyprland.enable = true;
  local.eza.enable = true;
  local.bat.enable = true;
  local.git.enable = true;
  local.ripgrep.enable = true;
  local.neovim-nightly.enable = true;
  local.wezterm.enable = true;
  local.zsh.enable = true;
  local.starship.enable = true;
  local.zen-browser.enable = true;
  local.hyprshot.enable = true;
  local.hyprpaper.enable = true;
}

