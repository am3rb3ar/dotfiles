-- User command to manually attach harper_ls to current buffer
vim.api.nvim_create_user_command('GrammarLsp', function()
  vim.lsp.start({
    name = 'harper_ls',
    cmd = {'harper-ls', '--stdio'},
    root_dir = vim.fn.getcwd(),
  })
end, { desc = 'Manually attach harper_ls to current buffer' })

---@type vim.lsp.Config
return {
    filetypes = {},
}
