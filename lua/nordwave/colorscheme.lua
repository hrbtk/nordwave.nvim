local config = require 'nordwave.config'

-- Nord Wave Palette
local nordwave = {
  black = "#3b4252",
  red = "#bf616a",
  green = "#a3be8c",
  yellow = "#ebcb8b",
  blue = "#81a1c1",
  purple = "#b48ead",
  cyan = "#88c0d0",
  white = "#e5e9f0",
  midBlack = "#2a2a2a",
  brightBlack = "#4c566a",
  brightRed = "#bf616a",
  brightGreen = "#a3be8c",
  brightYellow = "#ebcb8b",
  brightBlue = "#81a1c1",
  brightPurple = "#b48ead",
  brightCyan = "#8fbcbb",
  brightWhite = "#eceff4",
  background = "#212121",
  foreground = "#d8dee9",
  cursorColor = "#ebcb8b",
  selectionBackground = "#d8dee9"
}

local colorscheme = {
  standardWhite = nordwave.brightWhite,
  standardBlack = nordwave.background,
}

if vim.o.background == 'light' then
  -- Add your light theme mapping here...
else
  -- UI Backgrounds
  colorscheme.editorBackground = config.transparent and 'none' or nordwave.background
  colorscheme.sidebarBackground = nordwave.black
  colorscheme.popupBackground = nordwave.brightBlack
  colorscheme.floatingWindowBackground = nordwave.black
  colorscheme.menuOptionBackground = nordwave.black
  colorscheme.cursorLineBackground = nordwave.midBlack

  -- Foreground & Text Grays
  colorscheme.mainText = nordwave.foreground
  colorscheme.emphasisText = nordwave.brightWhite
  colorscheme.commandText = nordwave.white
  colorscheme.inactiveText = nordwave.brightBlack
  colorscheme.disabledText = nordwave.black
  colorscheme.lineNumberText = nordwave.brightBlack
  colorscheme.selectedText = nordwave.selectionBackground
  colorscheme.inactiveSelectionText = nordwave.brightBlack
  colorscheme.foregroundEmphasis = nordwave.brightWhite
  colorscheme.terminalGray = nordwave.brightBlack

  -- Borders
  colorscheme.windowBorder = nordwave.black
  colorscheme.focusedBorder = nordwave.brightBlack
  colorscheme.emphasizedBorder = nordwave.cyan -- Cyan makes a great active border color in Nord

  -- Syntax & Diagnostics
  colorscheme.syntaxFunction = nordwave.blue
  colorscheme.syntaxKeyword = nordwave.purple
  colorscheme.specialKeyword = nordwave.brightCyan
  colorscheme.stringText = nordwave.green
  colorscheme.commentText = nordwave.brightBlack
  colorscheme.syntaxOperator = nordwave.white
  colorscheme.linkText = nordwave.cyan

  colorscheme.errorText = nordwave.red
  colorscheme.syntaxError = nordwave.brightRed
  colorscheme.warningText = nordwave.yellow
  colorscheme.warningEmphasis = nordwave.brightYellow
  colorscheme.successText = nordwave.green
end

return colorscheme
