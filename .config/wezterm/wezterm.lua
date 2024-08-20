-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.audible_bell = "Disabled"

-- ====[[ APPEARANCE ]]====

config.color_scheme = "Catppuccin Mocha (Gogh)"

config.initial_cols = 225
config.initial_rows = 53
config.window_decorations = "NONE"

config.hide_tab_bar_if_only_one_tab = true

config.window_background_opacity = 0.9

config.window_padding = {
	left = 20,
	right = 10,
	top = 10,
	bottom = 10,
}

config.font = wezterm.font("JetBrains Mono", { weight = "Medium" })
config.font_size = 14

-- ====[[ LAUNCHING PROGRAMS ]]====

config.default_prog = { "/bin/zsh" }

return config
