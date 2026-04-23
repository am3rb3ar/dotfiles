---@class snacks.picker.Config
local picker_config = {
  -- show_delay = 100,
  -- Matcher configuration
  matcher = {
    fuzzy = true,
    smartcase = true,
    filename_bonus = true,
  },
  -- Window keymaps
  win = {
    input = {
      keys = {
        ["<C-h>"] = { "cycle_win", mode = "i" },
        ["<C-l>"] = { "cycle_win", mode = "i" },
      },
    },
    list = {
      keys = {
        ["<C-h>"] = "cycle_win",
        ["<C-l>"] = "cycle_win",
      },
    },
    preview = {
      keys = {
        ["<C-h>"] = "cycle_win",
        ["<C-l>"] = "cycle_win",
      },
    },
  },
  -- Sources configuration
  sources = {
    notifications = {
      win = {
        preview = {
          wo = {
            wrap = true,
          },
        },
      },
    },
    files = {
      hidden = true,  -- Show hidden files (like telescope)
      follow = true,  -- Follow symlinks
    },
    grep = {
      hidden = true,  -- Search in hidden files
    },
    buffers = {
      sort_lastused = true,
      sort_mru = true,
    },
  },
  -- File ignore patterns (like telescope)
  ignore_patterns = {
    "%.git/",
    "node_modules/",
    "%.venv",
  },
  -- Formatters
  formatters = {
    file = {
      filename_first = true,
    },
  },
}

---@type snacks.notify.Opts
local notify_config = {
  enabled = true,
  timeout = 1500,
  style = "compact",
}


---@module 'lazy'
---@type LazySpec
return {
  "folke/snacks.nvim",
  lazy = false,
  keys = require("config.keys").snacks_keymaps(),
  init = function()
    vim.notify = function(msg, level, opts)
      return require("snacks").notifier.notify(msg, level, opts)
    end
  end,
  ---@module 'snacks'
  ---@type snacks.Config
  opts = {
    -- dashboard = dashboard_config,
    picker = picker_config,
    notifier = notify_config,
  }
}
