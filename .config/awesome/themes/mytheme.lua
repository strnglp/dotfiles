local gears = require("gears")
local theme_assets = require("beautiful.theme_assets")
local dpi = require("beautiful.xresources").apply_dpi

local themes_path = gears.filesystem.get_themes_dir()

-- inherit default theme
local theme = dofile(themes_path.."default/theme.lua")

theme.wallpaper = "/usr/share/backgrounds/current"
theme.menu_width = 150
theme.font = 'Segoe UI Bold 9'

theme.bg_normal     = "#353535"  -- window.inactive.title.bg.color

theme.fg_normal     = "#f0f0f0"  -- fg_color
theme.tooltip_bg    = "#353535"  -- tooltip_bg_color

theme.bg_focus      = "#353535"  -- selected_bg_color
theme.fg_focus      = "#20bafb"  -- selected_fg_color

theme.bg_minimize   = "#202020"  -- insensitive_bg_color
theme.fg_minimize   = "#f0f0f0"  -- insensitive_fg_color

theme.bg_urgent     = "#fb0079"  -- selected-urgent-background
theme.fg_urgent     = "#fefefe"  -- selected-urgent-foreground

theme.tooltip_shape = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 2)  -- GtkWidget::tooltip-radius
end
theme.tooltip_opacity = 235  -- GtkWidget::tooltip-alpha
theme.tooltip_border_width = 0  -- default-border
-- }}}

-- to match with the rest of colorscheme
theme.bg_systray    = theme.bg_normal
theme.border_normal = theme.bg_normal
theme.border_focus  = theme.bg_focus
theme.border_marked = theme.bg_urgent  -- TODO: check when/where is it used

-- nicer snap borders
theme.snap_bg = theme.border_focus
theme.snap_shape = gears.shape.rectangle 

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.fg_normal, theme.bg_normal
)

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_focus
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Recolor Layout icons:
theme = theme_assets.recolor_layout(theme, theme.fg_normal)

-- Recolor titlebar icons:
-- TODO: find a way to show hovered/pressed state nicely
theme = theme_assets.recolor_titlebar(
    theme, theme.fg_normal, "normal"
)
theme = theme_assets.recolor_titlebar(
    theme, theme.fg_normal, "normal", "hover"
)
theme = theme_assets.recolor_titlebar(
    theme, theme.fg_normal, "normal", "press"
)
theme = theme_assets.recolor_titlebar(
    theme, theme.fg_focus, "focus"
)
theme = theme_assets.recolor_titlebar(
    theme, theme.fg_focus, "focus", "hover"
)
theme = theme_assets.recolor_titlebar(
    theme, theme.fg_focus, "focus", "press"
)

return theme
