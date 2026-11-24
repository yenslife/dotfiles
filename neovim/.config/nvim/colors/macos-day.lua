-- macOS Terminal 風格的白天配色，搭配 Ghostty 的 macOS Day。
vim.opt.termguicolors = true
vim.opt.background = 'light'
vim.cmd 'highlight clear'
if vim.fn.exists 'syntax_on' == 1 then
  vim.cmd 'syntax reset'
end
vim.g.colors_name = 'macos-day'

local c = {
  bg = '#faf9f6', fg = '#242426', panel = '#f0efec', line = '#efeeeb',
  muted = '#6c6c72', border = '#c9c8c4', blue = '#005fbd',
  red = '#b42332', green = '#287343', amber = '#8a5900',
  purple = '#8641a4', cyan = '#006d77', selection = '#cfe3ff',
}
local function hi(names, spec)
  for name in names:gmatch '%S+' do
    vim.api.nvim_set_hl(0, name, spec)
  end
end
local function link(names, target)
  hi(names, { link = target })
end

hi('Normal', { fg = c.fg, bg = c.bg })
link('NormalNC EndOfBuffer', 'Normal')
hi('NormalFloat Pmenu', { fg = c.fg, bg = c.panel })
hi('FloatBorder WinSeparator', { fg = c.border, bg = c.bg })
hi('FloatTitle Title', { fg = c.blue, bold = true })
hi('Cursor', { fg = '#ffffff', bg = '#0066cc' })
hi('CursorLine CursorColumn ColorColumn', { bg = c.line })
hi('LineNr SignColumn FoldColumn', { fg = c.muted, bg = c.bg })
hi('CursorLineNr', { fg = c.blue, bg = c.line, bold = true })
hi('NonText Whitespace SpecialKey', { fg = c.border })
hi('Visual PmenuSel', { fg = '#1d304d', bg = c.selection })
hi('Search', { fg = c.fg, bg = '#f3e2ad' })
hi('IncSearch CurSearch', { fg = '#ffffff', bg = c.blue })
hi('MatchParen', { fg = c.blue, bg = c.selection, bold = true })
hi('StatusLine TabLineSel', { fg = c.fg, bg = '#e5e4e0', bold = true })
hi('StatusLineNC TabLine TabLineFill WinBarNC', { fg = c.muted, bg = c.panel })
hi('WinBar', { fg = c.fg, bg = c.bg })
hi('PmenuSbar', { bg = '#e5e4e0' })
hi('PmenuThumb', { bg = c.border })
hi('Folded', { fg = c.muted, bg = c.panel })
hi('Directory Function', { fg = c.blue })
hi('Comment', { fg = c.muted })
hi('String Character', { fg = c.green })
hi('Number Boolean Float Constant', { fg = c.amber })
hi('Statement Keyword Conditional Repeat Exception', { fg = c.purple })
hi('Type StorageClass Structure Typedef', { fg = c.cyan })
hi('Identifier Operator Delimiter', { fg = c.fg })
hi('PreProc Include Define Macro PreCondit Special', { fg = c.blue })
hi('Underlined', { fg = c.blue, underline = true })
hi('Todo', { fg = c.amber, bg = '#f3e2ad', bold = true })
hi('Error ErrorMsg', { fg = c.red })
hi('WarningMsg', { fg = c.amber })
hi('MoreMsg Question', { fg = c.green })
hi('Conceal', { fg = c.muted })
hi('SpellBad', { sp = c.red, undercurl = true })
hi('SpellCap SpellLocal SpellRare', { sp = c.blue, undercurl = true })

link('@variable @variable.parameter @property @punctuation', 'Identifier')
link('@variable.builtin @constant.builtin', 'Special')
link('@function @function.call @function.method @function.method.call', 'Function')
link('@function.builtin @constructor @attribute @tag', 'Special')
link('@keyword @keyword.function @keyword.return', 'Keyword')
link('@string @string.documentation', 'String')
link('@string.escape @string.regexp', 'Special')
link('@type @type.builtin @module', 'Type')
link('@comment @comment.documentation', 'Comment')
link('@number @boolean', 'Constant')
hi('@markup.heading', { fg = c.blue, bold = true })
hi('@markup.strong', { bold = true })
hi('@markup.italic', { italic = true })
hi('@markup.raw', { fg = c.green })
link('@markup.link @markup.link.url', 'Underlined')

for kind, color in pairs { Error = c.red, Warn = c.amber, Info = c.blue, Hint = c.cyan, Ok = c.green } do
  hi('Diagnostic' .. kind .. ' DiagnosticSign' .. kind, { fg = color })
  hi('DiagnosticVirtualText' .. kind, { fg = color, bg = c.panel })
  hi('DiagnosticUnderline' .. kind, { sp = color, undercurl = true })
end
for name, spec in pairs {
  DiffAdd = { fg = c.green, bg = '#e1eddf' },
  DiffChange = { bg = '#e6edf5' },
  DiffText = { bg = c.selection },
  DiffDelete = { fg = c.red, bg = '#f6e3e1' },
} do
  hi(name, spec)
end
hi('Added GitSignsAdd', { fg = c.green })
hi('Changed GitSignsChange', { fg = c.blue })
hi('Removed GitSignsDelete', { fg = c.red })
hi('LspReferenceText LspReferenceRead LspReferenceWrite', { bg = '#e6edf5' })
link('LspSignatureActiveParameter', 'Visual')
link('TelescopeNormal TelescopePromptNormal TelescopeResultsNormal TelescopePreviewNormal', 'NormalFloat')
link('TelescopeBorder TelescopePromptBorder TelescopeResultsBorder TelescopePreviewBorder', 'FloatBorder')
link('TelescopeSelection', 'Visual')
hi('TelescopeMatching', { fg = c.blue, bold = true })
link('TelescopeTitle WhichKey WhichKeyGroup OilDir SnacksPickerDir', 'Title')
link('WhichKeyDesc SnacksPickerNormal', 'NormalFloat')
link('WhichKeyBorder SnacksPickerBorder', 'FloatBorder')
hi('IblIndent', { fg = '#e1e0dc' })
hi('IblScope', { fg = c.border })
link('MiniStatuslineModeNormal', 'PmenuSel')
link('MiniStatuslineModeInsert', 'DiffAdd')
link('MiniStatuslineModeVisual', 'Search')
link('MiniStatuslineInactive MiniStatuslineFilename', 'StatusLineNC')
link('MiniStatuslineDevinfo MiniStatuslineFileinfo', 'StatusLine')

local terminal = {
  '#242426', c.red, c.green, c.amber, c.blue, c.purple, c.cyan, '#59595e',
  c.muted, '#c52d3a', '#207a46', '#956200', '#006bd6', '#9650b1', '#007783', '#747478',
}
for i, color in ipairs(terminal) do
  vim.g['terminal_color_' .. (i - 1)] = color
end
