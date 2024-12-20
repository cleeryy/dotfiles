-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Zero window padding
config.window_padding = {
	left = 50,
	right = 50,
	top = 50,
	bottom = 50,
}

-- Color Configuration
config.color_scheme = "catppuccin-mocha"

-- Font Configuration
config.font = wezterm.font("CaskaydiaCove Nerd Font Mono")
config.font_size = 23

-- Tab bar configuration
config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 5

-- and finally, return the configuration to wezterm
return config
