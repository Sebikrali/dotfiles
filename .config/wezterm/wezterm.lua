-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.audible_bell = "Disabled"

-- ====[[ APPEARANCE ]]====

Colorschemes = {
	"Catppuccin Mocha (Gogh)",
	"Everforest Dark Hard (Gogh)",
	"Kasugano (terminal.sexy)",
	"Azu (Gogh)",
	"duskfox",
}

Colorscheme_index = 1
config.color_scheme = Colorschemes[Colorscheme_index]

function Cycle_color_scheme(window, pane)
	Colorscheme_index = Colorscheme_index + 1
	if Colorscheme_index > #Colorschemes then
		Colorscheme_index = 1
	end

	window:set_config_overrides({
		colors = {
			background = "black",
		},
		color_scheme = Colorschemes[Colorscheme_index],
	})
end

wezterm.on("window-config-reloaded", function(window, _)
	local overrides = window:get_config_overrides() or {}
	if overrides.color_scheme then
		print("Overides: " .. overrides.color_scheme)
	end
end)

-- config.colors = {
-- 	background = "#11111B",
-- }

config.initial_cols = 225
config.initial_rows = 53
config.window_decorations = "NONE"

config.hide_tab_bar_if_only_one_tab = true

config.window_background_opacity = 0.85

config.window_padding = {
	left = 20,
	right = 10,
	top = 10,
	bottom = 10,
}

config.font = wezterm.font("JetBrains Mono", { weight = "Medium" })
config.font_size = 14

-- ====[[ LAUNCHING PROGRAMS ]]====

-- config.default_prog = { "/bin/zsh" }

local act = wezterm.action

config.keys = {
	-- paste from the clipboard
	{ key = "V", mods = "CTRL", action = act.PasteFrom("Clipboard") },
	{
		key = "Enter",
		mods = "CTRL",
		action = wezterm.action_callback(function(window, pane)
			Cycle_color_scheme(window, pane)
		end),
	},
}

return config
