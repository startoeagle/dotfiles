vim.lsp.config['luals'] = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.luarc.jsonc' },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                library = vim.api.nvim_get_runtime_file('', true),
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    vim.api.nvim_get_runtime_file('', true),
                },
            },
        }
    }
}
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method('textDocument/implementation') then
        end

        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end

        if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting') then
            vim.keymap.set('n', 'grf', vim.lsp.buf.format)
            vim.keymap.set('v', 'grf', vim.lsp.buf.format)
        end
        vim.keymap.set('n', '<leader>h', vim.diagnostic.open_float)
    end,
})

vim.lsp.enable('luals')
vim.lsp.enable('pyright')
vim.lsp.enable('pyrefly')
vim.lsp.enable('gleam')
vim.lsp.enable('kotlin_language_server')
