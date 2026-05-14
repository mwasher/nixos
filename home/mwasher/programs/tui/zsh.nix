{ lib, config, osConfig, ... }:

let
  cfg = config.local.zsh;
in
{
  options.local.zsh.enable = lib.mkEnableOption "Enables the 'zsh' shell";

  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;

      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;

      syntaxHighlighting.styles = {
        path = "none";
        path_prefix = "none";
      };

      history = {
        size = 50000;
        save = 50000;
        ignoreAllDups = true;
        append = true;
        share = true;
        path = "${osConfig.system.xdg.configHome}/zsh/history";        
      };

      shellAliases = {
        cat = "bat";
        grep = "grep --color=auto";
      };

      dotDir = "${osConfig.system.xdg.configHome}/zsh";

      initContent = ''
        echo '\e[1 q'
        setopt PROMPT_SUBST

        bindkey -v
        bindkey '^ ' autosuggest-accept
        bindkey "^[[H"  beginning-of-line
        bindkey "^[[F"  end-of-line
        bindkey "^[[3~" delete-char
        bindkey "^R"    history-incremental-search-backward
      '';
    };

    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
