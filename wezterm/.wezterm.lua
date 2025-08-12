-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 18
config.color_scheme = "tokyonight_night"
-- config.color_scheme = "tokyonight_day"

config.font = wezterm.font("JetBrains Mono")

-- Window style
config.window_frame = {
	active_titlebar_bg = "#1b1b1b",
	-- active_titlebar_bg = "none",
	inactive_titlebar_bg = "#1b1b1b",
	-- 標題列文字顏色
	active_titlebar_fg = "#c0c0c0",
	-- active_titlebar_fg = "#000000",
	-- active_titlebar_fg = "none",
	inactive_titlebar_fg = "#555555",
}

config.window_padding = {
	top = 0,
	bottom = 0,
}

config.window_background_opacity = 0.9

-- Finally, return the configuration to wezterm:
return config
