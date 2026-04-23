return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile', },
  cmd = { 'ConformInfo' },
  ---@module 'conform'
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      css = { 'prettierd' },
      javascript = { 'prettierd' },
      go = { 'gofmt' },
      markdown = { 'markdownlint-cli2' },
      python = { 'ruff_fix', 'ruff_organize_imports', 'ruff_format' },
      rust = { 'rustfmt' },
      terraform = { 'terraform_fmt' },
      yml = { 'yamlfmt' },
      lua = { 'stylua' },
    },
    -- formatters = {
    --   ruff = {
    --     command = 'uvx ruff',
    --     -- args = { 'check', '--fix', '--exit-zero', '--stdin-filename', '%filename', '-' },
    --     stdin = true,
    --     ignore_exitcode = true,
    --   },
    -- },
  },
  keys = require('config.keys').conform_keymaps()
}
