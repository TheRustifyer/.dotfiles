-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux

-- This will hold the configuration.
local config = wezterm.config_builder()

-- The user's home directory
local user_root = wezterm.home_dir

-- Loading the helpers
local helpers = require 'helpers'
local projects_loader = require 'projects_loader'

-- The projects that will be shown on the 'projects selector'
local projects = projects_loader.load_projects(user_root)

-- https://wezfurlong.org/wezterm/config/lua/gui-events/gui-startup.html
-- my cfg contains custom configuration for launch the workspaces via -- workspaces and NOT --workspaces (wezterm built in one)
wezterm.on('gui-startup', function(cmd)
    local _, pane, window = mux.spawn_window({})
    local gui_window = window:gui_window()

    if cmd then
        local args = cmd.args
        if args[1] == 'workspace' then
            for _, project in pairs(projects) do
                if project.name == args[2] then
                    -- TODO: toast notification?
                    local label = project.name
                    helpers.switch_workspace(label, gui_window, pane, project)
                end
            end
        end
    end

    gui_window:maximize()
end)

-- Launch Menu
local launch_menu = require 'launch_menu'
launch_menu.apply_to_config(config)

-- Appeareance
local appeareance = require 'appeareance'
appeareance.apply_to_config(config)

-- The powerline cfg
require 'powerline'

-- Keybidings and remaps
local keymaps = require 'keymaps'
keymaps.apply_to_config(config, projects, helpers.switch_workspace)

-- Mouse cfg
local mouse = require 'mouse'
mouse.apply_to_config(config)

-- Other general cfg
config.window_close_confirmation = 'NeverPrompt'
config.set_environment_variables = {}

return config
