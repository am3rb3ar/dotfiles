---@module 'lazy'
---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    keys = require('config.keys').lsp_keymaps(),
  },
  {
    "mason-org/mason.nvim",
    ---@module 'mason.settings'
    ---@type MasonSettings
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason.nvim",
    },
    opts = {
      ensure_installed = {
        'basedpyright',
        'docker_compose_language_service',
        'dockerls',
        'ruff',
        'terraformls',
        'tflint',
        'ty',
      },
      automatic_enable = {
        exclude = {
          'basedpyright',
          'tofu_ls',
        },
      },
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = {
      "mason-org/mason.nvim",
    },
    event = "VeryLazy",  -- Load after startup
    opts = {
      ensure_installed = {
        'bash-language-server',
        'copilot-language-server',
        'jsonls',
        'lua-language-server',
        'markdownlint-cli2',
        'mbake',
        'shellcheck',
        'stylua',
        'tree-sitter-cli',
        'vim-language-server',
        'yaml-language-server',
      },
      auto_update = false,  -- Prevent auto-install on every startup
    },
  },
  {
    "j-hui/fidget.nvim",
  },
  {
    'dgagn/diagflow.nvim',
    event = { 'LspAttach', 'BufReadPost' },
    opts = {
      scope = 'line',
      max_width = 80,
      max_height = 30,
      show_borders = true,
      show_sign = true,
      toggle_event = { 'InsertEnter', 'InsertLeave' },  -- Disable in insert mode, re-enable on leaving
    }
  },
}
