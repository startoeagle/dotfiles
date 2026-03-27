M = {}

M.b = vim.api.nvim_create_buf(true, false)
local b = M.b
vim.api.nvim_open_term(b, {})
vim.api.nvim_open_win(b, true, { relative = 'win', row = 1, col = 1, width = 100, height = 100 })

vim.cmd ('edit term//' .. vim.fn.getcwd() .. '/' .. b '/' .. 'typst watch' )

return M
