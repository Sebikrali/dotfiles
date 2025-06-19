-- Keybinds
-- <leader>gt - Opens up a telescope overview of all worktrees, inside of it:
--      <Enter> - switches to that worktree
--      <c-d> - deletes that worktree
--      <c-f> - toggles forcing of the next deletion
return {
    'ThePrimeagen/git-worktree.nvim',
    config = function()
        local telescope = require("telescope")
        vim.keymap.set("n", "<leader>gt", function() telescope.extensions.git_worktree.git_worktrees() end, { desc = "git work[t]rees" })
    end,
}
