{ pkgs, ... }: {
  imports = [
    ./zsh.nix
    ./direnv.nix
    #./zellij.nix
    ./git.nix
  ];
  home = {
    packages = with pkgs; [
      neovim # customized by overlay
      devenv

      # net tools
      bind
      nmap
      inetutils

      # core
      openssl
      wget
      curl
      fd
      ripgrep # fast search
      zstd
      pwgen

      grc # colored log output
      gitAndTools.delta # pretty diff tool
      sshfs # mount folders via ssh
      graph-easy # draw graphs in the terminal
      tealdeer # community driven man pages
      dive # analyse docker images
      hyperfine # benchmark tool
      sipcalc # ip subnet calculator
      ffmpeg # video editing and cutting
      rclone # sync files
      duf # disk usage
      httpie # awesome alternative to curl
      mongodb-tools
      #viddy # terminal watch command
      unixtools.watch # watches commands
      yq-go # yaml, toml parser
      termdown # terminal countdown
      #tmate # share terminal via web
      #silicon # create code snippets as images
      ytt # yaml templating engine
      #zk # zettelkasten
      #mask # taskrunner
      #diskonaut # explore disk size
      gnupg # gpg
      gping # ping with a graph
      #ruby # scripting language
      #corepack # node wrappers
      k6 # load testing tool
      slides # terminal presentation tool
      presenterm # presentation tool
      # asdf-vm # managing different versions
      mise
      comma # run nix binaries on demand
      peco
      ghq
      tree
      mob # mob programing tool

      # database
      pgcli
      #redis # to use the cli

      # gnu binaries
      coreutils-full # multiple tools
      gnutar
      gnused
      gnugrep
      gnumake
      gzip
      findutils
      gawk

      # programming

      ## python
      python3
      poetry # python tools

      ## node
      #deno # node runtime
      nodejs
      nodePackages.npm
      nodePackages.yarn
      #nodePackages.expo-cli

      ## golang
      gotests
      gosimports
      golangci-lint

      ## kotlin
      # ktlint
      # kotlin
      # gradle

      ## others
      lua
      shfmt
      rustup # rust
      cue
    ];

    shellAliases = {
      # builtins
      size = "du -sh";
      cp = "cp -i";
      mkdir = "mkdir -p";
      df = "df -h";
      free = "free -h";
      du = "du -sh";
      del = "rm -rf";
      lst = "ls --tree -I .git";
      lsl = "ls -l";
      lsa = "ls -a";
      null = "/dev/null";

      # overrides
      cat = "bat";
      top = "btop";
      htop = "btop";
      ping = "gping";
      diff = "delta";
      ssh = "TERM=screen ssh";
      python = "python3";
      pip = "python3 -m pip";
      venv = "python3 -m venv";
      j = "z";
      ji = "zi";

      # programs
      g = "git";
      d = "docker";
      dc = "docker-compose";
      poe = "poetry";
      tf = "terraform";
      nr = "npm run";
      py = "python";
    };

    sessionPath = [
      "$HOME/go/bin"
      "$HOME/.local/bin"
      "$HOME/.cargo/bin"
    ];

    sessionVariables = {
      EDITOR = "hx";
      VISUAL = "hx";
      NIXPKGS_ALLOW_UNFREE = "1";
    };
  };

  programs = {
    # let home-manager manage itself
    home-manager.enable = true;

    # vim alternative
    helix = {
      enable = true;
      extraPackages = with pkgs; [ nil gopls ];
      settings = {
        theme = "tokyonight";

        keys = {
          insert = { j = { k = "normal_mode"; }; };
        };

        editor = {
          line-number = "absolute";
          idle-timeout = 200;
          bufferline = "multiple";
          lsp.display-inlay-hints = true;
          cursor-shape.insert = "bar";
          file-picker.hidden = true;
          whitespace.render = "all";
          indent-guides.render = true;
          statusline = {
            mode = {
              normal = "NORMAL";
              insert = "INSERT";
              select = "SELECT";
            };
          };
        };
      };
    };

    # shell integrations are enabled by default
    zoxide.enable = true; # autojump
    jq.enable = true; # json parser
    bat.enable = true; # pretty cat
    lazygit.enable = true; # git tui
    nnn.enable = true; # file browser
    btop.enable = true; # htop alternative
    nushell.enable = true; # zsh alternative
    broot.enable = true; # browser big folders

    # sqlite browser history
    atuin = {
      enable = true;
      flags = [ "--disable-up-arrow" ];
      settings = {
        inline_height = 20;
        style = "compact";
      };
    };

    # pretty ls
    lsd = {
      enable = true;
      enableAliases = true;
    };

    go = {
      enable = true;
      package = pkgs.go_1_24;
      goPath = "go";
      goBin = "go/bin";
      goPrivate = [ ];
    };

    htop = {
      enable = true;
      settings = {
        tree_view = true;
        show_cpu_frequency = true;
        show_cpu_usage = true;
        show_program_path = false;
      };
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
      defaultCommand =
        "fd --type f --hidden --follow --exclude .git --exclude .vim --exclude .cache --exclude vendor --exclude node_modules";
      defaultOptions = [
        "--border sharp"
        "--inline-info"
      ];
    };

    # snippet manager
    pet = {
      enable = true;
      # <param=default-value> -> use variables
      snippets = [
        {
          command = "git rev-parse --short HEAD";
          description = "show short git rev";
          output = "888c0f8";
          tag = [ "git" ];
        }
        {
          description = "show size of a folder";
          command = "du -hs <folder>";
        }
      ];
    };
  };
}
