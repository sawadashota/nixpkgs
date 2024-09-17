{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  home.file.use_mise = {
    target = ".config/direnv/lib/use_mise.sh";
    text = ''
      use_mise() {
        direnv_load mise direnv exec
      }
    '';
  };
}
