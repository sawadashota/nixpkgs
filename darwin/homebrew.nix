{ ... }: {
  homebrew = {
    enable = true;
    global = { autoUpdate = false; };
    # will not be uninstalled when removed
    masApps = {
      Xcode = 497799835;
      Transporter = 1450874784;
      VN = 1494451650;
    };
    onActivation = {
      # "zap" removes manually installed brews and casks
      cleanup = "zap";
      autoUpdate = false;
      upgrade = false;
    };
    brews = [
      "sniffnet" # monitor network traffic
      "aws-iam-authenticator" # eks login
      "bitwarden-cli" # raycast extension does not like nix version
      "borders" # borders for windows
      "openai-whisper" # transcode audio to text

      # work
      "libmagic"
    ];
    casks = [
      # utilities
      "hiddenbar" # hides menu bar icons
      "meetingbar" # shows upcoming meetings
      "karabiner-elements" # keyboard remap
      "nikitabobko/tap/aerospace" # tiling window manager

      # coding
      "intellij-idea"

      # virtualization
      #"docker" # docker desktop

      "wireshark" # network sniffer
      "sf-symbols" # patched font for sketchybar
      "time-out" # blurs screen every x mins
      "raycast" # launcher on steroids
      "keycastr" # show keystrokes on screen
      "obsidian" # zettelkasten
      "visual-studio-code" # code editor
      "zed" # vim like editor
    ];
    taps = [
      # default
      "homebrew/bundle"
      "homebrew/cask-fonts"
      "homebrew/services"
      # custom
      "FelixKratz/formulae" # borders
    ];
  };
}
