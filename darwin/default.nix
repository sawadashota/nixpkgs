{ pkgs, ... }: {
  imports = [ ./homebrew.nix ];

  environment = {
    variables = {
      EDITOR = "hx";
      VISUAL = "hx";
    };
  };

  programs = { zsh.enable = true; };

  networking = { knownNetworkServices = [ "Wi-Fi" ]; };

  fonts = { packages = with pkgs; [ pkgs.nerd-fonts.jetbrains-mono ]; };

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
        NSGlobalDomain = {
          # 1. Setting All Application Shortcuts in System Preferenece
          # 2. Check current setting by following command:
          #      defaults read -globalDomain NSUserKeyEquivalents
          NSUserKeyEquivalents = {
            "Make Concise" = "@$\\Uf709";
            "Make Friendly" = "@$\\Uf707";
            "Make Professional" = "@$\\Uf708";
            Proofread = "@$\\Uf705";
            Rewrite = "@$\\Uf706";
            "Show Writing Tools" = "@$\\Uf704";
          };
        };
        "com.apple.screencapture" = {
          location = "~/Downloads";
          type = "png";
          name = "SS";
        };
        "com.apple.symbolichotkeys" = {
          # 1. Setting Keyboard Shortcuts in System Preference
          # 2. exec following command
          #   curl -sS https://gist.githubusercontent.com/sawadashota/8e7ce32234e0f07a03e955f22ec4c0f9/raw/859339f80b34f8f8161509128f7fc959c627f6e6/export-symbolichotkeys-for-nix.sh | sh
          # 3. paste it!
          AppleSymbolicHotKeys = {
            "231" = {
              enabled = false;
              value = {
                parameters = [ 65535 65535 0 ];
                type = "standard";
              };
            };
            "12" = {
              enabled = false;
              value = {
                parameters = [ 65535 122 8650752 ];
                type = "standard";
              };
            };
            "226" = {
              enabled = false;
              value = {
                parameters = [ 65535 65535 0 ];
                type = "standard";
              };
            };
            "21" = { enabled = false; };
            "13" = {
              enabled = false;
              value = {
                parameters = [ 65535 98 8650752 ];
                type = "standard";
              };
            };
            "79" = {
              enabled = false;
              value = {
                parameters = [ 65535 123 8650752 ];
                type = "standard";
              };
            };
            "232" = {
              enabled = false;
              value = {
                parameters = [ 65535 65535 0 ];
                type = "standard";
              };
            };
            "227" = {
              enabled = false;
              value = {
                parameters = [ 65535 65535 0 ];
                type = "standard";
              };
            };
            "23" = { enabled = false; };
            "7" = {
              enabled = false;
              value = {
                parameters = [ 65535 120 8650752 ];
                type = "standard";
              };
            };
            "32" = {
              enabled = false;
              value = {
                parameters = [ 65535 126 8650752 ];
                type = "standard";
              };
            };
            "15" = { enabled = false; };
            "8" = {
              enabled = true;
              value = {
                parameters = [ 65535 99 8650752 ];
                type = "standard";
              };
            };
            "9" = {
              enabled = false;
              value = {
                parameters = [ 65535 118 8650752 ];
                type = "standard";
              };
            };
            "33" = {
              enabled = true;
              value = {
                parameters = [ 65535 125 8650752 ];
                type = "standard";
              };
            };
            "228" = {
              enabled = false;
              value = {
                parameters = [ 65535 65535 0 ];
                type = "standard";
              };
            };
            "118" = {
              enabled = false;
              value = {
                parameters = [ 65535 18 262144 ];
                type = "standard";
              };
            };
            "25" = { enabled = false; };
            "215" = {
              enabled = false;
              value = {
                parameters = [ 65535 65535 0 ];
                type = "standard";
              };
            };
            "34" = {
              enabled = true;
              value = {
                parameters = [ 65535 126 8781824 ];
                type = "standard";
              };
            };
            "17" = { enabled = false; };
            "26" = { enabled = false; };
            "175" = {
              enabled = false;
              value = {
                parameters = [ 65535 65535 0 ];
                type = "standard";
              };
            };
            "229" = {
              enabled = false;
              value = {
                parameters = [ 65535 65535 0 ];
                type = "standard";
              };
            };
            "162" = {
              enabled = false;
              value = {
                parameters = [ 65535 96 9961472 ];
                type = "standard";
              };
            };
            "35" = {
              enabled = true;
              value = {
                parameters = [ 65535 125 8781824 ];
                type = "standard";
              };
            };
            "216" = {
              enabled = false;
              value = {
                parameters = [ 65535 65535 0 ];
                type = "standard";
              };
            };
            "36" = {
              enabled = false;
              value = {
                parameters = [ 65535 103 8388608 ];
                type = "standard";
              };
            };
            "19" = { enabled = false; };
            "222" = {
              enabled = false;
              value = {
                parameters = [ 65535 65535 0 ];
                type = "standard";
              };
            };
            "163" = {
              enabled = false;
              value = {
                parameters = [ 65535 65535 0 ];
                type = "standard";
              };
            };
            "217" = {
              enabled = false;
              value = {
                parameters = [ 65535 65535 0 ];
                type = "standard";
              };
            };
            "81" = {
              enabled = false;
              value = {
                parameters = [ 65535 124 8650752 ];
                type = "standard";
              };
            };
            "64" = {
              enabled = false;
              value = {
                parameters = [ 32 49 1048576 ];
                type = "standard";
              };
            };
            "223" = {
              enabled = false;
              value = {
                parameters = [ 65535 65535 0 ];
                type = "standard";
              };
            };
            "218" = {
              enabled = false;
              value = {
                parameters = [ 65535 65535 0 ];
                type = "standard";
              };
            };
            "65" = {
              enabled = false;
              value = {
                parameters = [ 32 49 1572864 ];
                type = "standard";
              };
            };
            "159" = {
              enabled = false;
              value = {
                parameters = [ 65535 36 262144 ];
                type = "standard";
              };
            };
            "57" = {
              enabled = false;
              value = {
                parameters = [ 65535 100 8650752 ];
                type = "standard";
              };
            };
            "224" = {
              enabled = false;
              value = {
                parameters = [ 65535 65535 0 ];
                type = "standard";
              };
            };
            "219" = {
              enabled = false;
              value = {
                parameters = [ 65535 65535 0 ];
                type = "standard";
              };
            };
            "230" = {
              enabled = false;
              value = {
                parameters = [ 65535 65535 0 ];
                type = "standard";
              };
            };
            "10" = {
              enabled = false;
              value = {
                parameters = [ 65535 96 8650752 ];
                type = "standard";
              };
            };
            "59" = {
              enabled = false;
              value = {
                parameters = [ 65535 96 9437184 ];
                type = "standard";
              };
            };
            "190" = {
              enabled = false;
              value = {
                parameters = [ 113 12 8388608 ];
                type = "standard";
              };
            };
            "225" = {
              enabled = false;
              value = {
                parameters = [ 65535 65535 0 ];
                type = "standard";
              };
            };
            "11" = {
              enabled = false;
              value = {
                parameters = [ 65535 97 8650752 ];
                type = "standard";
              };
            };
          };
        };
      };
    };
    # workaround to apply AppleSymbolicHotKeys
    # https://github.com/nix-darwin/nix-darwin/issues/518#issuecomment-2691433665
    # activationScripts.postUserActivation.text = ''
    #   /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    # '';
  };
}
