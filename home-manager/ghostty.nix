{ ... }: {
  # intall via homebrew
  # programs.ghostty = {
  #   enable = false;
  # };
  xdg.configFile."ghostty/config".source = ./ghostty/config;
}
