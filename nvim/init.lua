-- Ensure Packer is initialized
vim.cmd [[
  packadd packer.nvim
  autocmd BufWritePost init.lua PackerCompile
]]

-- Use the leader key for key mappings
vim.g.mapleader = ' '

-- Packer.nvim setup
require('packer').startup(function()
  -- Packer manages itself
  use 'wbthomason/packer.nvim'

  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.3',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}
  -- LSP
  use 'neovim/nvim-lspconfig'

  -- Treesitter for better syntax highlighting
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- REPL integration (Conjure)
  use 'Olical/conjure'

  use {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      triggers_nowait = {
          -- marks
          " ",
          "`",
          "'",
          "g`",
          "g'",
          -- registers
          '"',
          "<c-r>",
          -- spelling
          "z=",
      },
      triggers_blacklist = {
          -- list of mode / prefixes that should never be hooked by WhichKey
          -- this is mostly relevant for keymaps that start with a native binding
          i = { "j", "k" },
          v = { "j", "k" },
      },
    }
  end
}
  use 'tpope/vim-surround'
  use 'morhetz/gruvbox'
  use 'wlangstroth/vim-racket'

  use 'kyazdani42/nvim-web-devicons'
  use 'hoob3rt/lualine.nvim'

end)

vim.cmd 'colorscheme gruvbox'

vim.o.timeoutlen = 300
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'number'
vim.wo.numberwidth = 2

require('basic')
require('find')
require('lsp')
require('tree-sitter')
require('conjure')
require('which-key').setup {}
require('info')
