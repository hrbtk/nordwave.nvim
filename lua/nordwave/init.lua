local M = {}
local palette = require("nordwave.palette").ui
local utils = require("nordwave.utils")

-- Default configuration merged internally
local config = {
  transparent = false,
  italics = {
    comments = true,
    keywords = true,
    functions = true,
    strings = true,
    variables = true,
  },
  overrides = {},
}

local function set_groups()
  local c = palette
  local bg = config.transparent and "NONE" or c.background
  local tint = function(color, alpha) return utils.mix(color, c.background, alpha) end

  local groups = {
    -- Editor UI
    Normal = { fg = c.foreground, bg = bg },
    NormalNC = { link = "Normal" },
    VertSplit = { fg = c.border, bg = bg },
    WinSeparator = { link = "VertSplit" },
    WinBar = { fg = c.foreground, bg = bg },
    WinBarNC = { fg = c.fg_muted, bg = bg },

    -- Cursor & Lines
    Cursor = { fg = c.background, bg = c.cursorColor },
    lCursor = { link = "Cursor" },
    TermCursor = { link = "Cursor" },
    CursorLine = { bg = c.bg_line },
    CursorColumn = { link = "CursorLine" },
    ColorColumn = { bg = c.bg_line },
    LineNr = { fg = c.fg_subtle },
    CursorLineNr = { fg = c.yellow },
    SignColumn = { link = "Normal" },
    FoldColumn = { fg = c.fg_subtle, bg = bg },

    -- Search, Selection, & UI Elements
    Search = { fg = c.foreground, bg = tint(c.yellow, 0.25) },
    IncSearch = { fg = c.background, bg = c.yellow },
    CurSearch = { link = "IncSearch" },
    Visual = { bg = tint(c.selectionBackground, 0.20) },
    MatchParen = { fg = c.yellow, bg = c.bg_highlight, bold = true },
    Directory = { fg = c.blue },
    Title = { fg = c.blue, bold = true },
    Conceal = { fg = c.fg_muted },
    NonText = { fg = c.fg_faint },
    Whitespace = { fg = c.fg_faint },
    EndOfBuffer = { fg = c.fg_faint },

    -- Floating Windows & Popups (Native fallback for CMP, Mason, Lazy, etc.)
    NormalFloat = { fg = c.foreground, bg = c.bg_alt },
    FloatBorder = { fg = c.border, bg = c.bg_alt },
    FloatTitle = { fg = c.yellow, bg = c.bg_alt, bold = true },
    Pmenu = { link = "NormalFloat" },
    PmenuSel = { fg = c.brightWhite, bg = c.bg_highlight, bold = true },
    PmenuSbar = { bg = c.bg_alt },
    PmenuThumb = { bg = c.border },

    -- Tabline & Statusline (Native fallback for Bufferline & Lualine auto themes)
    StatusLine = { fg = c.foreground, bg = bg },
    StatusLineNC = { fg = c.fg_muted, bg = c.bg_alt },
    TabLine = { fg = c.fg_muted, bg = c.bg_alt },
    TabLineFill = { link = "TabLine" },
    TabLineSel = { fg = c.brightWhite, bg = c.background },

    -- Standard Syntax (Neovim >= 0.10 automatically maps TS & LSP to these)
    Comment = { fg = c.fg_muted, italic = config.italics.comments },
    Constant = { fg = c.cyan },
    String = { fg = c.green, italic = config.italics.strings },
    Character = { link = "String" },
    Number = { fg = c.cyan },
    Boolean = { fg = c.cyan },
    Identifier = { fg = c.foreground },
    Function = { fg = c.blue, italic = config.italics.functions },
    Statement = { fg = c.purple },
    Operator = { fg = c.fg_dim },
    Keyword = { fg = c.purple, italic = config.italics.keywords },
    PreProc = { fg = c.purple },
    Type = { fg = c.yellow },
    Special = { fg = c.brightCyan },
    Underlined = { underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Error = { fg = c.red },
    Todo = { fg = c.yellow, bold = true },

    -- Treesitter Specific Overrides (Only things that differ from standard)
    ["@variable"] = { fg = c.foreground, italic = config.italics.variables },
    ["@variable.builtin"] = { fg = c.brightCyan },
    ["@variable.parameter"] = { fg = c.foreground, italic = config.italics.variables },
    ["@markup.heading"] = { fg = c.yellow, bold = true },
    ["@markup.link.url"] = { fg = c.cyan, underline = true },
    ["@comment.todo"] = { link = "Todo" },
    ["@comment.note"] = { fg = c.blue, bold = true },
    ["@comment.warning"] = { fg = c.yellow, bold = true },
    ["@comment.error"] = { fg = c.red, bold = true },

    -- LSP Specific Overrides
    ["@lsp.type.variable"] = {}, -- Prevent LSP from overriding Treesitter variables
    LspReferenceText = { bg = c.bg_highlight },
    LspReferenceRead = { link = "LspReferenceText" },
    LspReferenceWrite = { link = "LspReferenceText" },
    LspInlayHint = { fg = c.fg_muted, bg = c.bg_line },

    -- Diagnostics (Signs and Virtual Text inherit from these natively now)
    DiagnosticError = { fg = c.red },
    DiagnosticWarn = { fg = c.yellow },
    DiagnosticInfo = { fg = c.blue },
    DiagnosticHint = { fg = c.cyan },
    DiagnosticOk = { fg = c.green },
    DiagnosticVirtualTextError = { fg = c.red, bg = tint(c.red, 0.10) },
    DiagnosticVirtualTextWarn = { fg = c.yellow, bg = tint(c.yellow, 0.10) },
    DiagnosticVirtualTextInfo = { fg = c.blue, bg = tint(c.blue, 0.10) },
    DiagnosticVirtualTextHint = { fg = c.cyan, bg = tint(c.cyan, 0.10) },

    -- Diff & Git (Native fallback for Gitsigns & Diffview)
    Added = { fg = c.green },
    Changed = { fg = c.blue },
    Removed = { fg = c.red },
    DiffAdd = { bg = tint(c.green, 0.20) },
    DiffChange = { bg = tint(c.blue, 0.15) },
    DiffDelete = { fg = tint(c.red, 0.60), bg = tint(c.red, 0.20) },
    DiffText = { bg = tint(c.blue, 0.35) },
  }

  -- Apply overrides if any
  groups = vim.tbl_extend("force", groups, type(config.overrides) == "function" and config.overrides() or config.overrides)

  for group, parameters in pairs(groups) do
    vim.api.nvim_set_hl(0, group, parameters)
  end
end

function M.setup(opts)
  if vim.fn.has("nvim-0.12") == 0 and vim.fn.has("nvim-0.10") == 0 then
    vim.notify("Neovim 0.10+ is required for the nordwave colorscheme", vim.log.levels.ERROR, { title = "Nordwave" })
    return
  end

  config = vim.tbl_deep_extend("force", config, opts or {})

  -- Set Terminal Colors
  local term_colors = {
    palette.black, palette.red, palette.green, palette.yellow, palette.blue, palette.purple, palette.cyan, palette.white,
    palette.brightBlack, palette.brightRed, palette.brightGreen, palette.brightYellow, palette.brightBlue, palette.brightPurple, palette.brightCyan, palette.brightWhite,
  }
  for i, color in ipairs(term_colors) do
    vim.g["terminal_color_" .. (i - 1)] = color
  end
  vim.g.terminal_color_background = palette.background
  vim.g.terminal_color_foreground = palette.foreground

  set_groups()
end

return M
