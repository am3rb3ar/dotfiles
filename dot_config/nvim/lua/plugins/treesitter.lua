return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"MeanderingProgrammer/treesitter-modules.nvim",
		},
		config = function()
      -- https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md
			local languages = {
				"bash",
				"c",
				"css",
				"diff",
				"dockerfile",
				"gitignore",
				"graphql",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"nu",
				"printf",
				"python",
				"query",
				"regex",
				"sql",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"xml",
				"yaml",
        "hcl",
        "jinja",
        "jinja_inline",
        "just",
        "rust",
        "rust",
        "ssh_config",
        "terraform",
        "zsh",
			}

			-- Covers ensure_installed + highlight + indent + fold + incremental selection
			local ts = require("treesitter-modules")
			ts.setup({
				ensure_installed = languages,
				ignore_install = {},
				sync_install = false,
				auto_install = false,

				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
				fold = {
					enable = true,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "gnn",
						node_incremental = "grn",
						scope_incremental = "grc",
						node_decremental = "grm",
					},
				},
			})

			-- Fold settings
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

			-- autotag
			require("nvim-ts-autotag").setup()

			-- textobjects plugin now uses its own setup + keymaps
			require("nvim-treesitter-textobjects").setup({
				move = {
					set_jumps = false,
				},
				select = {
					lookahead = true,
				},
			})
    end
	},
}
