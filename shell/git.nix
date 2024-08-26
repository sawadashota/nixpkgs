{ ... }: {
  programs.git = {
    enable = true;
    delta.enable = true;
    userName = "sawadashota";
    userEmail = "shota@sslife.tech";
    signing = {
      key = null; # gnupg decides by mail
      signByDefault = true;
    };
    aliases = {
      cm = "commit";
      ca = "commit --amend --no-edit";
      co = "checkout";
      cp = "cherry-pick";

      di = "diff";
      dh = "diff HEAD";

      pu = "pull";
      ps = "push";
      pf = "push --force-with-lease";

      st = "status -sb";
      fe = "fetch";
      gr = "grep -in";

      ri = "rebase -i";
      rc = "rebase --continue";
    };
    ignores = [
      # ide
      ".idea"
      ".vs"
      ".vsc"
      ".vscode"
      # npm
      "node_modules"
      "npm-debug.log"
      # python
      "__pycache__"
      "*.pyc"

      ".ipynb_checkpoints" # jupyter
      "__sapper__" # svelte
      ".DS_Store" # mac
      "kls_database.db" # kotlin lsp
    ];
    extraConfig = {
      init.defaultBranch = "main";
      pull = {
        ff = false;
        commit = false;
        rebase = true;
      };
      fetch = { prune = true; };
      push.autoSetupRemote = true;
      delta = { line-numbers = true; };
      ghq = { root = "~/repo/"; };
      credential = { helper = "osxkeychain"; };
    };
  };

    # GitHub CLI
  programs.gh = {
    enable = true;
    #extensions = [ gh-markdown-preview ];
    settings = {
      editor = "nvim";
    };
  };
}
