----- Reload configuration with CTRL+SHIFT+R -----

-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

-- Apply config choices
--
config.leader = { key = "Alt", mods = "SHIFT" }

local mau_mod = "SHIFT|ALT"

config.keys = {
	-- Pane management
	{
		key = "w",
		mods = mau_mod,
		action = act.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "z",
		mods = mau_mod,
		action = act.PaneSelect({
			mode = "MoveToNewWindow",
		}),
	},
	-- Move tab (pane) interactively
	-- Ref: https://github.com/goerz/wezterm-config/blob/ea62c50175216ea137ade55e2a23858cb2642651/wezterm.lua
	{
		key = "x",
		mods = mau_mod,
		action = wezterm.action_callback(function(window, pane)
			local function get_tab_title(t)
				if t:get_title() == "" then
					local p = t:active_pane()
					return p:get_title()
				else
					return t:get_title()
				end
			end

			local choices = {}
			for _, w in ipairs(wezterm.mux.all_windows()) do
				local window_width = 0
				local window_height = 0
				local tabs = {}
				for _, t in ipairs(w:tabs()) do
					table.insert(tabs, get_tab_title(t))
					if t:get_size().rows > window_height then
						window_height = t:get_size().rows
					end
					if t:get_size().cols > window_width then
						window_width = t:get_size().cols
					end
				end
				local tab_titles = table.concat(tabs, ", ")
				table.insert(choices, {
					id = tostring(w:window_id()),
					label = "window "
						.. tostring(w:window_id())
						.. " ("
						.. window_width
						.. "x"
						.. window_height
						.. ") with "
						.. tostring(#w:tabs())
						.. " tabs: "
						.. tab_titles,
				})
			end
			table.insert(choices, { id = "new", label = "new window" })

			window:perform_action(
				act.InputSelector({
					action = wezterm.action_callback(function(window, pane, id, label)
						if id then
							local orig_tab = pane:tab()
							local tab_title = nil
							if orig_tab then
								tab_title = orig_tab:get_title()
							end
							local wezterm_bin = wezterm.executable_dir .. "/wezterm"
							if id == "new" then
								wezterm.log_info("CMD-SHIFT-T: you selected ", label)
								local tab, _ = pane:move_to_new_window()
								if tab_title then
									tab.set_title(tab_title)
								end
							else
								local cmd = {
									wezterm_bin,
									"cli",
									"move-pane-to-new-tab",
									"--pane-id",
									pane:pane_id(),
									"--window-id",
									id,
								}
								wezterm.log_info(
									"CMD-SHIFT-T: you selected ",
									label,
									"->",
									wezterm.shell_join_args(cmd)
								)
								local success, stdout, stderr = wezterm.run_child_process(cmd)
								wezterm.log_info(success, stdout, stderr)
								if tab_title then
									pane:tab():set_title(tab_title)
								end
							end
						end
					end),
					title = "Choose target window",
					choices = choices,
					description = "Move pane "
						.. pane:pane_id()
						.. " (tab title '"
						.. get_tab_title(pane:tab())
						.. "') from window "
						.. pane:window():window_id()
						.. " to…",
				}),
				pane
			)
		end),
	},
	-- Resize panes
	{
		key = "H",
		mods = mau_mod,
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "J",
		mods = mau_mod,
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "K",
		mods = mau_mod,
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "L",
		mods = mau_mod,
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
	-- Terminal Scroll
	{
		key = "PageUp",
		mods = mau_mod,
		action = act.ScrollByPage(-1),
	},
	{
		key = "PageDown",
		mods = mau_mod,
		action = act.ScrollByPage(1),
	},
}

return config
