-- EDITOR OPTIONS
-- See `:help vim.opt`
-- For more options, you can see `:help option-list`

-- LEADER KEY
-- Must be set before plugins are loaded.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- GUI / FONT OPTIONS
vim.g.have_nerd_font = true -- Set to true if you have a Nerd Font installed
vim.opt.termguicolors = true -- Needed for some terminals to display themes correctly

-- LINE NUMBERS
vim.opt.number = true -- Sets vim to use absolute line numbers
vim.opt.relativenumber = true
-- Alternative for relative numbers is: vim.o.relativenumber = true
vim.opt.signcolumn = 'yes'

-- MOUSE
vim.opt.mouse = 'a' -- enable the mouse

-- CURSOR
vim.opt.cursorline = true -- highlight line your cursor is on
vim.opt.scrolloff = 10 -- minimium number of lines to keep above and below the cursor

-- INDENTATION
vim.opt.breakindent = true -- Allows lines to overflow
vim.opt.tabstop = 4 -- Tab Size - Vim default is 8, VSCode default is 4
vim.opt.shiftwidth = 4 -- Indentation using vim commands
-- Sets how neovim will display certain whitespace characters in the editor. See `:help 'list'` and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '  ', trail = '·' }

-- VIM Search Settings
vim.opt.ignorecase = true -- Ignore case-sensitive search with /?
vim.opt.smartcase = true -- When true = If include one or more capital letters then be case sensitive
vim.opt.hlsearch = true -- Highlight on search
vim.keymap.set('n', '<ESC>', '<cmd>nohlsearch<CR>') -- Clear search highlight when pressing escape
vim.opt.inccommand = 'split' -- When using vim :(s)ubstite (search and replace) preview substitutions live in document as you type

-- SPLIT SCREEN
-- Defaults for how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- FILE HISTORY
vim.opt.undofile = true -- Save undo history when document / nvim is closed

-- CLIPBOARD -- :checkhealth or :h clipboard to check if NVIM has clipboard access
vim.opt.clipboard = 'unnamedplus' -- Sets neovim to use system clipboard (use 'unamed' if having issues)

-- Change (d)elete and (c)change to not copy text (no longer cut)
vim.keymap.set('n', 'd', '"_d')
vim.keymap.set('v', 'd', '"_d')
vim.keymap.set('n', 'c', '"_c')
vim.keymap.set('v', 'c', '"_c')
vim.keymap.set('v', 'p', 'P') -- Set paste in visual mode to delete instead of cutting copied over text
-- Note: x can still be used as cut

-- Highlight / Flash selection when copying text - autocommand (see ':help lua-guide-autocommands')
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- DIAGNOSTICS
vim.fn.sign_define("DiagnosticSignError", {text = "", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "󰌵", texthl = "DiagnosticSignHint"})

-- OTHER
-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time (Displays which-key popup sooner)
vim.opt.timeoutlen = 300
