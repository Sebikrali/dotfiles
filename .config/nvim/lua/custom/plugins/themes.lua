return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			transparent_background = true,
		},
		init = function()
			-- Load the colorscheme here.
			vim.cmd.colorscheme("catppuccin") -- catppuccin, rose-pine, everforest, nightfox, night-owl, tokyonight

			-- You can configure highlights by doing something like:
			-- vim.cmd.hi 'Comment gui=none'
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		opts = {
			variant = "moon", -- auto, main, moon, or dawn
			styles = {
				transparency = true,
			},
		},
	},
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000,
		config = function()
			require("everforest").setup({
				background = "hard", -- soft, medium, hard
				transparent_background_level = 1, -- higher = more transparent
			})
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		opts = {
			transparent = false,
		},
	},
	{
		"oxfist/night-owl.nvim",
		lazy = false,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "storm", -- `storm`, `moon`, `night` and `day`
			transparent = true, -- Enable this to disable setting the background color
		},
	},
}
