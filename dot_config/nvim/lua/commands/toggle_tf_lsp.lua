vim.g.terraform_ls_enabled = true
vim.api.nvim_create_user_command('ToggleTFLsp', function()
  if vim.g.terraform_ls_enabled == true then
    vim.cmd("lsp disable terraformls")
    vim.cmd("lsp disable terraformls")
    vim.cmd("lsp enable tofu_ls")
    vim.g.terraform_ls_enabled = false
    vim.diagnostic.reset()
  else
    vim.cmd("lsp disable tofu_ls")
    vim.cmd("lsp enable terraformls")
    vim.g.terraform_ls_enabled = true
    vim.diagnostic.reset()
  end
end, { desc = 'Toggle using terraformls or tofu_ls' })
