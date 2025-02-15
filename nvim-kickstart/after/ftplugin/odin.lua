vim.cmd("set makeprg=odin")
vim.cmd("nnoremap <c-k> :w<CR> :make run % -file<CR>")
