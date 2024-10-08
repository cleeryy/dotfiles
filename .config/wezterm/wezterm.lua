-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Zero window padding
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Color Configuration
local colors, metadata = wezterm.color.load_scheme("/Users/cleeryy/.config/wezterm/themes/flexoki-dark.toml")
config.color_scheme = metadata.name
config.colors = colors

-- Font Configuration
config.font = wezterm.font("Cartograph CF", { weight = "Bold" })
config.font_size = 23

-- Tab bar configuration
config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

-- and finally, return the configuration to wezterm
return config
