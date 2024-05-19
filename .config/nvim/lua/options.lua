-- [[ Setting options ]]

-- Set highlight on search
vim.opt.hlsearch = true

vim.opt.number = true
vim.opt.relativenumber = true

-- Set tab options
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 100

vim.opt.termguicolors = true

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

--  See `:help 'list'` and `:help 'listchars'`
vim.opt.list = false  -- Disabled because of conflict with ibl
vim.opt.listchars = { tab = '  ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true
vim.opt.cursorlineopt = "line"

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ My Options ]]


vim.opt.foldmethod='expr'
vim.opt.foldexpr='nvim_treesitter#foldexpr()'
vim.opt.foldenable=false
vim.opt.foldlevelstart = 99
vim.opt.foldlevel = 99

-- Configure line number colors
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#88B3F9' })
vim.api.nvim_set_hl(0, 'LineNr', { fg='#F38BA8' })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#88B3F9' })

-- Set cursor color for some modes
vim.cmd('hi Cursor_insert guifg=#88B3F9 guibg=#88B3F9')
vim.cmd('hi Cursor_replace guifg=#ED8796 guibg=#ED8796')
vim.cmd('set guicursor=n-v-c-i:block,i-ci-ve:block-Cursor_insert/lCursor_insert,r:block-Cursor_replace/lCursor_replace')

-- Re-open at last position
vim.cmd [[ au BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]]

-- vim: ts=2 sts=2 sw=2 et
