M = {}

M.jjbuff = nil
M.open = function()
    if M.jjbuff == nil then
        M.jjbuff = vim.api.nvim_create_buf(true, false)
        vim.api.nvim_set_current_buf(M.jjbuff)
        vim.cmd('edit term://jjui')
    else
        local res = pcall(function() vim.api.nvim_set_current_buf(M.jjbuff) end)
        if not res then
            M.jjbuff = vim.api.nvim_create_buf(true, false)
            vim.api.nvim_set_current_buf(M.jjbuff)
            vim.cmd('edit term://jjui')
        end
    end
end

return M
