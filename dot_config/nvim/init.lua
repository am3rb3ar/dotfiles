--Enable the new |lua-loader| that byte-compiles and caches lua files.
vim.loader.enable()

require 'config.options'
require 'config.keys'
require 'config.lazy'
require 'config.lsp'
