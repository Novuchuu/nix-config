{ config, pkgs, ... }:

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "foot";
        font = "monospace:size=11";
        dpi-aware = "yes";
        pad = "10x10"; # Adds a little breathing room like an Emacs buffer
      };

      mouse = {
        hide-when-typing = "yes";
      };

      # Default Emacs-inspired Color Scheme
      colors-dark = {
        # Emacs default background is white/off-white (#ffffff)
        # Foreground is usually black (#000000)
        background = "ffffff"; 
        foreground = "000000";

        ## Normal colors
        regular0 = "000000"; # black
        regular1 = "cd0000"; # red
        regular2 = "00cd00"; # green (Emacs comments-ish)
        regular3 = "cdcd00"; # yellow
        regular4 = "0000ee"; # blue (Emacs function names)
        regular5 = "cd00cd"; # magenta (Emacs keywords/purple)
        regular6 = "00cdcd"; # cyan
        regular7 = "e5e5e5"; # white

        ## Bright colors (For bold text)
        bright0 = "7f7f7f"; # gray
        bright1 = "ff0000"; # red
        bright2 = "00ff00"; # green
        bright3 = "ffff00"; # yellow
        bright4 = "5c5cff"; # light blue
        bright5 = "ff00ff"; # light magenta
        bright6 = "00ffff"; # light cyan
        bright7 = "ffffff"; # white
      };
    };
  };
}
