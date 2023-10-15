-- Ensure Packer is initialized
vim.cmd [[
  packadd packer.nvim
  autocmd BufWritePost init.lua PackerCompile
]]

-- Use the leader key for key mappings
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

require('plugin') -- Packer.nvim setup
require('basic')
require('lsp_signature').setup()
require('zen')
require('find')
require('lsp')
require('comp')
require('tree-sitter')
require('which-key').setup {}
require('info')
