
{
  programs.starship.settings = {
    # The layout: main ** ?? [nix] [py 3.12.13]
    format = "$git_branch$git_status$nix_shell$clojure$python$golang\n$directory$character";
    
    add_newline = false;

    git_branch = {
      symbol = "";
      style = "bold #586e75"; 
      format = "[$branch]($style) ";
    };

    git_status = {
      format = "([$all_status]($style) )";
      style = "bold #657b83"; 
      # --- Emacs Mode Line Shorthand ---
      modified = "** ";   # Modified buffer star
      untracked = "?? ";  # Unknown/New file
      staged = "++ ";     # Staged for commit
      deleted = "-- ";    # File removed
      renamed = "-> ";    # File moved
      behind = "↓ ";      # You need to pull
      ahead = "↑ ";       # You need to push
      diverged = "↕ ";    # Local and Remote have split
      conflicted = "!! "; # Merge conflict (Action required!)
    };

    nix_shell = {
      symbol = "";
      format = "[\\[nix\\]]($style) ";
      style = "bold #2aa198"; 
    };

    python = {
      symbol = "";
      # Removed the extra 'v' here to prevent 'vv3.12'
      format = "[\\[py $version\\]]($style) ";
      style = "bold #2aa198";
    };

    clojure = {
      symbol = "";
      format = "[\\[clj $version\\]]($style) ";
      style = "bold #2aa198";
    };

    directory = {
      format = "[$path]($style)";
      style = "bold #268bd2"; 
      truncation_length = 3;
    };

    character = {
      format = "$symbol"; 
      success_symbol = "[\\$ ](bold #859900)"; 
      error_symbol = "[\\$ ](bold #dc322f)";
    };
  };
}
