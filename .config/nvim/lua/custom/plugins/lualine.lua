return {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
        options = {
            icons_enabled = true,
            theme = 'onedark', -- onedark, night-owl
            component_separators = { left = '', right = '' }, -- left = '', right = ' '
            section_separators = { left = '', right = '' }, -- left = '', right = ' ' 
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diagnostics'},
            lualine_c = {'filename'},
            lualine_x = {'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
        },
    },
}
