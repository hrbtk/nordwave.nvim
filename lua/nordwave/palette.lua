local M = {}

local nordwave_dark = {
  background = "#212121",
  foreground = "#d8dee9",
  cursorColor = "#ebcb8b",
  selectionBackground = "#d8dee9",
  black = "#3b4252",
  red = "#bf616a",
  green = "#a3be8c",
  yellow = "#ebcb8b",
  blue = "#81a1c1",
  purple = "#b48ead",
  cyan = "#88c0d0",
  white = "#e5e9f0",
  brightBlack = "#4c566a",
  brightRed = "#bf616a",
  brightGreen = "#a3be8c",
  brightYellow = "#ebcb8b",
  brightBlue = "#81a1c1",
  brightPurple = "#b48ead",
  brightCyan = "#8fbcbb",
  brightWhite = "#eceff4",
}

local nordwave_light = {
  background = "#e5e9f0",
  foreground = "#414858",
  cursorColor = "#7bb3c3",
  selectionBackground = "#d8dee9",
  black = "#3b4252",
  red = "#bf616a",
  green = "#96b17f",
  yellow = "#c5a565",
  blue = "#81a1c1",
  purple = "#b48ead",
  cyan = "#7bb3c3",
  white = "#a5abb6",
  brightBlack = "#4c566a",
  brightRed = "#bf616a",
  brightGreen = "#96b17f",
  brightYellow = "#c5a565",
  brightBlue = "#81a1c1",
  brightPurple = "#b48ead",
  brightCyan = "#82afae",
  brightWhite = "#eceff4",
}

M.ui = {
  dark = vim.tbl_extend('force', nordwave_dark, {
    bg_line = "#282828",
    bg_alt = "#2b2b2b",
    bg_highlight = "#3a3a3a",
    border = "#474747",
    fg_dim = "#9aa0aa",
    fg_muted = "#6b717d",
    fg_subtle = "#56595f",
    fg_faint = "#3f3f3f",
  }),

  light = vim.tbl_extend('force', nordwave_light, {
    bg_line = "#d8dee9",      -- matches selectionBackground for active lines
    bg_alt = "#eceff4",       -- brighter surface for floating windows
    bg_highlight = "#d8dee9", -- selected items in menus
    border = "#c8d0e0",       -- subtle border contrast against e5e9f0
    fg_dim = "#4c566a",       -- maps to brightBlack
    fg_muted = "#6b778d",     -- mid-step for comments
    fg_subtle = "#838f9f",    -- line numbers
    fg_faint = "#a5abb6",     -- maps to white (inactive elements)
  })
}

return M
