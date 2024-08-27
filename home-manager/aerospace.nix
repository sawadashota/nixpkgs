{ ... }: {
  home.file.aerospace = {
    target = ".aerospace.toml";
    text = ''
      enable-normalization-flatten-containers = false
      enable-normalization-opposite-orientation-for-nested-containers = false
      start-at-login = true

      [gaps]
      inner.horizontal = 0
      inner.vertical = 0
      outer.bottom = 0
      outer.left = 0
      outer.right = 0
      outer.top = 0

      [mode.main.binding]
      alt-h = 'focus left'
      alt-j = 'focus down'
      alt-k = 'focus up'
      alt-l = 'focus right'

      alt-shift-b = 'balance-sizes'
      alt-shift-f = 'flatten-workspace-tree'

      alt-shift-h = 'move left'
      alt-shift-j = 'move down'
      alt-shift-k = 'move up'
      alt-shift-l = 'move right'

      alt-shift-i = 'join-with up'
      alt-shift-o = 'join-with right'
      alt-shift-u = 'join-with down'
      alt-shift-y = 'join-with left'

      alt-comma = 'layout accordion horizontal vertical'
      alt-slash = 'layout tiles horizontal vertical'

      alt-f = 'fullscreen'

      alt-shift-space = 'layout floating tiling' # 'floating toggle' in i3

      alt-1 = 'workspace 1'
      alt-2 = 'workspace 2'
      alt-3 = 'workspace 3'
      alt-4 = 'workspace 4'
      alt-5 = 'workspace 5'
      alt-6 = 'workspace 6'
      alt-7 = 'workspace 7'
      alt-8 = 'workspace 8'
      alt-9 = 'workspace 9'

      alt-shift-1 = 'move-node-to-workspace 1'
      alt-shift-2 = 'move-node-to-workspace 2'
      alt-shift-3 = 'move-node-to-workspace 3'
      alt-shift-4 = 'move-node-to-workspace 4'
      alt-shift-5 = 'move-node-to-workspace 5'
      alt-shift-6 = 'move-node-to-workspace 6'
      alt-shift-7 = 'move-node-to-workspace 7'
      alt-shift-8 = 'move-node-to-workspace 8'
      alt-shift-9 = 'move-node-to-workspace 9'

      # See: https://nikitabobko.github.io/AeroSpace/commands#workspace-back-and-forth
      alt-tab = 'workspace-back-and-forth'
      # See: https://nikitabobko.github.io/AeroSpace/commands#move-workspace-to-monitor
      alt-shift-tab = 'move-workspace-to-monitor --wrap-around next'

      alt-shift-c = 'reload-config'

      alt-shift-equal = 'resize smart +50'
      alt-shift-minus = 'resize smart -50'

      [workspace-to-monitor-force-assignment]
      0 = 'main'
      1 = 'main'
      2 = 'main'
      3 = 'main'
      4 = 'main'
      5 = ['built-in', 'secondary', 'main']
      6 = 'main'
      7 = 'main'
      8 = 'main'
      9 = 'main'

      # todo
      [[on-window-detected]]
      if.app-name-regex-substring = 'reminder'
      run = 'move-node-to-workspace 1'

      [[on-window-detected]]
      if.app-name-regex-substring = 'mail'
      run = 'move-node-to-workspace 1'

      [[on-window-detected]]
      if.app-name-regex-substring = 'calendar'
      run = 'move-node-to-workspace 1'

      # code
      [[on-window-detected]]
      if.app-name-regex-substring = 'intellij'
      run = 'move-node-to-workspace 2'

      [[on-window-detected]]
      if.app-name-regex-substring = 'alacritty'
      run = 'move-node-to-workspace 2'

      [[on-window-detected]]
      if.app-name-regex-substring = 'wezterm'
      run = 'move-node-to-workspace 2'

      [[on-window-detected]]
      if.app-name-regex-substring = 'chrome'
      run = 'move-node-to-workspace 2'

      [[on-window-detected]]
      if.app-name-regex-substring = 'firefox'
      run = 'move-node-to-workspace 2'

      [[on-window-detected]]
      if.app-name-regex-substring = 'code'
      run = 'move-node-to-workspace 2'

      # chat
      [[on-window-detected]]
      if.app-name-regex-substring = 'keybase'
      run = 'move-node-to-workspace 3'

      [[on-window-detected]]
      if.app-name-regex-substring = 'line'
      run = 'move-node-to-workspace 3'

      [[on-window-detected]]
      if.app-name-regex-substring = 'message'
      run = 'move-node-to-workspace 3'

      # utils
      [[on-window-detected]]
      if.app-name-regex-substring = 'music'
      run = 'move-node-to-workspace 4'

      [[on-window-detected]]
      if.app-name-regex-substring = '1password'
      run = 'move-node-to-workspace 4'

      [[on-window-detected]]
      if.app-name-regex-substring = 'yubico'
      run = 'move-node-to-workspace 4'

      # business communication
      [[on-window-detected]]
      if.app-name-regex-substring = 'zoom'
      run = 'move-node-to-workspace 5'

      [[on-window-detected]]
      if.app-name-regex-substring = 'slack'
      run = 'move-node-to-workspace 5'

      # design
      [[on-window-detected]]
      if.app-name-regex-substring = 'figma'
      run = 'move-node-to-workspace 6'

      [[on-window-detected]]
      if.app-name-regex-substring = 'whimsical'
      run = 'move-node-to-workspace 6'
    '';
  };
}
