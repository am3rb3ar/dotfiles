return {
  'MeanderingProgrammer/render-markdown.nvim',
  lazy = true,
  ft = { "markdown" },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons'
  },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    heading = {
      border = true,
      border_virtual = true,
    },
    render_modes = true;
  },
}
