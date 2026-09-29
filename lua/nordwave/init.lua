local bufferline = require 'nordwave.integrations.bufferline'
local cmp = require 'nordwave.integrations.cmp'
local config = require 'nordwave.config'
local utils = require 'nordwave.utils'
local theme = {}

local function set_terminal_colors(c)
    for i, color in ipairs(c.terminal) do
        vim.g['terminal_color_' .. (i - 1)] = color
    end
    vim.g.terminal_color_background = c.bg
    vim.g.terminal_color_foreground = c.fg
end

local function set_groups(c)
    local bg = config.transparent and 'NONE' or c.bg
    local function tint(color, alpha)
        return utils.mix(color, c.bg, alpha)
    end

    local groups = {
        ------------------------------------------------------------------------
        -- Editor UI
        ------------------------------------------------------------------------

        -- Windows
        Normal = { fg = c.fg, bg = bg },
        NormalNC = { link = 'Normal' },
        VertSplit = { fg = c.border, bg = bg },
        WinSeparator = { link = 'VertSplit' },
        WinBar = { fg = c.fg, bg = bg },
        WinBarNC = { fg = c.fg_muted, bg = bg },

        -- Cursor
        Cursor = { fg = c.bg, bg = c.cursor },
        lCursor = { link = 'Cursor' },
        CursorIM = { link = 'Cursor' },
        TermCursor = { link = 'Cursor' },
        TermCursorNC = { fg = c.bg, bg = c.fg_muted },
        CursorLine = { bg = c.bg_line },
        CursorColumn = { link = 'CursorLine' },

        -- Gutter & columns
        LineNr = { fg = c.fg_subtle },
        CursorLineNr = { fg = c.accent },
        SignColumn = { link = 'Normal' },
        FoldColumn = { fg = c.fg_subtle, bg = bg },
        ColorColumn = { bg = c.bg_line },

        -- Buffer text
        Conceal = { fg = c.fg_muted },
        Directory = { fg = c.func },
        EndOfBuffer = { fg = c.fg_faint },
        Folded = { fg = c.fg_muted, bg = c.bg_alt },
        MatchParen = { fg = c.accent, bg = c.bg_highlight, bold = true },
        NonText = { fg = c.fg_faint },
        SpecialKey = { fg = c.fg_faint },
        Title = { fg = c.func, bold = true },
        Whitespace = { fg = c.fg_faint },

        -- Search & selection
        Search = { fg = c.fg, bg = tint(c.accent, 0.25) },
        CurSearch = { link = 'IncSearch' },
        IncSearch = { fg = c.bg, bg = c.accent },
        Substitute = { link = 'IncSearch' },
        Visual = { bg = tint(c.selection, 0.20) },
        VisualNOS = { link = 'Visual' },
        QuickFixLine = { bg = c.bg_highlight, bold = true },

        -- Floating windows & popup menu
        NormalFloat = { fg = c.fg, bg = c.bg_alt },
        FloatBorder = { fg = c.border, bg = c.bg_alt },
        FloatTitle = { fg = c.accent, bg = c.bg_alt, bold = true },
        FloatFooter = { fg = c.fg_muted, bg = c.bg_alt },
        Pmenu = { link = 'NormalFloat' },
        PmenuSel = { fg = c.fg_emphasis, bg = c.bg_highlight, bold = true },
        PmenuKind = { fg = c.func, bg = c.bg_alt },
        PmenuKindSel = { fg = c.func, bg = c.bg_highlight, bold = true },
        PmenuExtra = { fg = c.fg_muted, bg = c.bg_alt },
        PmenuExtraSel = { fg = c.fg_muted, bg = c.bg_highlight },
        PmenuMatch = { fg = c.accent, bg = c.bg_alt, bold = true },
        PmenuMatchSel = { fg = c.accent, bg = c.bg_highlight, bold = true },
        PmenuSbar = { bg = c.bg_alt },
        PmenuThumb = { bg = c.border },
        WildMenu = { link = 'PmenuSel' },

        -- Statusline & tabline
        StatusLine = { fg = c.fg, bg = bg },
        StatusLineNC = { fg = c.fg_muted, bg = c.bg_alt },
        StatusLineTerm = { link = 'StatusLine' },
        StatusLineTermNC = { link = 'StatusLineNC' },
        TabLine = { fg = c.fg_muted, bg = c.bg_alt },
        TabLineFill = { link = 'TabLine' },
        TabLineSel = { fg = c.fg_emphasis, bg = c.bg },

        -- Messages
        ModeMsg = { fg = c.fg, bold = true },
        MsgArea = { link = 'Normal' },
        MsgSeparator = { link = 'WinSeparator' },
        MoreMsg = { fg = c.func },
        Question = { fg = c.func },
        ErrorMsg = { fg = c.error },
        WarningMsg = { fg = c.warning },

        -- Diff
        DiffAdd = { bg = tint(c.added, 0.20) },
        DiffChange = { bg = tint(c.changed, 0.15) },
        DiffDelete = { fg = tint(c.removed, 0.60), bg = tint(c.removed, 0.20) },
        DiffText = { bg = tint(c.changed, 0.35) },
        Added = { fg = c.added },
        Changed = { fg = c.changed },
        Removed = { fg = c.removed },

        -- Spelling
        SpellBad = { undercurl = true, sp = c.error },
        SpellCap = { undercurl = true, sp = c.warning },
        SpellLocal = { undercurl = true, sp = c.info },
        SpellRare = { undercurl = true, sp = c.hint },

        ------------------------------------------------------------------------
        -- Syntax (:h group-name)
        ------------------------------------------------------------------------

        Comment = { fg = c.fg_muted, italic = config.italics.comments or false },

        -- Constants
        Constant = { fg = c.constant },
        String = { fg = c.string, italic = config.italics.strings or false },
        Character = { fg = c.string },
        Number = { fg = c.constant },
        Float = { link = 'Number' },
        Boolean = { fg = c.constant },

        -- Identifiers & functions
        Identifier = { fg = c.fg },
        Function = { fg = c.func, italic = config.italics.functions or false },

        -- Statements
        Statement = { fg = c.keyword },
        Conditional = { link = 'Keyword' },
        Repeat = { link = 'Keyword' },
        Label = { fg = c.keyword },
        Operator = { fg = c.fg_dim },
        Keyword = { fg = c.keyword, italic = config.italics.keywords or false },
        Exception = { link = 'Keyword' },

        -- Preprocessor
        PreProc = { fg = c.keyword },
        Include = { link = 'Keyword' },
        Define = { fg = c.keyword },
        Macro = { fg = c.special },
        PreCondit = { fg = c.keyword },

        -- Types
        Type = { fg = c.type },
        StorageClass = { link = 'Keyword' },
        Structure = { link = 'Type' },
        Typedef = { link = 'Type' },

        -- Specials
        Special = { fg = c.special },
        SpecialChar = { fg = c.special },
        Tag = { fg = c.func },
        Delimiter = { fg = c.fg_dim },
        SpecialComment = { fg = c.fg_muted, bold = true },
        Debug = { fg = c.special },

        -- Misc
        Underlined = { underline = true },
        Bold = { bold = true },
        Italic = { italic = true },
        Ignore = { fg = c.fg_faint },
        Error = { fg = c.error },
        Todo = { fg = c.accent, bold = true },

        ------------------------------------------------------------------------
        -- LSP
        ------------------------------------------------------------------------

        LspReferenceText = { bg = c.bg_highlight },
        LspReferenceRead = { link = 'LspReferenceText' },
        LspReferenceWrite = { link = 'LspReferenceText' },
        LspCodeLens = { fg = c.fg_muted },
        LspCodeLensSeparator = { fg = c.fg_faint },
        LspInlayHint = { fg = c.fg_muted, bg = c.bg_line },
        LspSignatureActiveParameter = { fg = c.accent, bold = true },

        ------------------------------------------------------------------------
        -- Diagnostics
        ------------------------------------------------------------------------

        DiagnosticError = { fg = c.error },
        DiagnosticWarn = { fg = c.warning },
        DiagnosticInfo = { fg = c.info },
        DiagnosticHint = { fg = c.hint },
        DiagnosticOk = { fg = c.ok },

        DiagnosticVirtualTextError = { fg = c.error, bg = tint(c.error, 0.10) },
        DiagnosticVirtualTextWarn = { fg = c.warning, bg = tint(c.warning, 0.10) },
        DiagnosticVirtualTextInfo = { fg = c.info, bg = tint(c.info, 0.10) },
        DiagnosticVirtualTextHint = { fg = c.hint, bg = tint(c.hint, 0.10) },
        DiagnosticVirtualTextOk = { fg = c.ok, bg = tint(c.ok, 0.10) },

        DiagnosticUnderlineError = { undercurl = true, sp = c.error },
        DiagnosticUnderlineWarn = { undercurl = true, sp = c.warning },
        DiagnosticUnderlineInfo = { undercurl = true, sp = c.info },
        DiagnosticUnderlineHint = { undercurl = true, sp = c.hint },
        DiagnosticUnderlineOk = { undercurl = true, sp = c.ok },

        DiagnosticFloatingError = { link = 'DiagnosticError' },
        DiagnosticFloatingWarn = { link = 'DiagnosticWarn' },
        DiagnosticFloatingInfo = { link = 'DiagnosticInfo' },
        DiagnosticFloatingHint = { link = 'DiagnosticHint' },
        DiagnosticFloatingOk = { link = 'DiagnosticOk' },

        DiagnosticSignError = { link = 'DiagnosticError' },
        DiagnosticSignWarn = { link = 'DiagnosticWarn' },
        DiagnosticSignInfo = { link = 'DiagnosticInfo' },
        DiagnosticSignHint = { link = 'DiagnosticHint' },
        DiagnosticSignOk = { link = 'DiagnosticOk' },

        DiagnosticUnnecessary = { fg = c.fg_muted },
        DiagnosticDeprecated = { strikethrough = true, sp = c.fg_muted },

        ------------------------------------------------------------------------
        -- Tree-sitter
        ------------------------------------------------------------------------

        -- Comments
        ['@comment'] = { link = 'Comment' },
        ['@comment.documentation'] = { link = 'Comment' },
        ['@comment.todo'] = { link = 'Todo' },
        ['@comment.note'] = { fg = c.info, bold = true },
        ['@comment.warning'] = { fg = c.warning, bold = true },
        ['@comment.error'] = { fg = c.error, bold = true },

        -- Constants & literals
        ['@constant'] = { link = 'Constant' },
        ['@constant.builtin'] = { link = 'Constant' },
        ['@constant.macro'] = { link = 'Macro' },
        ['@string'] = { link = 'String' },
        ['@string.documentation'] = { link = 'String' },
        ['@string.escape'] = { fg = c.special },
        ['@string.regexp'] = { fg = c.special },
        ['@string.special'] = { fg = c.special },
        ['@string.special.symbol'] = { fg = c.constant },
        ['@string.special.url'] = { link = '@markup.link.url' },
        ['@character'] = { link = 'Character' },
        ['@character.special'] = { fg = c.special },
        ['@number'] = { link = 'Number' },
        ['@boolean'] = { link = 'Boolean' },

        -- Functions
        ['@function'] = { link = 'Function' },
        ['@function.call'] = { link = 'Function' },
        ['@function.builtin'] = { link = 'Function' },
        ['@function.macro'] = { link = 'Macro' },
        ['@function.method'] = { link = 'Function' },
        ['@function.method.call'] = { link = 'Function' },
        ['@constructor'] = { fg = c.type },

        -- Variables, parameters & properties
        ['@variable'] = { fg = c.fg, italic = config.italics.variables or false },
        ['@variable.builtin'] = { fg = c.special },
        ['@variable.member'] = { fg = c.fg },
        ['@variable.parameter'] = { fg = c.fg, italic = config.italics.variables or false },
        ['@variable.parameter.builtin'] = { fg = c.special },
        ['@property'] = { fg = c.fg },

        -- Types & modules
        ['@type'] = { link = 'Type' },
        ['@type.builtin'] = { link = 'Type' },
        ['@type.definition'] = { link = 'Type' },
        ['@module'] = { link = 'Type' },
        ['@module.builtin'] = { link = 'Type' },
        ['@attribute'] = { fg = c.special },
        ['@attribute.builtin'] = { fg = c.special },

        -- Keywords & operators
        ['@keyword'] = { link = 'Keyword' },
        ['@keyword.operator'] = { link = 'Keyword' },
        ['@keyword.directive'] = { link = 'PreProc' },
        ['@label'] = { link = 'Label' },
        ['@operator'] = { link = 'Operator' },
        ['@debug'] = { link = 'Debug' },

        -- Punctuation
        ['@punctuation'] = { fg = c.fg_dim },
        ['@punctuation.bracket'] = { fg = c.fg_dim },
        ['@punctuation.delimiter'] = { fg = c.fg_dim },
        ['@punctuation.special'] = { fg = c.special },
        ['@punctuation.separator.keyvalue'] = { fg = c.fg_dim },

        -- Tags
        ['@tag'] = { link = 'Tag' },
        ['@tag.builtin'] = { link = 'Tag' },
        ['@tag.attribute'] = { fg = c.special },
        ['@tag.delimiter'] = { fg = c.fg_dim },

        -- Markup
        ['@markup'] = { fg = c.fg },
        ['@markup.heading'] = { fg = c.accent, bold = true },
        ['@markup.strong'] = { link = 'Bold' },
        ['@markup.italic'] = { link = 'Italic' },
        ['@markup.strikethrough'] = { strikethrough = true },
        ['@markup.underline'] = { link = 'Underlined' },
        ['@markup.quote'] = { fg = c.fg_muted, italic = true },
        ['@markup.math'] = { fg = c.special },
        ['@markup.list'] = { fg = c.keyword },
        ['@markup.list.checked'] = { fg = c.ok },
        ['@markup.list.unchecked'] = { fg = c.fg_muted },
        ['@markup.raw'] = { fg = c.string },
        ['@markup.link'] = { fg = c.link },
        ['@markup.link.label'] = { fg = c.link },
        ['@markup.link.url'] = { fg = c.link, sp = c.link, underline = true },

        -- Diff
        ['@diff.plus'] = { link = 'Added' },
        ['@diff.minus'] = { link = 'Removed' },
        ['@diff.delta'] = { link = 'Changed' },

        -- Language-specific overrides
        ['@label.vimdoc'] = { link = '@markup.link.url' }, -- For help files
        ['@markup.link.url.html'] = { underline = true },  -- For html

        ------------------------------------------------------------------------
        -- LSP semantic tokens
        ------------------------------------------------------------------------

        ['@lsp.type.class'] = { link = '@type' },
        ['@lsp.type.decorator'] = { link = '@attribute' },
        ['@lsp.type.enum'] = { link = '@type' },
        ['@lsp.type.enumMember'] = { link = '@constant' },
        ['@lsp.type.function'] = { link = '@function' },
        ['@lsp.type.interface'] = { link = '@type' },
        ['@lsp.type.macro'] = { link = '@function.macro' },
        ['@lsp.type.method'] = { link = '@function.method' },
        ['@lsp.type.namespace'] = { link = '@module' },
        ['@lsp.type.parameter'] = { link = '@variable.parameter' },
        ['@lsp.type.property'] = { link = '@property' },
        ['@lsp.type.struct'] = { link = '@type' },
        ['@lsp.type.type'] = { link = '@type' },
        ['@lsp.type.typeParameter'] = { link = '@type' },
        ['@lsp.type.variable'] = {},
        ['@lsp.typemod.function.declaration'] = { link = '@function' },
        ['@lsp.typemod.function.readonly'] = { link = '@function' },
        ['@lsp.typemod.variable.defaultLibrary'] = { link = '@variable.builtin' },
    }

    -- integrations
    groups = vim.tbl_extend('force', groups, cmp.highlights(c))

    -- overrides
    groups = vim.tbl_extend(
        'force',
        groups,
        type(config.overrides) == 'function' and config.overrides()
        or config.overrides
    )

    for group, parameters in pairs(groups) do
        vim.api.nvim_set_hl(0, group, parameters)
    end
end

function theme.setup(values)
    setmetatable(
        config,
        { __index = vim.tbl_deep_extend('force', config.defaults, values or {}) }
    )
end

---@param name? string colorscheme name reported in vim.g.colors_name
function theme.colorscheme(name)
    if vim.fn.has 'nvim-0.10' == 0 then
        vim.notify(
            'Neovim 0.10+ is required for the nordwave colorscheme',
            vim.log.levels.ERROR,
            { title = 'Nordwave' }
        )
        return
    end

    vim.api.nvim_command 'hi clear'
    if vim.fn.exists 'syntax_on' == 1 then
        vim.api.nvim_command 'syntax reset'
    end

    vim.g.VM_theme_set_by_colorscheme = true
    vim.o.termguicolors = true
    vim.g.colors_name = name or 'nordwave'

    local colors = require('nordwave.colorscheme').get()
    set_terminal_colors(colors)
    set_groups(colors)
end

-- `require('nordwave').bufferline.highlights` is built on access, so it works
-- without calling setup() and always reflects the current background.
return setmetatable(theme, {
    __index = function(_, key)
        if key == 'bufferline' then
            return { highlights = bufferline.highlights(config) }
        end
    end,
})
