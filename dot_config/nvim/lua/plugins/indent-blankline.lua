return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    exclude = {
      filetypes = {
        "dashboard",
        "help",
        "lazy",
        "mason",
        "neo-tree",
        "notify",
        "toggleterm",
      },
    },
    scope = {
       enabled = true,
       show_start = true,
       show_end = false,
       injected_languages = false,
       highlight = { "Function", "Label" },
       priority = 500,
    },
  },
}
