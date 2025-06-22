{ ... }: {
  homebrew = {
    enable = true;
    global = { autoUpdate = true; };
    # will not be uninstalled when removed
    masApps = {
      Xcode = 497799835;
      Yoink = 457622435;
    };
    onActivation = {
      # "zap" removes manually installed brews and casks
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
    brews = [
      "sniffnet" # monitor network traffic
      #"aws-iam-authenticator" # eks login
      #"borders" # borders for windows
      # "openai-whisper" # transcode audio to text
      "ykman"
      "git-town"

      "docker"

      # cloud
      "awscli"
      "aws-sam-cli"
      "terraform"

      # protocol buffers
      "protobuf"
      "buf"

      # work
      "libmagic"

      "nginx"

      "go"

      #"ory/tap/cli"
    ];
    casks = [
      "ghostty"
      "wezterm"
      "cmd-eikana"
      "google-japanese-ime"
      "keybase"
      "google-chrome"
      "firefox"
      "slack"
      "zoom"

      # utilities
      # "1password"
      "1password-cli"
      "hiddenbar" # hides menu bar icons
      "meetingbar" # shows upcoming meetings
      # "nikitabobko/tap/aerospace" # tiling window manager
      "caffeine"

      # coding
      "jetbrains-toolbox"

      # virtualization
      #"docker" # docker desktop
      "orbstack"

      "wireshark" # network sniffer
      "sf-symbols" # patched font for sketchybar
      "raycast" # launcher on steroids
      #"keycastr" # show keystrokes on screen
      #"obsidian" # zettelkasten
      "visual-studio-code" # code editor
      "zed" # vim like editor
      "yubico-authenticator"
      "figma"
    ];
    taps = [
      # default
      "homebrew/bundle"
      #"homebrew/cask-fonts"
      "homebrew/services"
      # custom
      # "FelixKratz/formulae" # borders
    ];
  };
}
