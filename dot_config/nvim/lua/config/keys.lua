M = {}

local keymap = vim.api.nvim_set_keymap
local merge_tables = require('utils').merge_tables

local opts = { noremap = true, silent = true }

-- Resize with arrows when using multiple windows
-- keymap("n", "<C-Up>", ":resize -2<CR>", opts)
-- keymap("n", "<C-down>", ":resize +2<cr>", opts)
-- keymap("n", "<C-right>", ":vertical resize -2<cr>", opts)
-- keymap("n", "<C-left>", ":vertical resize +2<cr>", opts)

-- navigate buffers
keymap('n', '<tab>', ':bnext<cr>', merge_tables(opts, { desc = 'Next tab' }))
keymap('n', '<s-tab>', ':bprevious<cr>', merge_tables(opts, { desc = 'Previous tab' }))

-- move text up and down
keymap('v', '<C-k>', ":m '<-2<CR>gv=gv", merge_tables(opts, { desc = 'Move selection up' }))
keymap('v', '<C-j>', ":m '>+1<CR>gv=gv", merge_tables(opts, { desc = 'Move selection down' }))

-- turn off search highlight
keymap('n', '<leader>/', ':nohlsearch<cr>', merge_tables(opts, { desc = 'Turn off search highlighting' }))
-- turn off virtual text
keymap('n', 'gm', ':InlayHints<cr>', merge_tables(opts, { desc = 'Toggle Inlay Hints' }))


-------------------------------------------------------------------------------
-- Plugins --------------------------------------------------------------------
-------------------------------------------------------------------------------
 

-- stylua: ignore
function M.snacks_keymaps()
  return {
    { "<leader>ff", function() require("snacks").picker.files() end, desc = "Find Files" },
		{ "<leader>fg", function() require("snacks").picker.grep() end, desc = "Live Grep" },
		{ "<leader>fb", function() require("snacks").picker.buffers() end, desc = "Buffers" },
		{ "<leader>fd", function() require("snacks").picker.diagnostics() end, desc = "Diagnostics" },
		{ "<leader>fh", function() require("snacks").picker.help() end, desc = "Help Tags" },
		{ "<leader>fc", function() require("snacks").picker.colorschemes() end, desc = "Colorschemes" },
		{ "<leader>fn", function() require("snacks").picker.notifications() end, desc = "Notifications" },
		{ "<leader>fr", function() require("snacks").picker.recent() end, desc = "Recent Files" },
		{ "<leader>fw", function() require("snacks").picker.grep_word() end, desc = "Grep Word Under Cursor" },
  }
end

-- stylua: ignore
function M.barbar_keymaps()
	return {
		{ "<leader>bb", "<cmd>BufferPick<CR>", desc = "Pick Buffer", mode = "n" },
		{ "<leader>bc", "<cmd>BufferClose<CR>", desc = "Close Buffer", mode = "n" },
		{ "<leader>bd", "<cmd>BufferCloseAllButVisible<CR>", desc = "Close All but Visible Buffers", mode = "n", },
		{ "<leader>bp", "<cmd>BufferPin<CR>", desc = "Pin Buffer", mode = "n" },
		{ "<leader>b1", "<cmd>BufferGoto 1<CR>", desc = "Buffer 1", mode = "n" },
		{ "<leader>b2", "<cmd>BufferGoto 2<CR>", desc = "Buffer 2", mode = "n" },
		{ "<leader>b3", "<cmd>BufferGoto 3<CR>", desc = "Buffer 3", mode = "n" },
		{ "<leader>b4", "<cmd>BufferGoto 4<CR>", desc = "Buffer 4", mode = "n" },
		{ "<leader>b5", "<cmd>BufferGoto 5<CR>", desc = "Buffer 5", mode = "n" },
		{ "<leader>b6", "<cmd>BufferGoto 6<CR>", desc = "Buffer 6", mode = "n" },
		{ "<leader>b7", "<cmd>BufferGoto 7<CR>", desc = "Buffer 7", mode = "n" },
		{ "<leader>b8", "<cmd>BufferGoto 8<CR>", desc = "Buffer 8", mode = "n" },
		{ "<leader>b9", "<cmd>BufferGoto 9<CR>", desc = "Buffer 9", mode = "n" },
	}
end

