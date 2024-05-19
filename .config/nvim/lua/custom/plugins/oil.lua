return {
    'stevearc/oil.nvim',
    lazy = false,
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
        require('oil').setup {
            default_file_explorer = true, -- Set to false if you still want to use netrw.
            delete_to_trash = false, -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
            view_options = {
                show_hidden = true,
            },
            float = {
                max_width = 50,
                max_height = 15,
            },
        }
        vim.keymap.set('n', '<leader>o', function () require('oil').toggle_float(nil) end, { noremap = true, silent = true, desc = "Open floating file explorer"} )
        vim.keymap.set('n', '-', ":Oil .<CR>", { noremap = true, silent = true, desc = "Open oil file explorer"} )
    end,
}
