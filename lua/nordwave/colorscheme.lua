local config = require 'nordwave.config'

-- Nord Wave Palette
local nord = {
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
  background = "#212121",
  foreground = "#d8dee9",
  cursorColor = "#ebcb8b",
  selectionBackground = "#d8dee9"
}

local colorscheme = {
  standardWhite = nord.brightWhite,
  standardBlack = nord.background,
}

if vim.o.background == 'light' then
  -- Add your light theme mapping here...
else
  -- UI Backgrounds
  colorscheme.editorBackground = config.transparent and 'none' or nord.background
  colorscheme.sidebarBackground = nord.black
  colorscheme.popupBackground = nord.brightBlack
  colorscheme.floatingWindowBackground = nord.black
  colorscheme.menuOptionBackground = nord.black

  -- Foreground & Text Grays
  colorscheme.mainText = nord.foreground
  colorscheme.emphasisText = nord.brightWhite
  colorscheme.commandText = nord.white
  colorscheme.inactiveText = nord.brightBlack
  colorscheme.disabledText = nord.black
  colorscheme.lineNumberText = nord.brightBlack
  colorscheme.selectedText = nord.selectionBackground
  colorscheme.inactiveSelectionText = nord.brightBlack
  colorscheme.foregroundEmphasis = nord.brightWhite
  colorscheme.terminalGray = nord.brightBlack

  -- Borders
  colorscheme.windowBorder = nord.black
  colorscheme.focusedBorder = nord.brightBlack
  colorscheme.emphasizedBorder = nord.cyan -- Cyan makes a great active border color in Nord

  -- Syntax & Diagnostics
  colorscheme.syntaxFunction = nord.blue
  colorscheme.syntaxKeyword = nord.purple
  colorscheme.specialKeyword = nord.brightCyan
  colorscheme.stringText = nord.green
  colorscheme.commentText = nord.brightBlack
  colorscheme.syntaxOperator = nord.white
  colorscheme.linkText = nord.cyan

  colorscheme.errorText = nord.red
  colorscheme.syntaxError = nord.brightRed
  colorscheme.warningText = nord.yellow
  colorscheme.warningEmphasis = nord.brightYellow
  colorscheme.successText = nord.green
end

return colorscheme
