{ inputs, pkgs, lib, config, osConfig, ... }:

let
  cfg = config.local.neovim-nightly;
in
{
  options.local.neovim-nightly.enable = lib.mkEnableOption "Enables the 'neovim' text editor (nightly build)";

  config = lib.mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      package = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default;
      sideloadInitLua = true;
      withRuby = false;
      withPython3 = false;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      plugins = [
        pkgs.vimPlugins.nvim-treesitter.withAllGrammars
      ];

      extraPackages = with pkgs; [
        tree-sitter

        gopls
        lua-language-server
        basedpyright

        stylua
        gofumpt
        ruff
      ];
    };
  };
}

