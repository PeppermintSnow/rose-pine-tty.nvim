---@class rosepine_tty
--- Rosé Pine TTY colorscheme (cterm-only)
--- Usage:
---   Load with: require("rose-pine-tty").setup()

local M = {}

-- ANSI color index mapping (must match your fbtermrc)
local colors = {
  base = 0,
  love = 1,
  pine = 2,
  gold = 3,
  foam = 4,
  iris = 5,
  rose = 6,
  text = 7,
  muted = 8,
  bright_love = 9,
}

M.setup = function()
  vim.opt.termguicolors = false

  local function hi(group, opts)
    local parts = { group }
    if opts.ctermfg then table.insert(parts, "ctermfg=" .. opts.ctermfg) end
    if opts.ctermbg then table.insert(parts, "ctermbg=" .. opts.ctermbg) end
    if opts.cterm then table.insert(parts, "cterm=" .. opts.cterm) end
    vim.cmd("highlight " .. table.concat(parts, " "))
  end

  -----------------------------------------------------------------------------
  -- Core Highlights
  -----------------------------------------------------------------------------
  hi("Normal",       { ctermfg = colors.text,  ctermbg = colors.base })
  hi("Comment",      { ctermfg = colors.muted, cterm = "italic" })
  hi("Constant",     { ctermfg = colors.foam,  cterm = "bold" })
  hi("String",       { ctermfg = colors.gold })
  hi("Character",    { ctermfg = colors.gold })
  hi("Identifier",   { ctermfg = colors.rose })
  hi("Function",     { ctermfg = colors.iris,  cterm = "bold" })
  hi("Statement",    { ctermfg = colors.iris,  cterm = "bold" })
  hi("Keyword",      { ctermfg = colors.iris,  cterm = "bold" })
  hi("Conditional",  { ctermfg = colors.iris })
  hi("Repeat",       { ctermfg = colors.iris })
  hi("Label",        { ctermfg = colors.iris })
  hi("Operator",     { ctermfg = colors.rose })
  hi("PreProc",      { ctermfg = colors.gold })
  hi("Include",      { ctermfg = colors.gold })
  hi("Define",       { ctermfg = colors.gold })
  hi("Macro",        { ctermfg = colors.gold })
  hi("Type",         { ctermfg = colors.pine,  cterm = "bold" })
  hi("StorageClass", { ctermfg = colors.pine })
  hi("Structure",    { ctermfg = colors.pine })
  hi("Typedef",      { ctermfg = colors.pine })
  hi("Special",      { ctermfg = colors.love })
  hi("SpecialComment", { ctermfg = colors.muted, cterm = "italic" })
  hi("Error",        { ctermfg = colors.love, ctermbg = colors.base, cterm = "bold" })
  hi("Todo",         { ctermfg = colors.gold, ctermbg = colors.base, cterm = "bold" })

  -----------------------------------------------------------------------------
  -- UI Elements
  -----------------------------------------------------------------------------
  hi("LineNr",       { ctermfg = colors.muted })
  hi("CursorLine",   { ctermbg = colors.base })
  hi("CursorLineNr", { ctermfg = colors.gold, cterm = "bold" })
  hi("StatusLine",   { ctermfg = colors.text, ctermbg = colors.pine, cterm = "bold" })
  hi("StatusLineNC", { ctermfg = colors.muted, ctermbg = colors.base })
  hi("VertSplit",    { ctermfg = colors.muted, ctermbg = colors.base })
  hi("Visual",       { ctermfg = colors.base, ctermbg = colors.iris })
  hi("Search",       { ctermfg = colors.base, ctermbg = colors.gold, cterm = "bold" })
  hi("IncSearch",    { ctermfg = colors.base, ctermbg = colors.love, cterm = "bold" })
  hi("MatchParen",   { ctermfg = colors.gold, ctermbg = colors.base, cterm = "bold" })
  hi("Pmenu",        { ctermfg = colors.text, ctermbg = colors.muted })
  hi("PmenuSel",     { ctermfg = colors.base, ctermbg = colors.iris, cterm = "bold" })
  hi("PmenuSbar",    { ctermbg = colors.muted })
  hi("PmenuThumb",   { ctermbg = colors.rose })

  -----------------------------------------------------------------------------
  -- Diff / VCS
  -----------------------------------------------------------------------------
  hi("DiffAdd",      { ctermbg = colors.pine })
  hi("DiffChange",   { ctermbg = colors.gold })
  hi("DiffDelete",   { ctermbg = colors.love })
  hi("DiffText",     { ctermbg = colors.iris })

  hi("GitSignsAdd",    { ctermfg = colors.pine })
  hi("GitSignsChange", { ctermfg = colors.gold })
  hi("GitSignsDelete", { ctermfg = colors.love })

  -----------------------------------------------------------------------------
  -- Diagnostics
  -----------------------------------------------------------------------------
  hi("DiagnosticError", { ctermfg = colors.love, cterm = "bold" })
  hi("DiagnosticWarn",  { ctermfg = colors.gold, cterm = "bold" })
  hi("DiagnosticInfo",  { ctermfg = colors.foam })
  hi("DiagnosticHint",  { ctermfg = colors.rose })

  -----------------------------------------------------------------------------
  -- Treesitter
  -----------------------------------------------------------------------------
  hi("TSFunction",   { ctermfg = colors.iris, cterm = "bold" })
  hi("TSKeyword",    { ctermfg = colors.iris, cterm = "bold" })
  hi("TSString",     { ctermfg = colors.gold })
  hi("TSComment",    { ctermfg = colors.muted, cterm = "italic" })
  hi("TSConstant",   { ctermfg = colors.foam })
  hi("TSNumber",     { ctermfg = colors.gold })
  hi("TSBoolean",    { ctermfg = colors.gold })
  hi("TSFloat",      { ctermfg = colors.gold })
  hi("TSCharacter",  { ctermfg = colors.gold })
  hi("TSType",       { ctermfg = colors.pine, cterm = "bold" })
  hi("TSTypeBuiltin",{ ctermfg = colors.pine })
  hi("TSVariable",   { ctermfg = colors.text })
  hi("TSVariableBuiltin", { ctermfg = colors.rose })
  hi("TSProperty",   { ctermfg = colors.foam })
  hi("TSField",      { ctermfg = colors.foam })
  hi("TSParameter",  { ctermfg = colors.rose })
  hi("TSAttribute",  { ctermfg = colors.foam })
  hi("TSNamespace",  { ctermfg = colors.foam })
  hi("TSOperator",   { ctermfg = colors.rose })
  hi("TSPunctDelimiter", { ctermfg = colors.text })
  hi("TSPunctBracket",   { ctermfg = colors.text })
  hi("TSPunctSpecial",   { ctermfg = colors.text })
  hi("TSKeywordFunction", { ctermfg = colors.iris, cterm = "bold" })
  hi("TSKeywordReturn", { ctermfg = colors.iris, cterm = "bold" })
  hi("TSError",      { ctermfg = colors.love })

  -----------------------------------------------------------------------------
  -- Telescope
  -----------------------------------------------------------------------------
  hi("TelescopeNormal",   { ctermfg = colors.text, ctermbg = colors.base })
  hi("TelescopeBorder",   { ctermfg = colors.muted, ctermbg = colors.base })
  hi("TelescopePromptNormal", { ctermfg = colors.text, ctermbg = colors.base })
  hi("TelescopePromptBorder", { ctermfg = colors.muted, ctermbg = colors.base })
  hi("TelescopeSelection",{ ctermfg = colors.text, ctermbg = colors.iris, cterm = "bold" })
  hi("TelescopeMatching", { ctermfg = colors.gold, cterm = "bold" })

  -----------------------------------------------------------------------------
  -- Lualine (basic cterm adaptation)
  -----------------------------------------------------------------------------
  hi("lualine_a_normal", { ctermfg = colors.base, ctermbg = colors.iris, cterm = "bold" })
  hi("lualine_b_normal", { ctermfg = colors.text, ctermbg = colors.muted })
  hi("lualine_c_normal", { ctermfg = colors.text, ctermbg = colors.base })

  hi("lualine_a_insert", { ctermfg = colors.base, ctermbg = colors.pine, cterm = "bold" })
  hi("lualine_b_insert", { ctermfg = colors.text, ctermbg = colors.muted })
  hi("lualine_c_insert", { ctermfg = colors.text, ctermbg = colors.base })

  hi("lualine_a_visual", { ctermfg = colors.base, ctermbg = colors.gold, cterm = "bold" })
  hi("lualine_b_visual", { ctermfg = colors.text, ctermbg = colors.muted })
  hi("lualine_c_visual", { ctermfg = colors.text, ctermbg = colors.base })

  hi("lualine_a_replace", { ctermfg = colors.base, ctermbg = colors.love, cterm = "bold" })
  hi("lualine_b_replace", { ctermfg = colors.text, ctermbg = colors.muted })
  hi("lualine_c_replace", { ctermfg = colors.text, ctermbg = colors.base })

  hi("lualine_a_command", { ctermfg = colors.base, ctermbg = colors.rose, cterm = "bold" })
  hi("lualine_b_command", { ctermfg = colors.text, ctermbg = colors.muted })
  hi("lualine_c_command", { ctermfg = colors.text, ctermbg = colors.base })

  -----------------------------------------------------------------------------
  -- Misc
  -----------------------------------------------------------------------------
  hi("Directory", { ctermfg = colors.foam })
  hi("Title",     { ctermfg = colors.gold, cterm = "bold" })
  hi("Underlined",{ ctermfg = colors.iris, cterm = "underline" })
end

vim.cmd("let g:colors_name =  'rose-pine-tty'")

return M
