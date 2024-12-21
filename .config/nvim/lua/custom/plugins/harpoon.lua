return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Harpoon the current file" })
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Open the harpoon list" })

		vim.keymap.set("n", "<leader>h", function()
			harpoon:list():select(1)
		end, { desc = "Jump to the [1] Harpoon file" })
		vim.keymap.set("n", "<leader>j", function()
			harpoon:list():select(2)
		end, { desc = "Jump to the [2] Harpoon file" })
		vim.keymap.set("n", "<leader>k", function()
			harpoon:list():select(3)
		end, { desc = "Jump to the [3] Harpoon file" })
		vim.keymap.set("n", "<leader>l", function()
			harpoon:list():select(4)
		end, { desc = "Jump to the [4] Harpoon file" })

		-- Toggle previous & next buffers stored within Harpoon list
		-- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
		-- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
	end,
}
