vim.cmd 'colorscheme gruvbox'

vim.o.timeoutlen = 300
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'number'
vim.wo.numberwidth = 2

-- Set the number of spaces per tab (replace with the desired value)
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true -- Use spaces instead of tabs

-- Enable auto-indentation
vim.o.smartindent = true
vim.o.autoindent = true

-- Display tabs and trailing spaces
vim.o.list = true
vim.o.listchars = 'tab:»·,trail:·'

-- Highlight current line and column
vim.o.cursorline = true
vim.o.colorcolumn = '120' -- Highlight column 80, adjust as needed

-- Map key to open Neovim configuration file
vim.api.nvim_set_keymap('n', '<leader>cr', ':e $HOME/.config/nvim/init.lua<cr>', { noremap = true, silent = true })
-- Map key to change current working directory
vim.api.nvim_set_keymap('n', '<leader>cd', ':lcd %:p:h<cr>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })


