{ ... }: {
  home.file.aerospace = {
    target = ".aerospace.toml";
    text = ''
      enable-normalization-flatten-containers = false
      enable-normalization-opposite-orientation-for-nested-containers = false

      [gaps]
      inner.horizontal = 0
      inner.vertical   = 0
      outer.left       = 0
      outer.bottom     = 0
      outer.top        = 0
      outer.right      = 0

      [mode.main.binding]
      alt-j = 'focus down'
      alt-k = 'focus up'
      alt-l = 'focus right'
      alt-h = 'focus left'

      alt-shift-j = 'move down'
      alt-shift-k = 'move up'
      alt-shift-l = 'move right'
      alt-shift-h = 'move left'

      #alt-h = 'split horizontal'
      #alt-v = 'split vertical'

      alt-f = 'fullscreen'

      #alt-d = 'layout v_accordion' # 'layout stacking' in i3
      alt-d = 'layout h_accordion tiles' # 'layout tabbed' in i3
      #alt-e = 'layout tiles horizontal vertical' # 'layout toggle split' in i3

      alt-shift-space = 'layout floating tiling' # 'floating toggle' in i3

      alt-q = 'workspace 1'
      alt-w = 'workspace 2'
      alt-e = 'workspace 3'
      alt-r = 'workspace 4'
      alt-t = 'workspace 5'

      alt-shift-q = 'move-node-to-workspace 1'
      alt-shift-w = 'move-node-to-workspace 2'
      alt-shift-e = 'move-node-to-workspace 3'
      alt-shift-r = 'move-node-to-workspace 4'
      alt-shift-t = 'move-node-to-workspace 5'

      alt-shift-c = 'reload-config'

      [workspace-to-monitor-force-assignment]
      1 = 'main'
      2 = 'main'
      3 = 'main'
      4 = 'main'
      5 = ['built-in', 'secondary', 'main']

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

      # business communication
      [[on-window-detected]]
      if.app-name-regex-substring = 'zoom'
      run = 'move-node-to-workspace 5'

      [[on-window-detected]]
      if.app-name-regex-substring = 'slack'
      run = 'move-node-to-workspace 5'
    '';
  };
}
