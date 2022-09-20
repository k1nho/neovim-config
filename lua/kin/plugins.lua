local status, packer = pcall(require, "packer")

if (not status) then
  print("Packer needs to be installed!")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'svrana/neosolarized.nvim',
    require = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'hoob3rt/lualine.nvim' -- Status line
  use 'jose-elias-alvarez/null-ls.nvim' -- Using Neovim as LS to inject LSP diagnostics, code actions ...
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim built in LSP client

  use 'L3MON4D3/Luasnip' -- Snippet engine


  use 'onsails/lspkind.nvim' -- pictograms like the ones in vscode
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words (when typing a variable)
  use 'hrsh7th/cmp-nvim-lsp' --nvim-cmp source for nvim built in LSP's
  use 'hrsh7th/nvim-cmp' -- Auto complete

  use 'neovim/nvim-lspconfig' -- LSP (language server protocol)
  use 'glepnir/lspsaga.nvim' -- UI's for LSP
  use 'williamboman/mason.nvim' -- Get Other LSP's
  use 'williamboman/mason-lspconfig.nvim' -- Get Other LSP's

  use 'windwp/nvim-autopairs' -- auto closing brackets/parenthesis for opening ones 
  use 'windwp/nvim-ts-autotag' -- auto html tags for opening tags 

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  } -- Treesiter syntax highlight

  use 'nvim-telescope/telescope.nvim' -- File explorer in nvim
  use 'nvim-telescope/telescope-file-browser.nvim' -- File browser in nvim
  use 'nvim-lua/plenary.nvim' -- Common Utils
  use 'akinsho/nvim-bufferline.lua' -- Customized bufferline (te)

  -- GIT
  use 'dinhhuy258/git.nvim' -- Git blame and browse
  use 'lewis6991/gitsigns.nvim'
end)
