vim.cmd.hi 'clear'

vim.o.termguicolors = true
vim.cmd 'hi Normal guibg=#231830'

-- Comment
vim.api.nvim_set_hl(0, 'Comment', { fg = '#ffaa00', bg = '#231830' })
vim.api.nvim_set_hl(0, '@comment', { link = 'Comment' })
vim.api.nvim_set_hl(0, '@comment.documentation', { link = 'Comment' })
vim.api.nvim_set_hl(0, '@lsp.type.comment', { link = 'Comment' })
vim.api.nvim_set_hl(0, 'TermCursor', { link = 'Comment' })

vim.api.nvim_set_hl(0, '@function', { fg = '#00aaff', bg = '#231830' })
vim.api.nvim_set_hl(0, '@function.call', { fg = '#00aaff', bg = '#231830' })
vim.api.nvim_set_hl(0, '@function.method', { fg = '#00aaff', bg = '#231830' })

vim.api.nvim_set_hl(0, 'Statement', { fg = '#ddeeee', bg = '#231830' })
vim.api.nvim_set_hl(0, '@type', { fg = '#ddeeee', bg = '#231830' })
vim.api.nvim_set_hl(0, '@type.definition', { link = '@type' })
vim.api.nvim_set_hl(0, '@lsp.type.class', { link = '@type' })
vim.api.nvim_set_hl(0, '@constructor', { link = '@type' })
vim.api.nvim_set_hl(0, '@type.builtin', { link = '@type' })
vim.api.nvim_set_hl(0, 'javaAnnotation', { fg = '#ddeeee', bg = '#231830' })
vim.api.nvim_set_hl(0, 'ktAnnotation', { link = 'javaAnnotation' })
vim.api.nvim_set_hl(0, '@property', { fg = '#ddeeee', bg = '#231830' })
vim.api.nvim_set_hl(0, '@punctuation.delimiter', { fg = '#ddeeee', bg = '#231830' })
vim.api.nvim_set_hl(0, '@punctuation.bracket', { fg = '#ddeeee', bg = '#231830' })
vim.api.nvim_set_hl(0, '@punctuation.special', { fg = '#ddeeee', bg = '#231830' })

vim.api.nvim_set_hl(0, 'String', { fg = '#00ffaa', bg = '#231830' })
vim.api.nvim_set_hl(0, '@string', { link = 'String' })

vim.api.nvim_set_hl(0, 'Constant', { fg = '#00FFFF', bg = '#231832' })
