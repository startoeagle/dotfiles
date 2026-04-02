M = {}

M.jjbuff = nil
M.open = function()
    if M.jjbuff == nil then
        M.jjbuff = vim.api.nvim_create_buf(true, false)
        vim.api.nvim_set_current_buf(M.jjbuff)
        vim.cmd('edit term://jjui')
    else
        vim.api.nvim_set_current_buf(M.jjbuff)
    end
end

return M
