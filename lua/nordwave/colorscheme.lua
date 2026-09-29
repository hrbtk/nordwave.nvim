local M = {}

-- Upstream Nord Wave palette (iTerm2-Color-Schemes, "Nord Wave.json")
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

-- Editor palettes: upstream colors plus neutral shades derived from the
-- charcoal background, so UI surfaces stay warm instead of Nord's blue-gray.
M.palettes = {
  dark = vim.tbl_extend('error', M.nordwave, {
    -- neutral surfaces, lightest last
    bg_line = "#282828",
    bg_alt = "#2b2b2b",
    bg_highlight = "#3a3a3a",
    border = "#474747",

    -- neutral text shades, brightest first
    fg_dim = "#9aa0aa",
    fg_muted = "#6b717d",
    fg_subtle = "#56595f",
    fg_faint = "#3f3f3f",
  }),
  -- light = {}, -- Light variant disabled for now, see M.get()
}

---@param background? 'dark'|'light' defaults to vim.o.background
function M.get(background)
  -- Light variant disabled for now; restore this line to select by background:
  -- local p = M.palettes[background or vim.o.background] or M.palettes.dark
  local _ = background
  local p = M.palettes.dark

  return {
    terminal = {
      p.black, p.red, p.green, p.yellow, p.blue, p.purple, p.cyan, p.white,
      p.brightBlack, p.brightRed, p.brightGreen, p.brightYellow,
      p.brightBlue, p.brightPurple, p.brightCyan, p.brightWhite,
    },

    -- Surfaces
    bg = p.background,
    bg_alt = p.bg_alt,             -- floats, popup menu, sidebars, tabline
    bg_line = p.bg_line,           -- cursorline, colorcolumn
    bg_highlight = p.bg_highlight, -- selected menu item, folds, references
    border = p.border,

    -- Text
    fg = p.foreground,
    fg_emphasis = p.brightWhite,
    fg_dim = p.fg_dim,       -- punctuation, operators
    fg_muted = p.fg_muted,   -- comments, inactive text
    fg_subtle = p.fg_subtle, -- line numbers
    fg_faint = p.fg_faint,   -- whitespace, non-text

    -- Accents
    cursor = p.cursorColor,
    selection = p.selectionBackground,
    accent = p.yellow,

    -- Syntax
    keyword = p.purple,
    func = p.blue,
    type = p.yellow,
    string = p.green,
    constant = p.cyan,
    special = p.brightCyan,
    link = p.cyan,

    -- Diagnostics
    error = p.red,
    warning = p.yellow,
    info = p.blue,
    hint = p.cyan,
    ok = p.green,

    -- Diff
    added = p.green,
    changed = p.blue,
    removed = p.red,
  }
end

return M
