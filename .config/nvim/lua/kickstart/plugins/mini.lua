-- Keybinds
--
-- Better Around/Inside textobjects
-- va)  - [V]isually select [A]round [)]paren
-- yinq - [Y]ank [I]nside [N]ext [']quote
-- yilq - [Y]ank [I]nside [L]ast [']quote
-- ci'  - [C]hange [I]nside [']quote
-- g[(  - [G]o to left border of next '('
--
-- Add/delete/replace surroundings (brackets, quotes, etc.)
-- Mappings
-- sa - Add surrounding in Normal and Visual modes
-- sd - Delete surrounding
-- sf - Find surrounding (to the right)
-- sF - Find surrounding (to the left)
-- sh - Highlight surrounding
-- sr - Replace surrounding
-- sn - Update `n_lines`
--
-- l - Suffix to search with "prev" method
-- n - Suffix to search with "next" method
--
-- Examples
-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
-- - sd'   - [S]urround [D]elete [']quotes
-- - sr)'  - [S]urround [R]eplace [)] [']
-- - shnf  - [S]urround [H]ighlight [N]ext [F]unction
return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - yilq - [Y]ank [I]nside [L]ast [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      --  - g[(  - [G]o to left border of next '('
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      -- Mappings
      -- sa - Add surrounding in Normal and Visual modes
      -- sd - Delete surrounding
      -- sf - Find surrounding (to the right)
      -- sF - Find surrounding (to the left)
      -- sh - Highlight surrounding
      -- sr - Replace surrounding
      -- sn - Update `n_lines`
      --
      -- l - Suffix to search with "prev" method
      -- n - Suffix to search with "next" method
      --
      -- Examples
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      -- - shnf  - [S]urround [H]ighlight [N]ext [F]unction
      require('mini.surround').setup()

      -- Haven't found good use, its rather a hinderance
      -- -- Multline 'f' and 't' jumps
      -- -- Mapings just like normal f and t
      -- require('mini.jump').setup {
      --   delay = {
      --     -- Delay between jump and highlighting all possible jumps
      --     highlight = 250,
      --
      --     -- Delay between jump and automatic stop if idle (no jump is done)
      --     idle_stop = 10000000,
      --   },
      -- }

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
