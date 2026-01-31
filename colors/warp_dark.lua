-- Warp Dark theme for Neovim
-- Exact color match from Warp terminal

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "warp_dark"

-- Warp Dark palette
local c = {
  bg = "#000000",
  fg = "#ffffff",
  accent = "#00c2ff",

  -- Normal colors
  black = "#616161",
  red = "#ff8272",
  green = "#b4fa72",
  yellow = "#fefdc2",
  blue = "#a5d5fe",
  magenta = "#ff8ffd",
  cyan = "#d0d1fe",
  white = "#f1f1f1",

  -- Bright colors
  bright_black = "#8e8e8e",
  bright_red = "#ffc4bd",
  bright_green = "#d6fcb9",
  bright_yellow = "#fefdd5",
  bright_blue = "#c1e3fe",
  bright_magenta = "#ffb1fe",
  bright_cyan = "#e5e6fe",
  bright_white = "#feffff",

  -- UI colors (derived)
  selection = "#1a3a4a",
  comment = "#8e8e8e",
  line_nr = "#616161",
  cursor_line = "#0d0d0d",
  visual = "#1a3a4a",
  search = "#3d5c00",
  match = "#00c2ff",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Editor
hi("Normal", { fg = c.fg, bg = c.bg })
hi("NormalFloat", { fg = c.fg, bg = "#0a0a0a" })
hi("FloatBorder", { fg = c.accent, bg = "#0a0a0a" })
hi("Cursor", { fg = c.bg, bg = c.accent })
hi("CursorLine", { bg = c.cursor_line })
hi("CursorColumn", { bg = c.cursor_line })
hi("LineNr", { fg = c.line_nr })
hi("CursorLineNr", { fg = c.accent, bold = true })
hi("SignColumn", { bg = c.bg })
hi("VertSplit", { fg = c.black })
hi("WinSeparator", { fg = c.black })
hi("StatusLine", { fg = c.fg, bg = "#0a0a0a" })
hi("StatusLineNC", { fg = c.black, bg = "#0a0a0a" })
hi("Pmenu", { fg = c.fg, bg = "#0a0a0a" })
hi("PmenuSel", { fg = c.bg, bg = c.accent })
hi("PmenuSbar", { bg = "#1a1a1a" })
hi("PmenuThumb", { bg = c.accent })
hi("TabLine", { fg = c.black, bg = "#0a0a0a" })
hi("TabLineFill", { bg = "#0a0a0a" })
hi("TabLineSel", { fg = c.fg, bg = c.bg })
hi("Visual", { bg = c.visual })
hi("Search", { fg = c.bg, bg = c.green })
hi("IncSearch", { fg = c.bg, bg = c.accent })
hi("MatchParen", { fg = c.accent, bold = true, underline = true })
hi("Folded", { fg = c.comment, bg = "#0a0a0a" })
hi("FoldColumn", { fg = c.black })
hi("NonText", { fg = c.black })
hi("SpecialKey", { fg = c.black })
hi("Directory", { fg = c.blue })
hi("Title", { fg = c.accent, bold = true })
hi("ErrorMsg", { fg = c.red })
hi("WarningMsg", { fg = c.yellow })
hi("MoreMsg", { fg = c.green })
hi("Question", { fg = c.accent })

-- Syntax
hi("Comment", { fg = c.comment, italic = true })
hi("Constant", { fg = c.bright_yellow })
hi("String", { fg = c.green })
hi("Character", { fg = c.green })
hi("Number", { fg = c.bright_yellow })
hi("Boolean", { fg = c.magenta })
hi("Float", { fg = c.bright_yellow })
hi("Identifier", { fg = c.fg })
hi("Function", { fg = c.blue })
hi("Statement", { fg = c.magenta })
hi("Conditional", { fg = c.magenta })
hi("Repeat", { fg = c.magenta })
hi("Label", { fg = c.cyan })
hi("Operator", { fg = c.accent })
hi("Keyword", { fg = c.magenta })
hi("Exception", { fg = c.red })
hi("PreProc", { fg = c.cyan })
hi("Include", { fg = c.magenta })
hi("Define", { fg = c.magenta })
hi("Macro", { fg = c.cyan })
hi("PreCondit", { fg = c.cyan })
hi("Type", { fg = c.yellow })
hi("StorageClass", { fg = c.magenta })
hi("Structure", { fg = c.yellow })
hi("Typedef", { fg = c.yellow })
hi("Special", { fg = c.cyan })
hi("SpecialChar", { fg = c.cyan })
hi("Tag", { fg = c.accent })
hi("Delimiter", { fg = c.fg })
hi("SpecialComment", { fg = c.comment, bold = true })
hi("Debug", { fg = c.red })
hi("Underlined", { underline = true })
hi("Error", { fg = c.red })
hi("Todo", { fg = c.bg, bg = c.yellow, bold = true })

-- Diff
hi("DiffAdd", { fg = c.green, bg = "#1a2e1a" })
hi("DiffChange", { fg = c.yellow, bg = "#2e2a1a" })
hi("DiffDelete", { fg = c.red, bg = "#2e1a1a" })
hi("DiffText", { fg = c.bg, bg = c.yellow })

-- Git signs
hi("GitSignsAdd", { fg = c.green })
hi("GitSignsChange", { fg = c.yellow })
hi("GitSignsDelete", { fg = c.red })

-- Diagnostics
hi("DiagnosticError", { fg = c.red })
hi("DiagnosticWarn", { fg = c.yellow })
hi("DiagnosticInfo", { fg = c.blue })
hi("DiagnosticHint", { fg = c.cyan })
hi("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = c.yellow })
hi("DiagnosticUnderlineInfo", { undercurl = true, sp = c.blue })
hi("DiagnosticUnderlineHint", { undercurl = true, sp = c.cyan })

-- Treesitter
hi("@variable", { fg = c.fg })
hi("@variable.builtin", { fg = c.red })
hi("@variable.parameter", { fg = c.bright_red })
hi("@constant", { fg = c.bright_yellow })
hi("@constant.builtin", { fg = c.magenta })
hi("@string", { fg = c.green })
hi("@string.escape", { fg = c.cyan })
hi("@character", { fg = c.green })
hi("@number", { fg = c.bright_yellow })
hi("@boolean", { fg = c.magenta })
hi("@function", { fg = c.blue })
hi("@function.builtin", { fg = c.cyan })
hi("@function.macro", { fg = c.cyan })
hi("@method", { fg = c.blue })
hi("@constructor", { fg = c.yellow })
hi("@keyword", { fg = c.magenta })
hi("@keyword.function", { fg = c.magenta })
hi("@keyword.return", { fg = c.magenta })
hi("@keyword.operator", { fg = c.accent })
hi("@operator", { fg = c.accent })
hi("@type", { fg = c.yellow })
hi("@type.builtin", { fg = c.yellow })
hi("@property", { fg = c.cyan })
hi("@field", { fg = c.cyan })
hi("@parameter", { fg = c.bright_red })
hi("@attribute", { fg = c.cyan })
hi("@namespace", { fg = c.yellow })
hi("@include", { fg = c.magenta })
hi("@label", { fg = c.cyan })
hi("@punctuation", { fg = c.fg })
hi("@punctuation.delimiter", { fg = c.fg })
hi("@punctuation.bracket", { fg = c.fg })
hi("@punctuation.special", { fg = c.accent })
hi("@comment", { fg = c.comment, italic = true })
hi("@tag", { fg = c.red })
hi("@tag.attribute", { fg = c.yellow })
hi("@tag.delimiter", { fg = c.fg })
hi("@text", { fg = c.fg })
hi("@text.strong", { bold = true })
hi("@text.emphasis", { italic = true })
hi("@text.underline", { underline = true })
hi("@text.uri", { fg = c.blue, underline = true })

-- LSP
hi("LspReferenceText", { bg = c.visual })
hi("LspReferenceRead", { bg = c.visual })
hi("LspReferenceWrite", { bg = c.visual })

-- Terminal colors
vim.g.terminal_color_0 = c.black
vim.g.terminal_color_1 = c.red
vim.g.terminal_color_2 = c.green
vim.g.terminal_color_3 = c.yellow
vim.g.terminal_color_4 = c.blue
vim.g.terminal_color_5 = c.magenta
vim.g.terminal_color_6 = c.cyan
vim.g.terminal_color_7 = c.white
vim.g.terminal_color_8 = c.bright_black
vim.g.terminal_color_9 = c.bright_red
vim.g.terminal_color_10 = c.bright_green
vim.g.terminal_color_11 = c.bright_yellow
vim.g.terminal_color_12 = c.bright_blue
vim.g.terminal_color_13 = c.bright_magenta
vim.g.terminal_color_14 = c.bright_cyan
vim.g.terminal_color_15 = c.bright_white
