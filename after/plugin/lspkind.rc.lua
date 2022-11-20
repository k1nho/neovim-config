
local status, lspkind = pcall(require, "lspkind")
if (not status) then return end

lspkind.init({
  -- enables text annotations
  --
  -- default: true
  mode = 'symbol',

  -- default symbol map
  -- can be either 'default' (requires nerd-fonts font) or
  -- 'codicons' for codicon preset (requires vscode-codicons font)
  --
  -- default: 'default'
  preset = 'codicons',

  -- override preset symbols
  --
  -- default: {}
  symbol_map = {
    Text = "",
    Method = " method",
    Function = " function",
    Constructor = " constructor",
    Field = "ﰠ field",
    Variable = " var",
    Class = "ﴯ class",
    Interface = " interface",
    Module = " module",
    Property = "ﰠ prop",
    Unit = "塞unit",
    Value = " value",
    Enum = " enum",
    Keyword = " keyword",
    Snippet = " snip",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = " constant",
    Struct = "פּ struct",
    Event = " event",
    Operator = "",
    TypeParameter = " generic"
  },
})
