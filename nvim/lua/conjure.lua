-- Conjure configuration for REPL integration
vim.cmd [[
  augroup ConjureSetup
    autocmd!
    autocmd FileType clojure,racket,lisp,scheme nnoremap <buffer> <leader>ee <Cmd>ConjureEval<CR>
    autocmd FileType clojure,racket,lisp,scheme xnoremap <buffer> <leader>ee <Cmd>ConjureSendSelection<CR>
  augroup END
]]
