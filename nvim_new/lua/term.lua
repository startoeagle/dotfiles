M = {}

local function create_and_insert_buf(cmd)
    local buf = vim.api.nvim_create_buf(true, false)
    vim.api.nvim_set_current_buf(buf)
    vim.cmd(cmd)
    return buf
end

function M.create_term_buf(buf, cmd)
    return function()
        if buf == nil then
            buf = create_and_insert_buf(cmd)
        else
            local res = pcall(function() vim.api.nvim_set_current_buf(buf) end)
            if not res then
                buf = create_and_insert_buf(cmd)
            end
        end
        vim.cmd 'startinsert'
    end
end

M.fish_buf = nil
M.fish = M.create_term_buf(M.fish_buf, 'edit term://fish')

M.jj_buf = nil
M.jjui = M.create_term_buf(M.jj_buf, 'edit term://jjui')

return M
