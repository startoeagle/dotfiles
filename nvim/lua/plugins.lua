vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

use {'wbthomason/packer.nvim', opt = true}
use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
use {'neovim/nvim-lspconfig'}
use 'hrsh7th/nvim-compe'
use { 'morhetz/gruvbox' }
use 'rakr/vim-one'
use { 'tjdevries/nlua.nvim' }
use {
  'nvim-telescope/telescope.nvim',
  requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
}
-- use { 'puremourning/vimspector' }
use { 'mfussenegger/nvim-dap' }
use { 'mfussenegger/nvim-dap-python' }
-- use { 'hrsh7th/nvim-compe' }
use { 'tpope/vim-fugitive' }

use { 'kabouzeid/nvim-lspinstall' }
use { 'nvim-lua/lsp_extensions.nvim' }

use {'SirVer/ultisnips'}
use {'honza/vim-snippets'}

use {
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}

use { 'theHamsta/nvim-dap-virtual-text' }


end)
