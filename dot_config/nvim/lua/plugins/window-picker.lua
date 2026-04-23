return  {
  "s1n7ax/nvim-window-picker",
  version = "2.*",
  name = 'window-picker',
  event = 'VeryLazy',
  -- opts = {

    -- type of hints you want to get
    -- following types are supported
    -- 'statusline-winbar' | 'floating-big-letter' | 'floating-letter'
    -- 'statusline-winbar' draw on 'statusline' if possible, if not 'winbar' will be
    -- 'floating-big-letter' draw big letter on a floating window
    -- 'floating-letter' draw letter on a floating window
    -- used


  --   hint = 'statusline-winbar',
  -- }
  config = function()
    require('window-picker').setup({
      hint = 'floating-big-letter',
      filter_rules = {
        autoselect_one = true,
        include_current_win = true,
      }
    })
  end,

  -- config = function()
  --   require("window-picker").setup({
  --     hint = 'floating-big-letter',
  --     filter_rules = {
  --       include_current_win = false,
  --       autoselect_one = true,
  --       -- filter using buffer options
  --       bo = {
  --         -- if the file type is one of following, the window will be ignored
  --         filetype = { "neo-tree", "neo-tree-popup", "notify" },
  --         -- if the buffer type is one of following, the window will be ignored
  --         buftype = { "terminal", "quickfix" },
  --       },
  --     },
  --   })
  -- end,
}
