local keymap = vim.api.nvim_set_keymap

-- move text up and down
keymap(
  'v',
  '<C-k>',
  ":m '<-2<CR>gv=gv",
  { noremap = true, silent = true, desc = 'Move selection up' }
)
keymap(
  'v',
  '<C-j>',
  ":m '>+1<CR>gv=gv",
  { noremap = true, silent = true, desc = 'Move selection down' }
)

-- turn off search highlight
keymap(
  'n',
  '<leader>/',
  ':nohlsearch<cr>',
  { noremap = true, silent = true,  desc = 'Turn off search highlighting' }
)
