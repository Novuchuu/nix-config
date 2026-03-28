{ config, lib, pkgs, ... }:

{
  # This configures Niri settings for the 'novuchuu' Home Manager profile
  programs.niri.settings = {
    
    # 1. Monitor Setup (Your 27" 1080p Screen)
    outputs."HDMI-A-2" = {
      mode = { width = 1920; height = 1080; refresh = 60.0; };
      scale = 1.0; # Keep text sharp on 1080p
    };
    outputs."eDP-1" = {
      enable = false;
    };

    # 2. Layout
    layout = {
      gaps = 12; # Space between windows for focus
      default-column-width = { proportion = 0.5; };
      border.enable = false;
      focus-ring = {
        enable = false;
       # width = 2;
       # active.color = "#74c7ec"; # Soft blue focus ring
      };
    };

    # AUTOSTART
    spawn-at-startup = [
      { command = [ "${pkgs.activitywatch}/bin/aw-qt" ]; }
    ];
    
    # 3. Keybinds (Designed for quick Emacs/Terminal access)
    binds = with config.lib.niri.actions; {
      "Mod+T".action = spawn "foot";
      "Mod+R".action = spawn "fuzzel";
      "Mod+E".action = spawn "emacsclient" "-c" "-a" ""; # Instant Emacs
      "Mod+Q".action = close-window;
      "Mod+V".action = toggle-window-floating;
      "Mod+F".action = maximize-column; 
      "Mod+M".action = maximize-column;
      "Mod+Shift+F".action = fullscreen-window;
      
      # The "Infinite Scroll" Navigation
      "Mod+Left".action = focus-column-left;
      "Mod+Shift+Left".action = move-column-left;
      "Mod+Right".action = focus-column-right;
      "Mod+Shift+Right".action = move-column-right;
      "Mod+Up".action = focus-window-or-workspace-up;
      "Mod+Down".action = focus-window-or-workspace-down;
      "Mod+Shift+Up".action = move-window-up-or-to-workspace-up;
      "Mod+Shift+Down".action = move-window-down-or-to-workspace-down;
      "Mod+Minus".action = set-column-width "-10%";
      "Mod+Equal".action = set-column-width "+10%";
      
      # Screenshot (Vital for documenting your Security+ labs)
      "Mod+P".action.screenshot-screen = { };
    };

    
    # 4. Force Wayland for Apps
    environment = {
      NIXOS_OZONE_WL = "1"; # Forces Chromium/Electron to Wayland
      MOZ_ENABLE_WAYLAND = "1"; # Forces Firefox to Wayland
    }; 
  };
 # programs.niri.extraConfig = builtins.readFile ./novuchuu.kdl;
}
