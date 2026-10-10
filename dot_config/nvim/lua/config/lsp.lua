-- Turning off ALL logging cause of the stupid terraformls writing everything to stderr....

vim.diagnostic.config {
	update_in_insert = false, -- Only update diagnostics when returning to normal mode
	severity_sort = true,
	underline = true,
	virtual_lines = {
		current_line = true,
	},

	signs = {
		text = {
			[vim.diagnostic.severity.HINT] = '',
			[vim.diagnostic.severity.ERROR] = '✘',
			[vim.diagnostic.severity.INFO] = '◉',
			[vim.diagnostic.severity.WARN] = '',
		},
	},
}

-------------------------------------------------------------------------------
-- Helper Commands ------------------------------------------------------------
-------------------------------------------------------------------------------

-- toggle virtual lines -------------------------------------------------------

local function virtual_lines_enabled()
	return vim.diagnostic.config().virtual_lines ~= false
end

local virtual_lines = function(opts)
	local start = function()
		vim.diagnostic.config { virtual_lines = { current_line = true } }
		vim.notify('Virtual lines enabled', vim.log.levels.INFO)
	end

	local stop = function()
		vim.diagnostic.config { virtual_lines = false }
		vim.notify('Virtual lines disabled', vim.log.levels.INFO)
	end

	local switch = {
		start = start,
		stop = stop,
		toggle = function()
			if virtual_lines_enabled() then
				stop()
			else
				start()
			end
		end,
	}
	if switch[opts.args] then
		switch[opts.args]()
	else
		vim.notify('VirtualLines: Not a valid option', vim.log.levels.WARN)
	end
end

vim.api.nvim_create_user_command('VirtualLines', virtual_lines, {
	nargs = 1,
	complete = function() return { 'start', 'stop', 'toggle' } end,
	desc = 'Choose to Display virtual lines',
})

vim.api.nvim_create_user_command(
	'ToggleVirtualLines',
	function() virtual_lines { args = 'toggle' } end,
	{ desc = 'Toggle virtual lines' }
)

-- toggle inlay hints ---------------------------------------------------------

vim.api.nvim_create_user_command('ToggleInlayHints', function()
  local enabled = not vim.lsp.inlay_hint.is_enabled({})
  vim.lsp.inlay_hint.enable(enabled)
  vim.notify("Inlay hints: " .. (enabled and " on" or "off"))
end, { desc = 'Toggle inlay hints' })

-- flip between Terraform and OpenTofu ----------------------------------------

vim.g.terraform_ls_enabled = true
vim.api.nvim_create_user_command('ToggleTFLsp', function()
  if vim.g.terraform_ls_enabled == true then
    vim.cmd("lsp disable terraformls")
    vim.cmd("lsp disable terraformls") -- for some reason had to do this twice.....
    vim.cmd("lsp enable tofu_ls")
    vim.g.terraform_ls_enabled = false
    vim.diagnostic.reset()
  else
    vim.cmd("lsp disable tofu_ls")
    vim.cmd("lsp enable terraformls")
    vim.g.terraform_ls_enabled = true
    vim.diagnostic.reset()
  end
end, { desc = 'Toggle between terraformls or tofu_ls' })
