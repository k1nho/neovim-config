--vim.lsp.set_log_level("debug")

local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<space>vca', '<cmd>lua vim.lsp.buf.code_action()<CR>' , opts)
end

protocol.CompletionItemKind = {
  '', -- Text
  ' method', -- Method
  ' function', -- Function
  ' constructor', -- Constructor
  ' field', -- Field
  ' variable', -- Variable
  ' class', -- Class
  'ﰮ interface', -- Interface
  ' module', -- Module
  ' property', -- Property
  ' unit', -- Unit
  ' value', -- Value
  ' enum', -- Enum
  ' keyword', -- Keyword
  '﬌ snippet', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  ' constant', -- Constant
  ' struct', -- Struct
  ' event', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

-- STATIC TYPE CHECKER FOR JS
nvim_lsp.flow.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- TS CONFIG
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript"},
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities
}

-- SWIFT, C-BASED LANGS
nvim_lsp.sourcekit.setup {
    on_attach = on_attach,
}

-- LUA CONFIG
nvim_lsp.lua_ls.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
    },
  },
}

-- EMMET CONFIG
nvim_lsp.emmet_ls.setup{
    filetypes = {'vue', 'tsx', 'typescriptreact'}
}
--HTML CONFIG
nvim_lsp.html.setup{}

-- TAILWIND CONFIG
nvim_lsp.tailwindcss.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- PRISMA CONFIG
nvim_lsp.prismals.setup{}

-- C++ CONFIG
nvim_lsp.clangd.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"c", "cpp"}
}

-- GO CONFIG
nvim_lsp.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- RUST CONFIG
nvim_lsp.rust_analyzer.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

-- PYTHON CONFIG
nvim_lsp.pylsp.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags ={
        debounce_text_changes = 150,
    },
    settings = {
        pylsp = {
            plugins = {
                pyflakes = {enabled = false},
                pycodestyle = {enabled = true, ignore = "E501,E261, W391"},
                pylint = {enabled = false}
            },
        },
    },
}

-- C# CONFIG
nvim_lsp.csharp_ls.setup{
    on_attach=on_attach,
    capabilities = capabilities,
    filetypes={"cs"},
}

-- ASTRO CONFIG
nvim_lsp.astro.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"astro-ls", "--stdio"},
  filetypes ={ "astro"},
  init_options =  {
    configuration = {},
    typescript = {
      serverPath = ""
    }
  }
}

--SQL LS
nvim_lsp.sqlls.setup{}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "●" },
  severity_sort = true,
}
)

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})
