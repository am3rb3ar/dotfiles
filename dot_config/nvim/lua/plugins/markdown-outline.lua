return {
  "hedyhli/outline.nvim",
  event = { "LspAttach", "User LintAttach" },
  opts = {
    outline_items = {
      show_symbol_lineno = true,
    },
    outline_window = {
      show_cursorline = true,
      hide_cursor = true,
    },
    symbol_folding = {
      autofold_depth = false,
    },
  },

  -- config = function()
  --   -- Example mapping to toggle outline
  --   vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
  --     { desc = "Toggle Outline" })
  --
  --   require("outline").setup {
  --     -- Your setup opts here (leave empty to use defaults)
  --   }
  -- end,
  --
}
