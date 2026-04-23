return {
  'b0o/incline.nvim',
  lazy = false,
  config = function()
    require('incline').setup({
      render = function(props)
        local mode = vim.api.nvim_get_mode().mode
        local mode_colors = {
          n = { bg = '#8aadf4', fg = '#1e2030' },  -- Normal: Blue
          i = { bg = '#a6da95', fg = '#1e2030' },  -- Insert: Green
          v = { bg = '#f5a97f', fg = '#1e2030' },  -- Visual: Orange
          V = { bg = '#f5a97f', fg = '#1e2030' },  -- Visual Line
          ['\22'] = { bg = '#f5a97f', fg = '#1e2030' },  -- Visual Block
          c = { bg = '#eed49f', fg = '#1e2030' },  -- Command: Yellow
          R = { bg = '#ed8796', fg = '#1e2030' },  -- Replace: Red
          t = { bg = '#c6a0f6', fg = '#1e2030' },  -- Terminal: Purple
        }

        local mode_labels = {
          n = 'NORMAL',
          i = 'INSERT',
          v = 'VISUAL',
          V = 'V-LINE',
          ['\22'] = 'V-BLOCK',
          c = 'COMMAND',
          R = 'REPLACE',
          t = 'TERMINAL',
        }

        local mode_color = mode_colors[mode] or { bg = '#6e738d', fg = '#1e2030' }
        local mode_label = mode_labels[mode] or mode

        return {
          { ' ' .. mode_label .. ' ', guibg = mode_color.bg, guifg = mode_color.fg, gui = 'bold' },
        }
      end,
    })
  end,
}
