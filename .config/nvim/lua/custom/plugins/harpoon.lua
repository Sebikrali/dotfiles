-- Keybinds
-- For main/file list
-- <C-e>h - Open the harpoon list
-- <leader>a - Appends the current file to the main list
-- <leader>h|j|k|l  Selects an item and opens the file/buffer
-- For command list
-- <C-e>j - Open the harpoon list
-- <leader>1|2|3|4  Selects an item and opens the file/buffer
return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	settings = {
		save_on_toggle = true,
		sync_on_ui_close = true,
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({
			-- Setting up custom behavior for a list named "cmd"
			["cmd"] = {

			-- When you call list:add() this function is called and the return
			-- value will be put in the list at the end.
			--
			-- which means same behavior for prepend except where in the list the
			-- return value is added
			--
			-- @param possible_value string only passed in when you alter the ui manual
			add = function(possible_value)
				return {}
			end,

			--- This function gets invoked with the options being passed in from
			--- list:select(index, <...options...>)
			--- @param list_item {value: any, context: any}
			--- @param list { ... }
			--- @param option any
			select = function(list_item, list, option)
					vim.cmd("ToggleTerm direction=float name=cmd")
					vim.cmd("TermExec name=cmd cmd='" .. list_item.value .. "'")
			end
			}
		})

		vim.keymap.set("n", "<C-e>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Open the harpoon list" })
		vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon the current file" })
		vim.keymap.set("n", "<leader>h", function() harpoon:list():select(1) end, { desc = "Jump to the [1] Harpoon file" })
		vim.keymap.set("n", "<leader>j", function() harpoon:list():select(2) end, { desc = "Jump to the [2] Harpoon file" })
		vim.keymap.set("n", "<leader>k", function() harpoon:list():select(3) end, { desc = "Jump to the [3] Harpoon file" })
		vim.keymap.set("n", "<leader>l", function() harpoon:list():select(4) end, { desc = "Jump to the [4] Harpoon file" })

		vim.keymap.set("n", "<C-e>j", function() harpoon.ui:toggle_quick_menu(harpoon:list("cmd")) end, { desc = "Open the cmd-harpoon list" })
		vim.keymap.set("n", "<leader><CR>", function() harpoon:list("cmd"):select(1) end, { desc = "Execute the main build cmd" })
		vim.keymap.set("n", "<leader>2", function() harpoon:list("cmd"):select(2) end, { desc = "Execute the [2] build cmd" })
		vim.keymap.set("n", "<leader>3", function() harpoon:list("cmd"):select(3) end, { desc = "Execute the [3] build cmd" })
		vim.keymap.set("n", "<leader>4", function() harpoon:list("cmd"):select(4) end, { desc = "Execute the [4] build cmd" })

		-- Toggle previous & next buffers stored within Harpoon list
		-- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
		-- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
	end,
}
