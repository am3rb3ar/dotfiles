---@module 'lazy'
---@type LazySpec
return {
  -- "saghen/blink.lib",
  {
    'saghen/blink.cmp',
    version = '*',
    -- build = function()
    --   require('blink.cmp').build():wait(60000)
    -- end,
    build = 'cargo build --release',
    dependencies = {
      "saghen/blink.lib",
      {
        'L3MON4D3/LuaSnip', version = 'v2.*',
        dependencies = { "rafamadriz/friendly-snippets" },
        run = "make install_jsregexp",
      },
      'xzbdmw/colorful-menu.nvim'
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      completion = {
        menu = {
          border = 'single',
          draw = {
            --- https://github.com/xzbdmw/colorful-menu.nvim
            columns = { { "kind_icon" }, { "label", gap = 1 } },
            components = {
              label = {
                text = function(ctx)
                  return require("colorful-menu").blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require("colorful-menu").blink_components_highlight(ctx)
                end,
              },
            },
          },
        },
        documentation = {
          window = {
            border = 'single'
          }
        },
      },
      signature = { window = { border = 'single' }},
      snippets = { preset = 'luasnip' },
      keymap = {
       -- preset = 'default'
        -- these are the defaults
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide', 'fallback' },
        ['<C-y>'] = { 'select_and_accept', 'fallback' },
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<C-l>'] = { 'select_prev', 'fallback' },
        ['<C-h>'] = { 'select_next', 'fallback' },

        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

        ['<Tab>'] = { 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
        ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
      }
    }
  }
}
