-- Create an autocommand group
local group = vim.api.nvim_create_augroup('set_filetype', { clear = true })

-- Define the autocommand
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = group,
  pattern = { '*\\cDockerfile*', '*\\cContainerfile*' },
  callback = function()
    vim.bo.filetype = 'dockerfile'
  end,
})
