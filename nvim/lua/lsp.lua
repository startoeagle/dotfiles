-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup {}

-- LSP Configuration
local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            completion = {
                callSnippet = "Replace"
            }
        }
    }
}

-- Configure LSP servers
lspconfig.racket_langserver.setup {}
lspconfig.rust_analyzer.setup {}
lspconfig.fsautocomplete.setup {}
lspconfig.pyright.setup {}
lspconfig.ruff_lsp.setup {}
lspconfig.lua_ls.setup {}
lspconfig.kotlin_language_server.setup {}
lspconfig.hls.setup {
    filetypes = { 'haskell', 'lhaskell', 'cabal' },
}

-- lspconfig.black.setup{}
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local nmap = function(keys, func, desc)
            if desc then
                desc = 'LSP: ' .. desc
            end
            local opts = { buffer = ev.buf, desc = desc }
            vim.keymap.set('n', keys, func, opts)
        end

        nmap('<leader>ic', vim.lsp.buf.incoming_calls, "incoming calls")
        nmap('<leader>oc', vim.lsp.buf.outgoing_calls, "incoming calls")
        nmap('gD', vim.lsp.buf.declaration, "goto declaration")
        nmap('gd', vim.lsp.buf.definition, "goto definition")
        nmap('K', vim.lsp.buf.hover, "hover")
        nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        nmap('<leader>li', vim.lsp.buf.implementation, "list all implementations")
        nmap('<C-k>', vim.lsp.buf.signature_help, "signature help")
        nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, "add workspace folder")
        nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, "remove workspace folder")
        nmap('<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, "list workspace folders")
        nmap('<leader>ld', vim.lsp.buf.type_definition, "type definition")
        nmap('<leader>rn', vim.lsp.buf.rename, "rename")
        vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, { buffer = ev.buf, desc = "code action" })
        nmap('<leader>lf', function()
            vim.lsp.buf.format { async = true }
        end, "format")
    end,
})
