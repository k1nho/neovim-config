vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true                                  -- Enable line numbers

vim.opt.title = true
vim.opt.autoindent = true                             -- Enable auto indent 
vim.opt.smartindent = true                            -- Enable smart indent
vim.opt.hlsearch = true                               -- Highlight matches on search
vim.opt.backup = false                                -- Backup file creation
vim.opt.showcmd = true                                -- Show partial command in the last line of the screen
vim.opt.cmdheight = 1                                 -- Command line spacing
vim.opt.laststatus = 2                                -- Status line for the last window always
vim.opt.expandtab = true                              -- Allow tabs to space conversion
vim.opt.scrolloff = 10                                -- Minimum number of screen lines to keep above and below the cursor
-- vim.opt.shell = 'fish'                                -- Shell to be used for commands
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true                             -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true                               -- Enable smart tab
vim.opt.breakindent = true
vim.opt.shiftwidth = 4                                -- Number of spaces to be inserted for each indent
vim.opt.relativenumber = true                         -- Show line numbers relative to line cursor
vim.opt.tabstop = 4                                   -- Spaces to insert for a tab
vim.opt.wrap = false                                  -- No wrap lines
vim.opt.backspace = { 'start', 'eol', 'indent' }      -- allow backspacing over autoindent, over line breaks and over start insert
vim.opt.path:append { '**' }                          -- Finding files - search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }      -- Ignore node_modules
vim.opt.mouse = 'a'                                   -- Enable mouse (xD)
vim.opt.hlsearch = false                              -- Do not allow terms to be highlighted after search   
vim.opt.incsearch = true                              -- Allow terms to incrementally be highlighted when searching

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }
