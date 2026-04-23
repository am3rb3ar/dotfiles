local merge_tables = require('utils').merge_tables
local toggle_key = "<C-S-c>"

---@module 'lazy'
---@type LazySpec
return {
  {
    "coder/claudecode.nvim",
    lazy = false,
    dependencies = { "folke/snacks.nvim" },
    keys = merge_tables(
      require('config.keys').claudecode_keymaps(),
      {
        { toggle_key, "<cmd>ClaudeCodeFocus<cr>", desc = "Claude Code", mode = { "n", "x" } }
      }
    ),
    opts = {
      terminal = {
        ---@module "snacks"
        ---@type snacks.win.Config|{}
        snacks_win_opts = {
          position = "float",
          width = 0.85,
          height = 0.7,
          border = "rounded",
          keys = {
            claude_hide = {
              toggle_key,
              function(self)
                self:hide()
              end,
              mode = "t",
              desc = "Hide",
            },
          },
        },
      },
    },
  },
}
