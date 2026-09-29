local M = {}

function M.highlights(c)
  return {
    CmpItemAbbr = { fg = c.fg },
    CmpItemAbbrDeprecated = { fg = c.fg_muted, strikethrough = true },
    CmpItemAbbrMatch = { fg = c.accent, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = c.accent, bold = true },
    CmpItemKind = { fg = c.func },
    CmpItemMenu = { fg = c.fg_muted },

    -- kind support
    CmpItemKindFunction = { fg = c.func },
    CmpItemKindMethod = { fg = c.func },
    CmpItemKindEvent = { fg = c.func },
    CmpItemKindFolder = { fg = c.func },

    CmpItemKindClass = { fg = c.type },
    CmpItemKindConstructor = { fg = c.type },
    CmpItemKindEnum = { fg = c.type },
    CmpItemKindInterface = { fg = c.type },
    CmpItemKindModule = { fg = c.type },
    CmpItemKindStruct = { fg = c.type },
    CmpItemKindTypeParameter = { fg = c.type },

    CmpItemKindConstant = { fg = c.constant },
    CmpItemKindEnumMember = { fg = c.constant },
    CmpItemKindUnit = { fg = c.constant },
    CmpItemKindValue = { fg = c.constant },

    CmpItemKindKeyword = { fg = c.keyword },
    CmpItemKindOperator = { fg = c.fg_dim },

    CmpItemKindField = { fg = c.fg },
    CmpItemKindProperty = { fg = c.fg },
    CmpItemKindReference = { fg = c.fg },
    CmpItemKindVariable = { fg = c.fg },
    CmpItemKindFile = { fg = c.fg },

    CmpItemKindText = { fg = c.fg_muted },
    CmpItemKindSnippet = { fg = c.string },
    CmpItemKindColor = { fg = c.special },
    CmpItemKindCopilot = { fg = c.special },
  }
end

return M
