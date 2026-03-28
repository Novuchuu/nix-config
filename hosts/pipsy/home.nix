{ config, pkgs, inputs, ... }:

{

  imports = [
  ../../modules/desktop/niri/novuchuu.nix
  ../../modules/editor/emacs/novuchuu.nix
  #../../modules/system/fonts.nix
  ];
  # 1. Essential Home Manager Settings
  home.username = "novuchuu";
  home.homeDirectory = "/home/novuchuu";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  home.stateVersion = "25.11"; 
  services.emacs.enable = true;
  services.emacs.client.enable = true;

  # 2. User-Specific Packages
  # Put tools here that only 'novuchuu' needs (not the whole system)
  home.packages = with pkgs; [
    fuzzel
    activitywatch
  ];

  # 3. Terminal Emulator (Foot)
  # Configured with your Emacs-light (White Background) theme
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono NF:size=11";
        pad = "12x12";
      };
      
      # Using 'colors-dark' for standard palette (per 2026 deprecation rules)
      colors-dark = {
        background = "ffffff"; # Pure White
        foreground = "000000"; # Black Text
        
        # Emacs-style Syntax Colors
        regular0 = "000000"; # black
        regular1 = "cd0000"; # red
        regular2 = "00cd00"; # green (comments)
        regular4 = "0000ee"; # blue (functions)
        regular5 = "cd00cd"; # magenta (keywords)
      };
    };
  };

  # 4. Git Configuration
  programs.git = {
    enable = true;
    settings.user.name = "novuchuu"; 
    settings.user.email = "novuchuu@pm.me"; 
    settings = {
      init.defaultBranch = "main";
    };
  };

  # 5. Home Manager Management
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
