{ pkgs, ... }:

{
  # This is the standard NixOS way to install fonts system-wide
  fonts.packages = with pkgs; [
    # The essential font for your Emacs 'novuchuu.el' setup
    nerd-fonts.jetbrains-mono
    
    # Secondary fonts for your 27" 1080p workspace
    nerd-fonts.iosevka
    inter
    noto-fonts-color-emoji
    font-awesome
  ];

  # Optional: Enable default font settings for better rendering
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "JetBrainsMono Nerd Font" ];
      sansSerif = [ "Inter" ];
      serif = [ "Noto Serif" ];
    };
  };
}
