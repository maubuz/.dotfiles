-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

-- Apply config choices
--
config.leader = { key = 'a', mods = 'CTRL' }

config.keys = {
-- Close panes
    {
        key = 'x',
        mods = 'LEADER',
        action = act.CloseCurrentPane { confirm = true },
    },
    {
        key = 'w',
        mods = 'CTRL|SHIFT|ALT',
        action = act.CloseCurrentPane { confirm = true },
    },
-- Resize panes
    {
        key = 'H',
        mods = 'LEADER',
        action = act.AdjustPaneSize { 'Left', 5 },
    },
    {
        key = 'J',
        mods = 'LEADER',
        action = act.AdjustPaneSize { 'Down', 5 },
    },
    {
        key = 'K',
        mods = 'LEADER',
        action = act.AdjustPaneSize { 'Up', 5 }
    },
    {
        key = 'L',
        mods = 'LEADER',
        action = act.AdjustPaneSize { 'Right', 5 },
    },
-- Terminal Scroll
    {
        key = 'PageUp', mods = 'SHIFT|ALT',
        action = act.ScrollByPage(-1)
    },
    {
        key = 'PageDown', mods = 'SHIFT|ALT',
        action = act.ScrollByPage(1)
    },
}

-- Reload configuration with CTRL+SHIFT+R
return config

