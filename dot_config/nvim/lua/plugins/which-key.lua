return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    plguins = {
      spelling = {
        suggestions = 80,
      },
    },
  },
  keys = require('config.keys').whichkey_keymaps()
}
