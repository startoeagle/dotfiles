-- Ensure Packer is initialized
vim.cmd [[
  packadd packer.nvim
  autocmd BufWritePost init.lua PackerCompile
]]

-- Use the leader key for key mappings
vim.g.mapleader = ' '

require('plugin') -- Packer.nvim setup
require('basic')
require('lsp_signature').setup()
require('zen')
require('find')
require('lsp')
require('tree-sitter')
require('which-key').setup {}
require('info')