function M.yazi_keymaps()
  return {
    { '<leader>-', '<cmd>Yazi<cr>', desc = 'Open yazi at the current file', mode = { 'n', 'v' }},
    -- Open in the current working directory
    {'<leader><C-->', '<cmd>Yazi cwd<cr>', desc = "Open the file manager in nvim's working directory", mode = { 'n', 'v' }},
  }
end

function M.conform_keymaps()
  return {
    {
      '<leader>c',
      function()
        require('conform').format {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        }
      end,
      mode = { 'n', 'v' },
      desc = 'Format file or range in visual mode',
    },
  }
end

function M.whichkey_keymaps()
  return {
    {'<leader>wc', function() require('which-key').show() end, desc = 'Buffer Local Keymaps (which-key)'},
  }
end

function M.trouble_keymaps()
  return {
    {
      '<leader>xx',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>xX',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>xs',
      '<cmd>Trouble symbols toggle focus=true win={ position=right, size=0.4 }<cr>',
      desc = 'Symbols (Trouble)',
    },
    {
      '<leader>xl',
      '<cmd>Trouble lsp toggle win={ position=right, size=0.4 }<cr>',
      desc = 'LSP Definitions / references / ... (Trouble)',
    },
    {
      '<leader>xL',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Location List (Trouble)',
    },
    {
      '<leader>xQ',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Quickfix List (Trouble)',
    },
  }
end

function M.lsp_keymaps()
	return {
		{
			"K",
			'<cmd>lua vim.lsp.buf.hover({border = "rounded", max_height = 25, max_width = 120})<cr>',
			desc = "Show documentation for what is under cursor",
		},
		{ 'gl', '<cmd>lua vim.lsp.buf.codelens()<cr>', desc = "Show codelens" },
		{ 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', desc = "Show code actions" },
		{ 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', desc = "Show LSP definitions" },
		{ "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Go to declaration", },
    { 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', desc = "Show LSP implementations"}, 
		{ 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', desc = "Show LSP type definitions"},
		{ 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', desc = "References", nowait = true },
    { "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Signature Help", },
    { "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename var under cursor", },
		{
      "gh",
      function()
        vim.cmd('Diagnostic toggle')
      end,
      desc = "Toggle Diagnostic Hints",
      silent = true,
      noremap = true,
    },
	}
end

function M.luasnip_keymaps()
  return {
    {"<C-S-i>", function () require('luasnip').expand() end, mode = "i", silent = true, },
    {"<C-Up>", function () require('luasnip').jump(1) end, mode = "i", silent = true, },
    {"<C-Down>", function () require('luasnip').jump(-1) end, mode = "i", silent = true, },
    {
      "<C-y>",
      function ()
        local ls = require('luasnip')
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end,
      mode = "i",
      silent = true,
    },
  }
end

function M.claudecode_keymaps()
  return {
    -- toggle_key is defined in claudecode.lua
    { "<leader>a", nil, desc = "AI/Claude Code" },
    { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
    { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
    { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
    { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
    { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
    {
      "<leader>as",
      "<cmd>ClaudeCodeTreeAdd<cr>",
      desc = "Add file",
      ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
    },
    -- Diff management
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
  }
end


-- function M.dap_keymaps()
--   return {
--     { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
--     { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
--     { "<leader>dc", function() require("dap").continue() end, desc = "Run/Continue" },
--     -- { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
--     { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
--     { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
--     { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
--     { "<leader>dj", function() require("dap").down() end, desc = "Down" },
--     { "<leader>dk", function() require("dap").up() end, desc = "Up" },
--     { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
--     { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
--     { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
--     { "<leader>dP", function() require("dap").pause() end, desc = "Pause" },
--     { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
--     { "<leader>ds", function() require("dap").session() end, desc = "Session" },
--     { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
--     { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
--   }
-- end

-- -- stylua: ignore
-- function M.python_dap_keymappings()
-- 	return {
-- 		{ "<leader>dl", function() require("dap-python").test_method() end, desc = "python dap test method",},
-- 		{ "<leader>df", function() require("dap-python").test_class() end, desc = "python dap test class", },
-- 		{ "<leader>ds <esc>", function() require("dap-python").test_selection() end, desc = "python dap test selection", },
-- 	}
-- end
--
-- -- stylua: ignore
-- function M.dap_ui_keymappings()
-- 	return {
-- 		{ "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI", },
-- 		{ "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = { "n", "x" },
-- 		},
-- 	}
-- end

return M
