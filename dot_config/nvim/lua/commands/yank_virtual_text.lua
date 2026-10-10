vim.api.nvim_create_user_command('YankVirtualText', function()
	local diags = vim.diagnostic.get(0, { lnum = vim.fn.line '.' - 1 })
	if #diags == 0 then
		vim.notify 'No diagnostics on this line'
		return
	end
	local msgs = vim.tbl_map(function(d) return d.message end, diags)
	local text = table.concat(msgs, '\n')
	vim.fn.setreg('+', text) -- system clipboard
	vim.fn.setreg('"', text) -- unnamed register, so `p` works too
	vim.notify('Yanked ' .. #msgs .. ' diagnostic(s)')
end, { desc = 'Yank diagnostic virtual text' })
