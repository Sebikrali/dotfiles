return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function ()
        require('toggleterm').setup {
            size = 80,
            open_mapping = [[<c-t>]],
            shade_terminals = true,
            shading_factor = 2,
            direction = 'float',
            float_opts = {
                border = 'curved',
                width = 188,
                height = 44,
                winblend = 0,
                zindex = 50,
            },
        }

        local Terminal  = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new({ cmd = "lazygit", direction = "float" })

        vim.keymap.set('n', '<leader>l', function () lazygit:toggle() end, { noremap = true, silent = true, desc = "Open lazygit" })
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]])
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]])
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]])
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]])
    end,
}
