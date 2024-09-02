{ pkgs, pkgs-zsh-fzf-tab, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    autocd = true;
    dotDir = ".config/zsh";
    autosuggestion.enable = true;

    history = {
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true; # ignore commands starting with a space
      save = 10000;
      size = 10000;
      share = true;
    };

    initExtra = ''
      [ -f ~/.env/env.sh ] && source ~/.env/env.sh

      # used for homebrew
      export XDG_DATA_DIRS=$XDG_DATA_DIRS:/opt/homebrew/share

      # used for RTL AWS login
      [ -f ~/.aws/env.sh ] && source ~/.aws/env.sh

      source ${pkgs.asdf-vm}/share/asdf-vm/asdf.sh

      bindkey "^A" beginning-of-line
      bindkey "^E" end-of-line
      bindkey '^V' edit-command-line
      bindkey '^ ' autosuggest-accept
      bindkey '^f' fzf-file-widget

      function gsm() { git submodule foreach "$* || :" }

      function peco-ghq () {
        local selected_dir=$(ghq list | peco --query "$LBUFFER")
        BUFFER="cd $(ghq root)/$selected_dir"
        CURSOR=$#BUFFER
        zle reset-prompt
      }
      zle -N peco-ghq
      bindkey '^g' peco-ghq

      function peco-history-selection() {
          BUFFER=$(history -n 1 | tac  | awk '!a[$0]++' | peco)
          CURSOR=$#BUFFER
          zle reset-prompt
      }

      zle -N peco-history-selection
      bindkey '^h' peco-history-selection
    '';

    shellAliases = {
      tree = "tree -N";
      psf = "ps -aux | grep";
      lsf = "ls | grep";
      tssh = "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null";
      socks = "ssh -D 1337 -q -C -N";
      prox =
        "export http_proxy=socks5://127.0.0.1:1337 https_proxy=socks5://127.0.0.1:1337";

      # clean
      dklocal =
        "docker run --rm -it -v `PWD`:/usr/workdir --workdir=/usr/workdir";
      dkclean = "docker container rm $(docker container ls -aq)";

      gclean =
        "git fetch -p && for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do git branch -D $branch; done";
      weather = "curl -4 http://wttr.in/Tokyo";

      # zellij
      zj = "zellij";
      zjw = "zellij -l welcome";

      # nix
      ne = "nvim -c ':cd ~/.nixpkgs' ~/.nixpkgs";
      nf = "nix run nix-darwin -- switch --flake ~/.nixpkgs";
      clean =
        "nix-collect-garbage -d && nix-store --gc && nix-store --verify --check-contents && nix store optimise";
      nsh = "nix-shell";
      nse = "nix search nixpkgs";
    };

    plugins = [
      {
        name = "fast-syntax-highlighting";
        src = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions";
      }
      {
        name = "zsh-nix-shell";
        src = "${pkgs.zsh-nix-shell}/share/zsh-nix-shell";
      }
      {
        name = "forgit";
        src = "${pkgs.zsh-forgit}/share/zsh/zsh-forgit";
      }
      {
        name = "fzf-tab";
        src = "${pkgs-zsh-fzf-tab.zsh-fzf-tab}/share/fzf-tab";
      }
    ];
    prezto = {
      enable = true;
      caseSensitive = false;
      utility.safeOps = true;
      editor = {
        dotExpansion = true;
        keymap = "vi";
      };
      pmodules = [ "autosuggestions" "directory" "editor" "git" "terminal" ];
    };
  };
}
