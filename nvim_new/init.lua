vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.winborder = 'rounded'
vim.opt.completeopt = 'menu,fuzzy,noinsert'

vim.cmd.colorscheme('default')

vim.g.mapleader = ' '
vim.g.localleader = ' '

require('lsp')
require('plugins')
require('dbg').setup()
