return {
  'folke/trouble.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require('trouble').setup {
      auto_preview = false, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
      signs = { -- icons / text used for a diagnostic
        other = "󰮍",
      },
    }


    vim.keymap.set("n", "<leader>x", function() require("trouble").toggle() end, { desc = "Open Trouble" })
    -- vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
    -- vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
    -- vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
    vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
  end,
}
