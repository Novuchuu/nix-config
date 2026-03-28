{ pkgs, ... }:

{
  # We define the package here for the system service
  services.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk; 
  };
  
  # This makes 'emacsclient' available in your terminal globally
  environment.systemPackages = [ pkgs.emacs-pgtk ];
}
