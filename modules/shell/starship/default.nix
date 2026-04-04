{ pkgs, ... }:

{
  imports = [
    ./novuchuu.nix  # This pulls in your specific configuration
  ];

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };

  # Make sure Bash is actually managed by Nix so the hook works
  programs.bash.enable = true;
}
