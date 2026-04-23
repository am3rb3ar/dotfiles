-- Turning off ALL logging cause of the stupid terraformls writing everything to stderr....
-- vim.lsp.log.set_level("OFF")

vim.diagnostic.config({
  update_in_insert = false,  -- Only update diagnostics when returning to normal mode
  severity_sort = true,

  -- Disabled: diagflow handles these
  virtual_text = {
    current_line = true
  },
  underline = true,
  virtual_lines = {
    current_line = true,
  },

  signs = {
    text = {
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.ERROR] = "✘",
      [vim.diagnostic.severity.INFO]  = "◉",
      [vim.diagnostic.severity.WARN]  = ""
    }
  }
})

-- 'dgagn/diagflow.nvim' uses an older API so this allows it to have the same symbols
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
vim.fn.sign_define("DiagnosticSignError", { text = "✘", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "◉", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })


-------------------------------------------------------------------------------
-- commands to help with diagflow and virtual_text displays
-------------------------------------------------------------------------------
---
local virtuallines_enabled = true
local virtual_lines = function(opts)
  local args = opts.args
  local config = vim.diagnostic.config
  local switch = {
    ['start'] = function()
      virtuallines_enabled = true
      config({ virtual_lines = { current_line = true } })
      -- vim.notify("Virtual lines enabled", vim.log.levels.INFO)
    end,
    ['stop'] = function()
      virtuallines_enabled = false
      config({ virtual_lines = false })
      -- vim.notify("Virtual lines disabled", vim.log.levels.INFO)
    end,
    ['toggle'] = function()
      if virtuallines_enabled then
        if config ~= nil
          and config().virtual_lines
          and config().virtual_lines.current_line then
          config({ virtual_lines = false })
          -- vim.notify("Virtual lines disabled", vim.log.levels.INFO)
        else
          config({ virtual_lines = { current_line = true } })
          -- vim.notify("Virtual lines enabled", vim.log.levels.INFO)
        end
      end
    end
  }

  if switch[args] then
    switch[args]()
  else
    vim.notify("ViruatlLines: Not a valid option", vim.log.levels.WARN)
  end
end
vim.api.nvim_create_user_command(
  "VirtualLines",
  virtual_lines,
  {
    nargs = 1,
    complete = function() return {"start", "stop"} end,
    desc = "..."
  }
)

local diagflow_enabled = true
local diagflow = function(opts)
  local args = opts.args
  local diagflow = require('diagflow')
  local switch = {
    ['start'] = function()
      diagflow_enabled = true
      diagflow.enable()
    end,
    ['stop'] = function()
      diagflow_enabled = false
      diagflow.disable()
    end,
    ['toggle'] = function()
      if diagflow_enabled then
        require("diagflow").toggle()
        vim.cmd('doautocmd CursorMoved')
      end
    end
  }

  if switch[args] then
    switch[args]()
  else
    vim.notify("Diagflow: Not a valid option", vim.log.levels.WARN)
  end
end
vim.api.nvim_create_user_command(
  "Diagflow",
  diagflow,
  {
    nargs = 1,
    complete = function() return {"start", "stop"} end,
    desc = "..."
  }
)

vim.api.nvim_create_user_command("Diagnostic", function(opts)
  local args = opts.args

  local switch = {
    ['start'] = function()
      diagflow({args = "start"})
      virtual_lines({args = "start"})
    end,
    ['stop'] = function()
      diagflow({args = "stop"})
      virtual_lines({args = "stop"})
    end,
    ['toggle'] = function()
      if not (diagflow_enabled or virtuallines_enabled) then
        vim.notify("Both Diagflow and ViruatlLines are disabled", vim.log.levels.WARN)
      else
        diagflow({args = "toggle"})
        virtual_lines({args = "toggle"})
      end
    end,
  }

  if switch[args] then
    switch[args]()
  else
    vim.notify("Diagnostic: Not a valid option", vim.log.levels.WARN)
  end
end, { nargs = 1, desc = "..." } )
