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
