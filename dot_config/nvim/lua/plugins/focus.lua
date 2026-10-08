return {
  'nvim-focus/focus.nvim',
  version = false,
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {},
}


-- Default Commands
-- :FocusDisable	Disable the plugin per session. Splits will be normalized back to defaults and then spaced evenly.
-- :FocusEnable	Enable the plugin per session. Splits will be resized back to your configs or defaults if not set.
-- :FocusToggle	Toggle focus (globally) on and off again.
-- :FocusSplitNicely	Split a window based on the golden ratio rule.
-- :FocusSplitCycle	If there are no splits, create one and move to it, else cycle focused split. :FocusSplitCycle reverse for counterclockwise
-- :FocusDisableWindow	Disable resizing of the current window (winnr).
-- :FocusEnableWindow	Enable resizing of the current window (winnr).
-- :FocusToggleWindow	Toggle focus on and off again on a per window basis.
-- :FocusDisableBuffer	Disable resizing for the current buffer (bufnr).
-- :FocusEnableBuffer	Enable resizing for the current buffer (bufnr).
-- :FocusToggleBuffer	Toggle focus on and off again on a per buffer basis.
-- :FocusSplitLeft	Move to existing or create a new split to the left of your current window + open file or custom command.
-- :FocusSplitDown	Move to existing or create a new split to the bottom of your current window + open file or custom command.
-- :FocusSplitUp	Move to existing or create a new split to the top of your current window + open file or custom command.
-- :FocusSplitRight	Move to existing or create a new split to the right of your current window + open file or custom command.
-- :FocusEqualise	Temporarily equalises the splits so they are all of similar width/height.
-- :FocusMaximise	Temporarily maximises the focused window.
-- :FocusMaxOrEqual	Toggles Between having the splits equalised or the focused window maximised.
