local M = {}

---@param background? 'dark'|'light' defaults to vim.o.background
function M.theme(background)
  local c = require('nordwave.colorscheme').get(background)
  local config = require 'nordwave.config'
  local bg = config.transparent and 'NONE' or c.bg

  local function mode(color)
    return {
      a = { bg = color, fg = c.bg, gui = 'bold' },
      b = { bg = c.bg_alt, fg = c.fg },
      c = { bg = bg, fg = c.fg_dim },
    }
  end

  return {
    normal = mode(c.func),
    insert = mode(c.string),
    visual = mode(c.keyword),
    replace = mode(c.error),
    command = mode(c.accent),
    terminal = mode(c.constant),
    inactive = {
      a = { bg = c.bg_alt, fg = c.fg_muted },
      b = { bg = c.bg_alt, fg = c.fg_muted },
      c = { bg = bg, fg = c.fg_muted },
    },
  }
end

return M
