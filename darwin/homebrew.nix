{ ... }: {
  homebrew = {
    enable = true;
    global = { autoUpdate = false; };
    # will not be uninstalled when removed
    masApps = {
      Xcode = 497799835;
      Yoink = 457622435;
    };
    onActivation = {
      # "zap" removes manually installed brews and casks
      cleanup = "zap";
      autoUpdate = false;
      upgrade = false;
    };
    brews = [
      "sniffnet" # monitor network traffic
      #"aws-iam-authenticator" # eks login
      #"borders" # borders for windows
      "openai-whisper" # transcode audio to text
      "ykman"

      "docker"
      "docker-machine"
      "colima"

      # work
      "libmagic"

      "nginx"
    ];
    casks = [
      "wezterm"
      "cmd-eikana"
      "google-japanese-ime"
      "keybase"
      "google-chrome"
      "firefox"
      "slack"
      "zoom"

      # utilities
      "1password"
      "1password-cli"
      "hiddenbar" # hides menu bar icons
      "meetingbar" # shows upcoming meetings
      #"karabiner-elements" # keyboard remap
      "nikitabobko/tap/aerospace" # tiling window manager
      "caffeine"

      # coding
      "jetbrains-toolbox"

      # virtualization
      #"docker" # docker desktop

      "wireshark" # network sniffer
      "sf-symbols" # patched font for sketchybar
      "time-out" # blurs screen every x mins
      "raycast" # launcher on steroids
      #"keycastr" # show keystrokes on screen
      #"obsidian" # zettelkasten
      "visual-studio-code" # code editor
      "zed" # vim like editor
      "yubico-authenticator"
    ];
    taps = [
      # default
      "homebrew/bundle"
      #"homebrew/cask-fonts"
      "homebrew/services"
      # custom
      "FelixKratz/formulae" # borders
    ];
  };
}
