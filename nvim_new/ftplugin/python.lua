local set = vim.keymap.set

set('n', '<leader>kr', function() vim.cmd 'edit term://uv run python %' end, {desc = 'Run current file with uv'})

