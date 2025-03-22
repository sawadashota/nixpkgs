{ pkgs, ... }: {
  imports = [
    ./homebrew.nix
  ];

  environment = {
    variables = {
      EDITOR = "hx";
      VISUAL = "hx";
    };
  };

  programs = { zsh.enable = true; };

  networking = {
    knownNetworkServices = [ "Wi-Fi" ];
  };

  fonts = {
    packages = with pkgs; [
        pkgs.nerd-fonts.jetbrains-mono
    ];
  };

  security = { pam.services.sudo_local.touchIdAuth = true; };

  system = {
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };

    defaults = {
      ".GlobalPreferences"."com.apple.mouse.scaling" = 4.0;
      spaces.spans-displays = false;
      universalaccess = {
        # FIXME: cannot write universal access
        #reduceMotion = true;
        #reduceTransparency = true;
      };

      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.0;
        orientation = "bottom";
        dashboard-in-overlay = true;
        largesize = 85;
        tilesize = 70;
        magnification = false;
        launchanim = false;
        mru-spaces = false;
        show-recents = false;
        show-process-indicators = true;
        static-only = true;
      };

      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        CreateDesktop = false;
        FXDefaultSearchScope = "SCcf"; # current folder
        QuitMenuItem = true;
      };

      NSGlobalDomain = {
        _HIHideMenuBar = false;
        AppleFontSmoothing = 0;
        AppleInterfaceStyle = "Dark";
        AppleKeyboardUIMode = 3;
        AppleScrollerPagingBehavior = true;
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        # InitialKeyRepeat = 10;
        # KeyRepeat = 1;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticWindowAnimationsEnabled = false;
        NSWindowResizeTime = 0.0;
        "com.apple.sound.beep.feedback" = 0;
        "com.apple.trackpad.scaling" = 2.0;
      };
      CustomUserPreferences = {
        "com.apple.screencapture" = {
          location = "~/Downloads";
          type = "png";
          name = "SS";
        };
      };
    };
  };
}
