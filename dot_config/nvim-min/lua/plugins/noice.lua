return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  init = function()
    -- File change detection autocmds (moved from nvim-notify config)
    vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
      pattern = "*",
      command = "checktime",
    })
    vim.api.nvim_create_autocmd("FileChangedShellPost", {
      pattern = "*",
      callback = function()
        vim.notify(
          "File changed on disk. Buffer reloaded.",
          vim.log.levels.INFO
        )
      end,
    })
  end,
  opts = {
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = false, -- use a classic bottom cmdline for search
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false, -- add a border to hover docs and signature help
    },
    -- Disable noice's notify - we use snacks.notifier instead
    notify = {
      enabled = true,
    },
    -- Filter out mundane notifications (per noice.nvim docs)
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "%d+ lines yanked",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "%d+ fewer lines",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "%d+ more lines",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "%d+ lines indented",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          find = "Already at",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          find = "search hit",
        },
        opts = { skip = true },
      },
    },
  },
}
