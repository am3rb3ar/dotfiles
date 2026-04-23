---@module 'lazy'
---@type LazySpec
return {
	'mikavilpas/yazi.nvim',
	version = '*', -- use the latest stable version
	event = 'VeryLazy',
	dependencies = {
		{ 'nvim-lua/plenary.nvim', lazy = true },
	},
	keys = require('config.keys').yazi_keymaps(),
	opts = {
		-- if you want to open yazi instead of netrw, see below for more info
		open_for_directories = true,
		keymaps = {
			show_help = '<f1>',
			open_file_in_tab = '<c-h>',
		},
		open_file_function = function(chosen_file, _, _)
			local picked_window_id = require('window-picker').pick_window()
			if picked_window_id then
				vim.api.nvim_set_current_win(picked_window_id)
			end
			vim.cmd('edit ' .. vim.fn.fnameescape(chosen_file))
		end,
	},
}
