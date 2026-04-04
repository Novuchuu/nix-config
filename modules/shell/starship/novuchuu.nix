{
  programs.starship.settings = {
    # The layout: main [modified] [nix] [clj 1.12.0]
    format = "$git_branch$git_status$nix_shell$clojure$golang$python\n$directory$character";
    
    add_newline = false;

    git_branch = {
      symbol = "";
      style = "bold white";
      format = "[$branch]($style) ";
    };

    git_status = {
      format = "([$all_status]($style) )";
      style = "bold white";
      modified = "modified";
      staged = "staged";
      untracked = "untracked";
    };

    nix_shell = {
      symbol = "";
      format = "[[nix]]($style) ";
      style = "bold white";
    };

    clojure = {
      symbol = "";
      format = "[[clj $version]]($style) ";
      style = "bold white";
    };

    python = {
      symbol = "";
      format = "[[py $version]]($style) ";
      style = "bold white";
    };

    golang = {
      symbol = "";
      format = "[[go $version]]($style) ";
      style = "bold white";
    };

    directory = {
      format = "[$path]($style) ";
      style = "bold blue";
      truncation_length = 3;
    };

    character = {
      success_symbol = "[$ ](bold white)";
      error_symbol = "[$ ](bold red)";
    };
  };
}
