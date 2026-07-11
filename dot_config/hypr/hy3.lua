local mod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Binds/ for more
hl.bind(mod .. " + T", hl.dsp.exec_cmd(TERMINAL))
hl.bind(mod .. " + C", hl.dsp.window.close())
hl.bind(mod .. " + space", hl.dsp.exec_cmd(MENU))
hl.bind(mod .. " + SHIFT + q", hl.dsp.exec_cmd("hyprlock"))

local hy3 = hl.plugin.hy3

hl.bind(mod .. " + tab", hy3.toggle_focus_layer())
hl.bind(mod .. " + SHIFT + tab", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mod .. "+d", hy3.make_group("h"))
hl.bind(mod .. "+s", hy3.make_group("v"))
hl.bind(mod .. "+z", hy3.make_group("tab"))
hl.bind(mod .. "+a", hy3.change_focus("raise"))
hl.bind(mod .. "+SHIFT+a", hy3.change_focus("lower"))
hl.bind(mod .. "+x", hy3.lock_tab())
hl.bind(mod .. "+f", hy3.expand("expand"))
hl.bind(mod .. "+SHIFT+f", hy3.expand("base"))
hl.bind(mod .. "+r", hy3.change_group("opposite"))
hl.bind(mod .. "+SHIFT+r", hy3.change_group("untab"))

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize())
hl.bind("mouse_down", hy3.focus_tab({ direction = "l", mouse = "require_hovered", wrap = true}))
hl.bind("mouse_up", hy3.focus_tab({ direction = "r", mouse = "require_hovered", wrap = true }))
hl.bind(mod .. " + q", hy3.warp_cursor())

hl.bind(mod .. " + i", hl.dsp.exec_cmd("hyprctl keyword plugin:hy3:tabs:height 20"))
hl.bind(mod .. " + i", hl.dsp.exec_cmd("hyprctl keyword plugin:hy3:tabs:render_text true"))
hl.bind(mod .. " + o", hl.dsp.exec_cmd("hyprctl keyword plugin:hy3:tabs:height 20"))
hl.bind(mod .. " + o", hl.dsp.exec_cmd("hyprctl keyword plugin:hy3:tabs:render_text true"))

hl.bind(mod .. " + o", hl.dsp.exec_cmd("hyprctl keyword plugin:hy3:tabs:height 2"), { release = true })
hl.bind(mod .. " + o", hl.dsp.exec_cmd("hyprctl keyword plugin:hy3:tabs:render_text false"), { release = true })

hl.bind(mod .. " + h", hy3.move_focus("l"))
hl.bind(mod .. " + j", hy3.move_focus("d"))
hl.bind(mod .. " + k", hy3.move_focus("u"))
hl.bind(mod .. " + l", hy3.move_focus("r"))
hl.bind(mod .. " + left", hy3.move_focus("l"))
hl.bind(mod .. " + down", hy3.move_focus("d"))
hl.bind(mod .. " + up", hy3.move_focus("u"))
hl.bind(mod .. " + right", hy3.move_focus("r"))

hl.bind(mod .. "+SHIFT+h", hy3.move_window("l", { once = true }))
hl.bind(mod .. "+SHIFT+j", hy3.move_window("d", { once = true }))
hl.bind(mod .. "+SHIFT+k", hy3.move_window("u", { once = true }))
hl.bind(mod .. "+SHIFT+l", hy3.move_window("r", { once = true }))
hl.bind(mod .. "+SHIFT+left", hy3.move_window("l", { once = true }))
hl.bind(mod .. "+SHIFT+down", hy3.move_window("d", { once = true }))
hl.bind(mod .. "+SHIFT+up", hy3.move_window("u", { once = true }))
hl.bind(mod .. "+SHIFT+right", hy3.move_window("r", { once = true }))

