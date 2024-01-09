vim.cmd 'colorscheme gruvbox'

vim.o.timeoutlen = 300
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = "yes"
vim.wo.numberwidth = 4

local function indent(i)
    vim.o.tabstop = i
    vim.o.softtabstop = i
    vim.o.shiftwidth = i
end

indent(4)

for _, ft in ipairs({ "haskell" }) do
    if vim.bo.filetype == ft then
        print("setting indent for filetype" + ft + "to 2")
        -- TODO: Not working
        indent(2)
    end
end

vim.o.expandtab = true -- Use spaces instead of tabs

-- Enable auto-indentation
vim.o.smartindent = true
vim.o.autoindent = true

-- Display tabs and trailing spaces
vim.o.list = true
vim.o.listchars = 'tab:»·,trail:·'

vim.o.cursorline = true -- Highlight current line and column
vim.o.colorcolumn = '120'

-- Map key to open Neovim configuration file
vim.api.nvim_set_keymap('n', '<leader>cr', ':e $HOME/.config/nvim/init.lua<cr>', { noremap = true, silent = true })
-- Map key to change current working directory
vim.api.nvim_set_keymap('n', '<leader>cd', ':lcd %:p:h<cr>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })

-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({
    -- add any options here, or leave empty to use the default settings
})

-- then setup your lsp server as usual
local lspconfig = require('lspconfig')

-- example to setup lua_ls and enable call snippets
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            completion = {
                callSnippet = "Replace"
            }
        }
    }
})
