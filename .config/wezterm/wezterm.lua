-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'

config.default_cursor_style = 'BlinkingBlock'

local fonts = {
  ['Fira Code'] = {
    {
      family = 'FiraCode Nerd Font',
      weight = 'Medium',
      harfbuzz_features = { 'zero' , 'ss01', 'cv05' }
    },
    {
      family = 'Fira Code',
      weight = 'Medium',
      harfbuzz_features = { 'zero' , 'ss01', 'cv05' }
    }
  },
  ['Cascadia Code'] = {
    {
      family = 'CaskaydiaCove Nerd Font',
      harfbuzz_features = { 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'zero', 'onum' }
    },
    {
      family = 'Cascadia Code',
      harfbuzz_features = { 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'zero', 'onum' }
    }
  },
  ['Cascadia Code No Ligatures'] = {
    {
      family = 'CaskaydiaCove Nerd Font',
      harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0', 'zero' }
    },
    {
      family = 'Cascadia Code',
      harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0', 'zero' }
    }
  }
}

local font_sizes = {
  ['Fira Code'] = 12.0,
  ['Cascadia Code'] = 13.0,
  ['Cascadia Code No Ligatures'] = 13.0
}

local font = 'Cascadia Code'

config.font = wezterm.font_with_fallback(fonts[font])
config.font_size = font_sizes[font]

config.window_background_opacity = 0.9
config.hide_tab_bar_if_only_one_tab = true

-- and finally, return the configuration to wezterm
return config

