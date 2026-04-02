local set = vim.keymap.set

set('n', '<leader>kr', function() vim.cmd 'edit term://uv run python %' end,
    { buf = 0, desc = 'Run current file with uv' })
set('n', '<leader>kt', function() vim.cmd 'edit term://uv run pytest -vv %' end,
    { buf = 0, desc = 'Run current file with pytest via uv' })

set('n', '<leader>kdt', function()
    local bufs = vim.api.nvim_list_bufs()
    local bufs_to_delete = vim.tbl_filter(function(b)
        local name = vim.api.nvim_buf_get_name(b)
        return name:find('pytest') ~= nil
    end, bufs)
    for _, b in ipairs(bufs_to_delete) do
        vim.api.nvim_buf_delete(b, {})
    end
end, { buf = 0, desc = 'Delete ALL buffers that have been created with pytest via uv' })

require('debugmaster').keys.add({
    key = "<CR>",
    action = require('dap-python').test_method,
    desc = "Jump to the current stack frame"
})
