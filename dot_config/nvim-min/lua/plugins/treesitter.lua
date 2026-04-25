-- Nvim Treesitter configurations and abstraction layer
return {
  'nvim-treesitter/nvim-treesitter',
  event = { "BufReadPost", "BufNewFile" },
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      -- list of supported languages
      -- https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md
      "bash",
      "zsh",
      "fish",
      "nu",
    },
    sync_install = false,
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
    autopairs = { enable = true },
  },

  config = function(_, opts)
    -- install parsers from custom opts.ensure_installed
    if opts.ensure_installed and #opts.ensure_installed > 0 then
      require("nvim-treesitter").install(opts.ensure_installed)
      -- register and start parsers for filetypes
      for _, parser in ipairs(opts.ensure_installed) do
        local filetypes = parser -- In this case, parser is the filetype/language name
        vim.treesitter.language.register(parser, filetypes)

        vim.api.nvim_create_autocmd({ "FileType" }, {
          pattern = filetypes,
          callback = function(event)
            pcall(vim.treesitter.start, event.buf, parser)
          end,
        })
      end
    end
  end,
}
