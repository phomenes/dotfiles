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
  ['JetBrains Mono'] = {
    family = 'JetBrains Mono',
    nerd_family = 'JetBrainsMono Nerd Font',
    harfbuzz_features = { 'zero' }
  },
  ['Fira Code'] = {
    family = 'Fira Code',
    nerd_family = 'FiraCode Nerd Font',
    weight = 'Medium',
    harfbuzz_features = { 'zero' , 'ss01', 'cv05' }
  },
  ['Cascadia Code'] = {
    family = 'Cascadia Code',
    nerd_family = 'CaskaydiaCove Nerd Font',
    harfbuzz_features = { 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'zero', 'onum' }
  },
}

local font_sizes = {
  ['JetBrains Mono'] = 12.0,
  ['Fira Code'] = 12.0,
  ['Cascadia Code'] = 13.0,
}

local font_family = os.getenv('WEZTERM_FONT_FAMILY') or 'JetBrains Mono'
local use_nerd_font = os.getenv('WEZTERM_USE_NERD_FONT') or false
local enable_ligatures = os.getenv('WEZTERM_ENABLE_LIGATURES') or false

config.font = wezterm.font {
  family = use_nerd_font and fonts[font_family].nerd_family or fonts[font_family].family,
  weight = fonts[font_family].weight,
  harfbuzz_features = enable_ligatures and fonts[font_family].harfbuzz_features or { 'calt=0', 'clig=0', 'liga=0', 'zero' }
}
config.font_size = font_sizes[font_family]

config.keys = {
  {
    key = 't',
    mods = 'CTRL',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain'
  },
  {
    key = '1',
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(0)
  },
  {
    key = '2',
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(1)
  },
  {
    key = '3',
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(2)
  },
  {
    key = '4',
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(3)
  },
  {
    key = '5',
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(4)
  },
  {
    key = '6',
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(5)
  },
  {
    key = '7',
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(6)
  },
  {
    key = '8',
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(7)
  },
  {
    key = '9',
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(-1)
  }
}

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0
}
config.window_background_opacity = 0.9
config.hide_tab_bar_if_only_one_tab = true

-- and finally, return the configuration to wezterm
return config

