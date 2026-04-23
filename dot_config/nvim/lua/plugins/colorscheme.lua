-- https://vimcolorschemes.com/i/trending
-- https://midgarcorp.cc/blog/neovim-auto-theme-switching/
return {
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      integrations = {
        blink_cmp = true,
        gitsign = true,
        nvimtree = true,
        notify = true,
      }
    },
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    opts = {
      style = 'deep'
    },
  },

  -- auto colorscheme switcher
  {
    "f-person/auto-dark-mode.nvim",
    priority = 1000,
    config = function()
      local auto_dark_mode = require('auto-dark-mode')

      auto_dark_mode.setup({
        update_interval = 3000,
        set_dark_mode = function()
          vim.api.nvim_set_option_value("background", "dark", {})
          vim.cmd("colorscheme catppuccin-mocha")
        end,
        set_light_mode = function()
          vim.api.nvim_set_option_value("background", "light", {})
          vim.cmd("colorscheme onedark")
        end,
      })
    end,
  },
}
