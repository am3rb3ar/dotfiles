return {
  -- "linux-cultist/venv-selector.nvim",
  -- dependencies = {
  --   { "nvim-telescope/telescope.nvim", version = "*", dependencies = { "nvim-lua/plenary.nvim" } },
  -- },
  -- ft = "python",
  -- opts = {
  --   options = {
  --     on_venv_activate_callback = function()
  --       -- When venv activates, restart basedpyright to pick up new environment
  --       local clients = vim.lsp.get_clients({ name = "basedpyright", bufnr = 0 })
  --       for _, client in ipairs(clients) do
  --         local bufs = vim.tbl_keys(client.attached_buffers)
  --         for _, buf in ipairs(bufs) do
  --           vim.lsp.buf_detach_client(buf, client.id)
  --         end
  --         vim.defer_fn(function()
  --           for _, buf in ipairs(bufs) do
  --             vim.lsp.enable("basedpyright")
  --           end
  --         end, 500)
  --       end
  --     end,
  --   },
  --   search = {}
  -- },
}

