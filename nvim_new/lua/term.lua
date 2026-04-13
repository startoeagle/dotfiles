M = {}

local function create_and_insert_buf(cmd)
    local buf = vim.api.nvim_create_buf(true, false)
    vim.api.nvim_set_current_buf(buf)
    vim.cmd(cmd)
    return buf
end

M.bufs = {}

function M.create_term_buf(cmd)
    return function()
        if M.bufs[cmd] == nil then
            M.bufs[cmd] = create_and_insert_buf(cmd)
        else
            local res = pcall(function() vim.api.nvim_set_current_buf(M.bufs[cmd]) end)
            if not res then
                M.bufs[cmd] = create_and_insert_buf(cmd)
            end
        end
        vim.cmd 'startinsert'
    end
end

M.fish = M.create_term_buf('edit term://fish')
M.jjui = M.create_term_buf('edit term://jjui')

return M