local resize_amount = 30
hl.bind(mod .. "+CTRL+l", hl.dsp.window.resize({x = resize_amount, y = 0, relative = true}))
hl.bind(mod .. "+CTRL+h", hl.dsp.window.resize({x = "-" .. resize_amount, y = 0, relative = true}))
hl.bind(mod .. "+CTRL+k", hl.dsp.window.resize({x = 0, y = resize_amount, relative = true}))
hl.bind(mod .. "+CTRL+j", hl.dsp.window.resize({x = 0, y = "-" .. resize_amount, relative = true}))
hl.bind(mod .. "+CTRL+r", hy3.equalize({scope = "workspace"}))

-- Switch workspaces with mod + [0-9]
hl.bind(mod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mod .. " + 0", hl.dsp.focus({ workspace = 10 }))

-- Move focus to workspaces with mod + shift + [0-9]
hl.bind(mod .. "+SHIFT + 1", hy3.move_to_workspace("1"))
hl.bind(mod .. "+SHIFT + 2", hy3.move_to_workspace("2"))
hl.bind(mod .. "+SHIFT + 3", hy3.move_to_workspace("3"))
hl.bind(mod .. "+SHIFT + 4", hy3.move_to_workspace("4"))
hl.bind(mod .. "+SHIFT + 5", hy3.move_to_workspace("5"))
hl.bind(mod .. "+SHIFT + 6", hy3.move_to_workspace("6"))
hl.bind(mod .. "+SHIFT + 7", hy3.move_to_workspace("7"))
hl.bind(mod .. "+SHIFT + 8", hy3.move_to_workspace("8"))
hl.bind(mod .. "+SHIFT + 9", hy3.move_to_workspace("9"))
hl.bind(mod .. "+SHIFT + 0", hy3.move_to_workspace("10"))

-- Switch workspace to next monitor
hl.bind(mod .. "+SHIFT + bracketleft", function() local w = hl.get_active_workspace(); if not w then return end; hl.dispatch(hl.dsp.workspace.move({ workspace = w.id, monitor = "+1" })) end)
hl.bind(mod .. "+SHIFT + bracketright", function() local w = hl.get_active_workspace(); if not w then return end; hl.dispatch(hl.dsp.workspace.move({ workspace = w.id, monitor = -1 })) end)


-- Move/resize windows with mod + LMB/RMB and dragging
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize())

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Screenlock

-- bindl=,switch:on:Lid Switch,exec,hyprlock --immediate
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("[ $(     upower -i /org/freedesktop/UPower/devices/battery_BAT0     | grep state     | awk '{print $2}'     ) == 'discharging' ]   && hyprlock --immediate"), { locked = true })


-------------------------------------------------------------------------------
-- Floating Terminal
-------------------------------------------------------------------------------


local TERM_CLASS = "special-term"
local SPECIAL = "terminal"

hl.window_rule({
  name = TERM_CLASS,
  match = {
    class = TERM_CLASS,
  },
  float = true,
  center = true,
  size = "(monitor_w*0.7) (monitor_h*0.55)",
})

hl.workspace_rule({
  workspace = "special:" .. SPECIAL,
  on_created_empty = [[
    kitty --class special-term \
      --config ~/.config/kitty/special-term.conf \
      -e sh -c 'zellij attach special-terminal || zellij --session special-terminal options --pane-frames false --show-startup-tips false'
  ]],
})

local function resize_terminal()
  local mon = hl.get_active_monitor()

  if not mon then
    return
  end

  hl.dispatch(hl.dsp.window.resize({
    window = "class:" .. TERM_CLASS,
    x = math.floor(mon.width * 0.7),
    y = math.floor(mon.height * 0.6),
  }))

  hl.dispatch(hl.dsp.window.center({
    window = "class:" .. TERM_CLASS,
  }))
end

hl.on("window.open", function(win)
  if win.class == TERM_CLASS then
    resize_terminal()
  end
end)

--------------------------------------------------------------------------------
-- Keybind
--------------------------------------------------------------------------------

hl.bind("CONTROL + grave", function()
  hl.dispatch(
    hl.dsp.workspace.toggle_special(SPECIAL)
  )
  -- Existing windows can move between monitors.
  -- New windows are handled by window.open above.
  resize_terminal()
end)
