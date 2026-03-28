{ pkgs, ... }:

{
  # 1. Enable the Niri binary and session files
  programs.niri.enable = true;

  # 2. Graphics Drivers (Crucial for a smooth Wayland experience)
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # 3. Portals (Required for screen sharing and Emacs-pgtk dialogs)
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
    config.common.default = "gtk";
  };

  # 4. Essential System Packages for any Wayland session
  environment.systemPackages = with pkgs; [
    wl-clipboard  # System-wide copy/paste
    wayland-utils # Diagnostics
    xwayland      # For older apps that don't support Wayland yet
  ];
}
