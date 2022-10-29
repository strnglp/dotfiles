local wezterm = require 'wezterm'
local mux = wezterm.mux

function scheme_for_appearance(appearance)
  if appearance:find("Dark") then
    return "ModifiedPencilDark"
  else
    return "ModifiedPencilLight"
  end
end

wezterm.on("window-config-reloaded", function(window, pane)
  local overrides = window:get_config_overrides() or {}
  local appearance = window:get_appearance()
  local scheme = scheme_for_appearance(appearance)
  if overrides.color_scheme ~= scheme then
    overrides.color_scheme = scheme
    window:set_config_overrides(overrides)
  end
end)

-- Make a nicely sized centered window on my laptop
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():set_position(300,350)
  window:gui_window():set_inner_size(2850, 1600)
end)

return {
    window_padding = {
    left = 2,
    right = 2,
    top = 0,
    bottom = 0,
  },
  audible_bell = "Disabled",
  hide_tab_bar_if_only_one_tab = true,
  window_close_confirmation = "NeverPrompt",
  window_background_opacity = 0.95,
  window_decorations = "RESIZE",
  --color_scheme = "ModifiedPencilDark",
  --color_scheme = "ModifiedPencilLight",
  font = wezterm.font('JetBrains Mono'),
  font_size = 16,
}
