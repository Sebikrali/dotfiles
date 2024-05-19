return {
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            local alpha = require'alpha'
            local theme = require("alpha.themes.theta")
            local themeconfig = theme.config
            local dashboard = require'alpha.themes.dashboard'

            local header = {
                type = "text",
                val = {
                    '███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄   ',
                    '███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄ ',
                    '███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███ ',
                    '███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███ ',
                    '███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███ ',
                    '███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███ ',
                    '███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███ ',
                    ' ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀  ',
                },
                opts = {
                    position = "center",
                    hl = "Type",
                },
            }

            local buttons = {
                type = "group",
                val = {
                    { type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
                    { type = "padding", val = 1 },
                    dashboard.button('e', '  New File', ':ene <BAR> startinsert <CR>'),
                    dashboard.button('f', '󰱼  Find Files', '<cmd>Telescope find_files<CR>'),
                    dashboard.button('r', '  Find Recent Files', '<cmd>Telescope oldfiles<CR>'),
                    dashboard.button('q', '󰩈  Quit NVIM' , ':qa<CR>'),
                },
                position = "center",
            }

            themeconfig.layout[2] = header
            themeconfig.layout[6] = buttons

            themeconfig.opts.noautocmd = false


            vim.cmd[[autocmd User AlphaReady echo '']]

            alpha.setup(themeconfig)
        end
    },
}
