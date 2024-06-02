-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Clear highlight on search on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-------------------------------------------------------------------
-- [[ My Keymaps ]] --

-- Centers the screen after jumping half a page
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Centers the screen after runing through search results
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- d_ should behave like the move _, it should delete till the first non whitespace char
vim.keymap.set("n", "d_", "d^", { desc = "Start of line (non-blank)"})
vim.keymap.set("n", "c_", "c^", { desc = "Start of line (non-blank)"})

vim.keymap.set("i", "<Tab>", "<Tab>", { desc = ""})

-- Better saving shortcut
vim.keymap.set('n', "<C-s>", ":w<CR>", { desc = "Save buffer"})
vim.keymap.set('i', "<C-s>", "<ESC>:w<CR>", { desc = "Save buffer"})
vim.keymap.set('n', "<C-M-s>", ":wa<CR>", { desc = "Save buffer"})

vim.keymap.set('n', "<M-h>", "<C-w>>", { desc = "Increase width"})
vim.keymap.set('n', "<M-j>", "<C-w>+", { desc = "Increase height"})
vim.keymap.set('n', "<M-k>", "<C-w>-", { desc = "Decrease height"})
vim.keymap.set('n', "<M-l>", "<C-w><", { desc = "Decrease width"})

-- Add shortcuts to paste without filling the register
vim.keymap.set("v", "<leader>p", "\"_dP", { noremap = true, silent = true, desc = "Overpaste without filling the register"})

-- Add newlines without entering insert mode
vim.keymap.set('n', '<M-o>', [[:normal! o<CR>k]], { noremap = true, silent = true })
vim.keymap.set('n', '<M-O>', [[:normal! O<CR>j]], { noremap = true, silent = true })

vim.keymap.set('i', '<C-i>', [[<Esc>:normal ==<CR>i]], { noremap = true, silent = true })

-- Disable key rep to unlearn bad habits
vim.keymap.set('n', 'hh', '<NOP>', { noremap = true, silent = true })
vim.keymap.set('n', 'jj', '<NOP>', { noremap = true, silent = true })
vim.keymap.set('n', 'kk', '<NOP>', { noremap = true, silent = true })
vim.keymap.set('n', 'll', '<NOP>', { noremap = true, silent = true })
-------------------------------------------------------------------

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ My Autocommands ]]
-- Configure line number colors
vim.api.nvim_create_autocmd('ColorScheme', {
  desc = 'Set line number colors',
  group = vim.api.nvim_create_augroup('line-number-colors', { clear = true }),
  callback = function()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#88B3F9' })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='#F38BA8' })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#88B3F9' })

    vim.cmd('hi Cursor_insert guifg=#88B3F9 guibg=#88B3F9')
    vim.cmd('hi Cursor_replace guifg=#ED8796 guibg=#ED8796')
    vim.cmd('set guicursor=n-v-c-i:block,i-ci-ve:block-Cursor_insert/lCursor_insert,r:block-Cursor_replace/lCursor_replace')
  end,
})

-- vim: ts=2 sts=2 sw=2 et
