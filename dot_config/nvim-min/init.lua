--Enable the new |lua-loader| that byte-compiles and caches lua files.
vim.loader.enable()

require("config.options") -- make sure this comes first!
require("config.additional-options") -- make sure this comes first!
require("config.lazy")
require("config.keys")

-- load custom stuff
local function load_custom_files()
  local custom_dir = vim.fn.stdpath('config') .. '/lua/custom'
  local files = vim.fn.readdir(custom_dir, [[v:val =~ '\.lua$']])
  for _, file in ipairs(files) do
    local module_name = file:gsub('%.lua$', '')
    require('custom.' .. module_name)
  end
end
load_custom_files()
