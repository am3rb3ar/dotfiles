--Enable the new |lua-loader| that byte-compiles and caches lua files.
vim.loader.enable()

require 'config.options'
require 'config.keys'
require 'config.lazy'
require 'config.lsp'



for _, file in ipairs(vim.fn.glob(vim.fn.stdpath 'config' .. '/lua/commands/*.lua', false, true)) do
  require('commands.' .. vim.fn.fnamemodify(file, ':t:r'))
end
