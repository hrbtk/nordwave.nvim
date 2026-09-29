local M = {}

function M.highlights(config)
  local c = require('nordwave.colorscheme').get()
  local bg = config.transparent and 'NONE' or c.bg_alt
  local sel = c.bg
  local italic = config.italics.bufferline or false

  return {
    background = { fg = c.fg_muted, bg = bg },
    fill = { bg = bg },

    buffer_visible = { fg = c.fg_subtle, bg = bg },
    buffer_selected = { fg = c.fg, bg = sel },
    duplicate = { fg = c.fg_muted, bg = bg, italic = italic },
    duplicate_visible = { fg = c.fg_muted, bg = bg, italic = italic },
    duplicate_selected = { fg = c.fg, bg = sel, italic = italic },

    tab = { fg = c.fg_muted, bg = bg },
    tab_selected = { fg = c.fg, bg = sel },
    tab_close = { fg = c.fg_muted, bg = bg },
    indicator_selected = { fg = c.accent, bg = sel, bold = true },

    separator = { fg = c.bg, bg = bg },
    separator_visible = { fg = c.bg, bg = bg },
    separator_selected = { fg = c.bg, bg = sel },
    offset_separator = { fg = c.bg, bg = bg },
    tab_separator = { fg = c.bg, bg = bg },
    tab_separator_selected = { fg = c.bg, bg = sel },

    close_button = { fg = c.fg_subtle, bg = bg },
    close_button_visible = { fg = c.fg_muted, bg = bg },
    close_button_selected = { fg = c.fg, bg = sel },

    numbers = { fg = c.fg_subtle, bg = bg },
    numbers_visible = { fg = c.fg_subtle, bg = bg },
    numbers_selected = { fg = c.fg, bg = sel, italic = italic },

    error = { fg = c.error, bg = bg },
    error_visible = { fg = c.error, bg = bg },
    error_selected = { fg = c.error, bg = sel, italic = italic },
    error_diagnostic = { fg = c.error, bg = bg },
    error_diagnostic_visible = { fg = c.error, bg = bg },
    error_diagnostic_selected = { fg = c.error, bg = sel },

    warning = { fg = c.warning, bg = bg },
    warning_visible = { fg = c.warning, bg = bg },
    warning_selected = { fg = c.warning, bg = sel, italic = italic },
    warning_diagnostic = { fg = c.warning, bg = bg },
    warning_diagnostic_visible = { fg = c.warning, bg = bg },
    warning_diagnostic_selected = { fg = c.warning, bg = sel },

    info = { fg = c.info, bg = bg },
    info_visible = { fg = c.info, bg = bg },
    info_selected = { fg = c.info, bg = sel, italic = italic },
    info_diagnostic = { fg = c.info, bg = bg },
    info_diagnostic_visible = { fg = c.info, bg = bg },
    info_diagnostic_selected = { fg = c.info, bg = sel },

    hint = { fg = c.hint, bg = bg },
    hint_visible = { fg = c.hint, bg = bg },
    hint_selected = { fg = c.hint, bg = sel, italic = italic },
    hint_diagnostic = { fg = c.hint, bg = bg },
    hint_diagnostic_visible = { fg = c.hint, bg = bg },
    hint_diagnostic_selected = { fg = c.hint, bg = sel },

    diagnostic = { fg = c.fg_subtle, bg = bg },
    diagnostic_visible = { fg = c.fg_subtle, bg = bg },
    diagnostic_selected = { fg = c.fg_subtle, bg = sel, italic = italic },

    modified = { fg = c.accent, bg = bg },
    modified_visible = { fg = c.accent, bg = bg },
    modified_selected = { fg = c.accent, bg = sel },
  }
end

return M
