-- Keybinds
--
-- <leader>xx - Diagnostics (Trouble)
-- <leader>xX - Buffer Diagnostics (Trouble)
-- <leader>cs - Symbols (Trouble)
-- <leader>cl - LSP Definitions / references / ... (Trouble)
-- <leader>xL - Location List (Trouble)
-- <leader>xQ - Quickfix List (Trouble)
return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		auto_close = true,
	}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>xX",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>cl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
		{
			"<leader>xL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>xQ",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
	},
	-- config = function()
	-- 	require("trouble").setup({
	-- 		auto_preview = false, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
	-- 		auto_close = true,
	-- 		signs = { -- icons / text used for a diagnostic
	-- 			other = "󰮍",
	-- 		},
	-- 	})
	--
	-- 	vim.keymap.set("n", "<leader>x", function()
	-- 		require("trouble").toggle()
	-- 	end, { desc = "Open Trouble" })
	-- 	-- vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end, { desc = "Open [D]ocument Diagnostics" })
	-- 	-- vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
	-- 	-- vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
	-- 	vim.keymap.set("n", "gR", function()
	-- 		require("trouble").toggle("lsp_references")
	-- 	end, { desc = "Goto LSP-[R]eferences" })
	-- end,
}
