{ ... }: {
  # intall via homebrew because broken app installed
  # programs.wezterm = {
  #   enable = false;
  #   extraConfig = builtins.readFile ./wezterm.lua;
  # };
  xdg.configFile."wezterm/wezterm.lua".source = ./wezterm.lua;
}
