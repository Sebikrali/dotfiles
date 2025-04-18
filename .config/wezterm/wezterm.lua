-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.audible_bell = "Disabled"

-- ====[[ APPEARANCE ]]====

local colorschemes = {
	"Catppuccin Mocha (Gogh)",
	"duskfox",
}

local colorscheme_index = 1
config.color_scheme = colorschemes[colorscheme_index]

local function cycle_color_scheme(window)
	colorscheme_index = colorscheme_index + 1
	if colorscheme_index > #colorschemes then
		colorscheme_index = 1
	end
	print(colorschemes[colorscheme_index])

	local overrides = window:get_config_overrides() or {}
	if not overrides.color_scheme then
		overrides.color_scheme = colorschemes[colorscheme_index]
	else
		overrides.color_scheme = colorschemes[colorscheme_index]
	end

	window:set_config_overrides(overrides)
end

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
config.harfbuzz_features = { 'calt=0' }

-- ====[[ LAUNCHING PROGRAMS ]]====

local act = wezterm.action

config.keys = {
	-- paste from the clipboard
	{ key = "V", mods = "CTRL", action = act.PasteFrom("Clipboard") },
	{
		key = "Enter",
		mods = "CTRL",
		action = wezterm.action_callback(function(window, _)
			cycle_color_scheme(window)
		end),
	},
}

return config
