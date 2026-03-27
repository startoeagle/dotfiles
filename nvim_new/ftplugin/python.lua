local set = vim.keymap.set

set('n', '<leader>kr', function() vim.cmd 'edit term://uv run python %' end, { desc = 'Run current file with uv' })



require('debugmaster').keys.add({
    key = "<CR>",
    action = require('dap-python').test_method,
    desc = "Jump to the current stack frame"
})
