return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile', },
  config = function()
    local lint = require('lint')
    lint.linters_by_ft = {
      markdown = { "markdownlint-cli2" },
      makefile = { 'mbake' },
    }

    -- Track lint state
    local lint_enabled = true

    -- Helper function to determine if buffer should be linted
    local function should_lint()
      -- Don't lint floating windows (preview windows are usually floating)
      local win_config = vim.api.nvim_win_get_config(0)
      if win_config.relative ~= "" then
        return false
      end
      -- Don't lint if buffer is not modifiable
      if not vim.bo.modifiable then
        return false
      end
      return true
    end

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
      group = lint_augroup,
      callback = function()
        if lint_enabled and should_lint() then
          lint.try_lint()
        end
      end,
    })

    -- Fire LintAttach event when linters are available for a buffer
    vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
      group = lint_augroup,
      callback = function()
        local linters = lint.linters_by_ft[vim.bo.filetype] or {}
        if #linters > 0 then
          vim.api.nvim_exec_autocmds("User", { pattern = "LintAttach" })
        end
      end,
    })

    -- Toggle command
    vim.api.nvim_create_user_command("LintToggle", function()
      lint_enabled = not lint_enabled
      if lint_enabled then
        vim.notify("Linting enabled", vim.log.levels.INFO)
        if should_lint() then
          lint.try_lint()
        end
      else
        vim.notify("Linting disabled", vim.log.levels.INFO)
        vim.diagnostic.reset(nil, 0)
      end
    end, { desc = "Toggle nvim-lint on/off" })
  end
}
