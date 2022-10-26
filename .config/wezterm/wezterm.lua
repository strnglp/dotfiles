local wezterm = require 'wezterm'
local mux = wezterm.mux

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
  color_scheme = "PencilDark",
  font = wezterm.font('JetBrains Mono'),
  font_size = 16,
}
