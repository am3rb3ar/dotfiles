return {
  'MisanthropicBit/winmove.nvim',
  lazy = false,
  config = function()
    local winmove = require('winmove')

    -- Minimal configuration with defaults
    winmove.configure({})

    -- Simple keymaps to enter modes
    vim.keymap.set('n', '<leader>wr', function()
      require('winmove').start_mode('resize')
    end, { desc = 'Winmove: resize mode' })

    vim.keymap.set('n', '<leader>wm', function()
      require('winmove').start_mode('move')
    end, { desc = 'Winmove: move mode' })

    vim.keymap.set('n', '<leader>ws', function()
      require('winmove').start_mode('swap')
    end, { desc = 'Winmove: swap mode' })
  end
}
