return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  lazy = false,
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {},
  keys = require('config.keys').barbar_keymaps(),
}
