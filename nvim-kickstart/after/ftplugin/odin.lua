vim.cmd 'set makeprg=odin'
vim.cmd 'nnoremap <leader>kr :w<CR> :make run . <CR>'
vim.cmd 'nnoremap <leader>kt :w<CR> :make test . -debug -o:none -out:main<CR>'

vim.keymap.set('n', '<leader>kd', function()
  local dap = require 'dap'
  dap.terminate()
  vim.cmd 'make build . -out:main -debug '
  local configuration = dap.configurations.odin[1]
  configuration.program = function()
    return vim.fn.getcwd() .. '/main'
  end
  dap.continue(configuration)
  local view = require 'dap-view'
  view.open()
end, { desc = '[K]ompile [D]ebug' })
