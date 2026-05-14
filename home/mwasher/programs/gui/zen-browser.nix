{ inputs, pkgs, lib, config, ... }:

let
  cfg = config.local.zen-browser;
in
{
  options.local.zen-browser.enable = lib.mkEnableOption "Enables the 'zen' browser";

  imports = [
    inputs.zen-browser.homeModules.beta
  ];
  
  config = lib.mkIf cfg.enable {
    programs.zen-browser = {
      enable = true;

      profiles = {
        default = {
          extensions.packages = 
            with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
              ublock-origin
              bitwarden
            ];
          settings = {
            "browser.aboutConfig.showWarning" = false;
            "browser.shell.checkDefaultBrowser" = false;
            "browser.tabs.allow_transparent_browser" = true;
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            "widget.transparent-windows" = true;
            "zen.widget.linux.transparency" = true;
            "zen.theme.gradient.show-custom-colors" = true;
            "zen.theme.acrylic-elements" = true;
            "zen.theme.content-element-separation" = 0;
            "zen.view.grey-out-inactive-windows" = false;
          };
          mods = [
            "a6335949-4465-4b71-926c-4a52d34bc9c0" # Better Find Bar
            "e122b5d9-d385-4bf8-9971-e137809097d0" # No Top Sites
          ];
        };
      };

      policies = {
        AutofillAddressEnabled = true;
        AutofillCreditCardEnabled = false;
        DisableAppUpdate = true;
        DisableFeedbackCommands = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        OfferToSaveLogins = false;
        DontCheckDefaultBrowser = true;
        NoDefaultBookmarks = true;
      };
    };
  };
}
