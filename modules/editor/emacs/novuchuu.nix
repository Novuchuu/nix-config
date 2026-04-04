{ pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk; # Wayland/Niri native support

    extraPackages = epkgs: with epkgs; [
      use-package    # The logic engine for your .el file
      vterm          # Real terminal inside Emacs
      magit          # Git management
      nix-mode       # Highlighting for these Nix files
      emms           # Music player
      which-key      # Command discovery
      pdf-tools      # Textbook reader
      org            # Notes for Security+
      go-mode        # boot.dev coding
      python-mode    # Python support
      corfu          # autocomplete UI
      flycheck       # Real-time syntax checking
      org-journal    # Daily Journal
      clojure-mode
      cider
      paredit
      flycheck-clj-kondo
    ];

    # Link to your behavioral config
    extraConfig = builtins.readFile ./novuchuu.el;
  };
}
