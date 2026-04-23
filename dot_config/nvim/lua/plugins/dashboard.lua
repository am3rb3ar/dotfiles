local function interpolate_color(color1, color2, factor)
  -- Convert hex to RGB
  local function hex_to_rgb(hex)
    hex = hex:gsub("#", "")
    return tonumber(hex:sub(1,2), 16), tonumber(hex:sub(3,4), 16), tonumber(hex:sub(5,6), 16)
  end

  local r1, g1, b1 = hex_to_rgb(color1)
  local r2, g2, b2 = hex_to_rgb(color2)

  -- Interpolate
  local r = math.floor(r1 + (r2 - r1) * factor)
  local g = math.floor(g1 + (g2 - g1) * factor)
  local b = math.floor(b1 + (b2 - b1) * factor)

  -- Convert back to hex
  return string.format("#%02x%02x%02x", r, g, b)
end

local color_pairs = {
  -- Cool tones
  { "#7aa2f7", "#bb9af7" },  -- Blue to purple
  { "#3b82f6", "#06b6d4" },  -- Blue to cyan
  { "#06b6d4", "#8b5cf6" },  -- Cyan to purple
  { "#10b981", "#3b82f6" },  -- Green to blue
  { "#2dd4bf", "#6366f1" },  -- Teal to indigo
  { "#0ea5e9", "#a855f7" },  -- Sky blue to purple

  -- Warm tones
  { "#f97316", "#dc2626" },  -- Orange to red
  { "#f59e0b", "#dc2626" },  -- Sunset (yellow to red)
  { "#ec4899", "#f97316" },  -- Pink to orange
  { "#fbbf24", "#f97316" },  -- Yellow to orange
  { "#fb923c", "#be123c" },  -- Light orange to deep red

  -- Pink/Purple spectrum
  { "#ec4899", "#8b5cf6" },  -- Pink to purple
  { "#f472b6", "#c026d3" },  -- Hot pink to magenta
  { "#d946ef", "#7c3aed" },  -- Fuchsia to violet

  -- Nature/Earth
  { "#22c55e", "#14b8a6" },  -- Green to teal
  { "#84cc16", "#22c55e" },  -- Lime to green
  { "#10b981", "#059669" },  -- Emerald gradient
  { "#facc15", "#84cc16" },  -- Yellow to lime

  -- Pastels
  { "#93c5fd", "#c4b5fd" },  -- Pastel blue to lavender
  { "#fca5a5", "#fbbf24" },  -- Pastel red to yellow
  { "#86efac", "#7dd3fc" },  -- Pastel green to blue

  -- Bold/Vibrant
  { "#ef4444", "#eab308" },  -- Red to yellow
  { "#8b5cf6", "#ec4899" },  -- Purple to hot pink
  { "#06b6d4", "#10b981" },  -- Cyan to green
  { "#f43f5e", "#a855f7" },  -- Rose to purple
}

return {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    enabled = true,
    init = false,
    dependencies = {
        'echasnovski/mini.icons',
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    opts = function()
      local dashboard = require("alpha.themes.dashboard")

      vim.api.nvim_create_user_command('Dashboard', 'Alpha', {})

      -- https://budavariam.github.io/asciiart-text/multi
      local logo = [[
          ██████╗ ██╗   ██╗██╗███╗   ███╗
          ██╔══██╗██║   ██║██║████╗ ████║
          ██████╔╝██║   ██║██║██╔████╔██║
          ██╔══██╗╚██╗ ██╔╝██║██║╚██╔╝██║
          ██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
          ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
      ]]

      local logo_lines = vim.split(logo, "\n")
      dashboard.section.header.val = logo_lines

      -- Generate gradient colors by interpolating between start and end
      math.randomseed(os.time())
      local selected_pair = color_pairs[math.random(#color_pairs)]
      local color_start = selected_pair[1]
      local color_end = selected_pair[2]

      local num_lines = #logo_lines
      for i = 1, num_lines do
        local factor = (i - 1) / (num_lines - 1)  -- 0.0 to 1.0
        local color = interpolate_color(color_start, color_end, factor)
        vim.api.nvim_set_hl(0, "AlphaLogoGradient" .. i, { fg = color, bold = true })
      end

      -- Apply gradient: 2D array of highlight specs
      dashboard.section.header.opts.hl = {}
      for i = 1, num_lines do
        dashboard.section.header.opts.hl[i] = { { "AlphaLogoGradient" .. i, 0, -1 } }
      end

      -- stylua: ignore
      dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find file",             ":lua require('snacks').picker.files() <CR>"),
        dashboard.button("n", " " .. " New file",              ":enew <BAR> startinsert <CR>"),
        dashboard.button("l", " " .. " Recent local files",    ":lua require('snacks').picker.recent({ filter = { cwd = true } })<CR>"),
        dashboard.button("r", " " .. " Recent files",          ":lua require('snacks').picker.recent()<CR>"),
        dashboard.button("g", " " .. " Find text",             ":lua require('snacks').picker.grep()<CR>"),
        -- dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
        dashboard.button("z", "󰒲 " .. " Lazy",                  "<cmd> Lazy <cr>"),
        dashboard.button("q", " " .. " Quit",                  "<cmd> qa <cr>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      -- header.opts.hl is set above with gradient highlights
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.section.footer.opts.hl = "AlphaFooter"
      dashboard.opts.layout[1].val = 8
      return dashboard
    end,
    config = function(_, dashboard)
      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          once = true,
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end
      require("alpha").setup(dashboard.opts)
    end,
}
