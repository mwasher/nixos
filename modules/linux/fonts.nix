{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = false;
    packages = import ../base/fonts.nix { inherit pkgs; };
    fontconfig = {
      defaultFonts = {
        serif = [
          "Noto Serif"
        ];
        sansSerif = [
          "Noto Sans"
        ];
        monospace = [ "Iosevka Nerd Font" ];
        emoji = [ "Noto Color Emoji" ];
      };
      antialias = true;
    };
  };
}
