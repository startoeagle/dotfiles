M = {}

local function create_and_insert_buf(cmd)
    local buf = vim.api.nvim_create_buf(true, false)
    vim.api.nvim_set_current_buf(buf)
    vim.cmd(cmd)
    return buf
end

local function split()
    local linenr = '\' ' .. tostring(vim.fn.getcurpos()[2]) .. ': \''
    local revset = vim.fn.system('jj file annotate ' .. vim.fn.expand('%') .. ' | grep ' .. linenr .. ' | awk \'{print $1}\'')
    vim.cmd('split')
    local cmd = 'jj show --no-pager ' .. revset
    vim.cmd('edit term://' .. cmd)
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
M.jj_annotate_line = function() split() end

return M
