--------------------------------------------------------------------------------
-- dwindle config
--------------------------------------------------------------------------------

hl.config({
  dwindle = {
      force_split                  = 0,
      preserve_split               = true,
      smart_split                  = false,
      smart_resizing               = true,
      permanent_direction_override = false,
      special_scale_factor         = 1,
      split_width_multiplier       = 1.0,
      use_active_for_splits        = true,
      default_split_ratio          = 1.0,
      split_bias                   = 0,
      precise_mouse_move           = false,
  },
})


local mod = "SUPER"
local add_shift = "+SHIFT+"


hl.bind(mod .. "+T", hl.dsp.exec_cmd(TERMINAL))
hl.bind(mod .. "+C", hl.dsp.window.close())
hl.bind(mod .. "+space", hl.dsp.exec_cmd(MENU))
hl.bind(mod .. add_shift .. "q", hl.dsp.exec_cmd("hyprlock"))

-- hl.bind(mod .. " + E", hl.dsp.exec_cmd(FILE_MANAGER))
hl.bind(mod .. add_shift .."f", hl.dsp.window.float())


-- changes the split ratio	float 
-- input: [0.1-1.9]
hl.bind(mod .. add_shift .. "equal", hl.dsp.layout("splitratio +0.1"))
hl.bind(mod .. add_shift .. "minus", hl.dsp.layout("splitratio -0.1"))
hl.bind(mod .. add_shift .. "slash", hl.dsp.layout("splitratio 1.0 exact"))

-- toggles the split (top/side) of the current window.
-- preserve_split must be enabled for toggling to work.
hl.bind(mod .. add_shift .. "A", hl.dsp.layout("togglesplit"))

-- swaps the two halves of the split of the current window
hl.bind(mod .. add_shift .."l", hl.dsp.layout("swapsplit"))
hl.bind(mod .. add_shift .."h", hl.dsp.layout("swapsplit"))

-- rotates the split of the current window by an optionally specified angle.
-- Angle must be a multiple of 90.
-- Positive numbers are clockwise, negative numbers are counter-clockwise.
-- input: angle
hl.bind(mod .. add_shift .."j", hl.dsp.layout("rotatesplit", 90))
hl.bind(mod .. add_shift .."k", hl.dsp.layout("rotatesplit", 90))

-- A one-time override for the split direction.
-- (valid for the next window to be opened, only works on tiled windows)
-- input: direction
-- hl.bind(mod .. "+A", hl.dsp.layout("preselect"))

-- moves the selected window (active window if unspecified) to the root of its workspace tree.
-- The default behavior maximizes the window in its current subtree.
-- If unstable is provided as the second argument, the window will be swapped with the other subtree instead.
-- It is not possible to only provide the second argument, but movetoroot active unstable will achieve the same result.
-- input: [window, [ string ]]
hl.bind(mod .. add_shift .."R", hl.dsp.layout("movetoroot"))


hl.bind(
	mod .. " + h",
	hl.dsp.focus({
		direction = "l",
	})
)

hl.bind(
	mod .. " + l",
	hl.dsp.focus({
		direction = "r",
	})
)
hl.bind(
	mod .. " + k",
	hl.dsp.focus({
		direction = "u",
	})
)
hl.bind(
	mod .. " + j",
	hl.dsp.focus({
		direction = "d",
	})
)

--------------------------------------------------------------------------------
-- Workspace Configs
--------------------------------------------------------------------------------

for key_num = 0, 9 do
	local workspace_num = (key_num - 1) % 10 + 1

	hl.bind(
		mod .. " + " .. key_num,
		hl.dsp.focus({
			workspace = workspace_num,
		})
	)

	hl.bind(
		mod .. add_shift .. key_num,
		hl.dsp.window.move({
			workspace = workspace_num,
			follow = true,
		})
	)
end

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

hl.bind("CONTROL + grave", function()
	hl.dispatch(hl.dsp.workspace.toggle_special(SPECIAL))
	-- Existing windows can move between monitors.
	-- New windows are handled by window.open above.
	resize_terminal()
end)

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- hl.bind(mod .. " + mouse:272", hl.dsp.window.drag())
-- hl.bind(mod .. " + mouse:273", hl.dsp.window.resize())

-- Switch workspace to next monitor
hl.bind(mod .. add_shift .. "bracketleft", function()
	local w = hl.get_active_workspace()
	if not w then
		return
	end
	hl.dispatch(hl.dsp.workspace.move({ workspace = w.id, monitor = "+1" }))
end)
hl.bind(mod .. add_shift .. "bracketright", function()
	local w = hl.get_active_workspace()
	if not w then
		return
	end
	hl.dispatch(hl.dsp.workspace.move({ workspace = w.id, monitor = -1 }))
end)

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
