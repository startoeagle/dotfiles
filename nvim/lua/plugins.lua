vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

use {'wbthomason/packer.nvim', opt = true}
use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
use {'neovim/nvim-lspconfig'}

use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-vsnip'
use 'hrsh7th/vim-vsnip'
use {'honza/vim-snippets'}

use 'tpope/vim-surround'

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
use { 'theHamsta/nvim-dap-virtual-text' }
use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

use 'hkupty/iron.nvim'
use 'metakirby5/codi.vim'

use { 'tpope/vim-fugitive' }

use { 'kabouzeid/nvim-lspinstall' }
use { 'nvim-lua/lsp_extensions.nvim' }

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

use 'DingDean/wgsl.vim'

use 'tikhomirov/vim-glsl'

use { 'kkoomen/vim-doge',
    cmd = {"DogeGenerate", "DogeCreateDocStandard"},
    run = ":call doge#install()",
}

end)
