local M = {}

M.nordwave = {
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

M.ui = vim.tbl_extend('force', M.nordwave, {
  -- neutral surfaces
  bg_line = "#282828",
  bg_alt = "#2b2b2b",
  bg_highlight = "#3a3a3a",
  border = "#474747",

  -- neutral text shades
  fg_dim = "#9aa0aa",
  fg_muted = "#6b717d",
  fg_subtle = "#56595f",
  fg_faint = "#3f3f3f",
})

return M
