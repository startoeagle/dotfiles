require('plugins')
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd') 
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local indent = 4
cmd 'colorscheme one'                             -- Put your favorite colorscheme here
cmd 'set background=dark'
opt('b', 'expandtab', true)                           -- Use spaces instead of tabs
opt('b', 'shiftwidth', indent)                        -- Size of an indent
opt('b', 'smartindent', true)                         -- Insert indents automatically
opt('b', 'tabstop', indent)                           -- Number of spaces tabs count for
opt('o', 'completeopt', 'menuone')           -- Completion options (for compe)
opt('o', 'hidden', true)                              -- Enable modified buffers in background
opt('o', 'ignorecase', true)                          -- Ignore case
opt('o', 'joinspaces', false)                         -- No double spaces with join after a dot
opt('o', 'scrolloff', 4 )                             -- Lines of context
opt('o', 'shiftround', true)                          -- Round indent
opt('o', 'sidescrolloff', 8 )                         -- Columns of context
opt('o', 'smartcase', true)                           -- Don't ignore case with capitals
opt('o', 'termguicolors', true)                       -- True color support
    -- opt('o', 'wildmode', 'list:longest')                  -- Command-line completion mode
opt('w', 'list', true)                                -- Show some invisible characters (tabs...)
opt('w', 'number', true)                              -- Print line number
opt('w', 'relativenumber', true)                      -- Relative line numbers
vim.g.dap_virtual_text = true

local on_attach = function(hej, da) 
    map('n', '<space>,', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
    map('n', '<space>;', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
    map('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    map('n', '<space>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
    map('n', '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>')
    map('n', '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>')
    map('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>')
    map('n', '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')

    print('in on_attach function')
end
local lsp = require 'lspconfig'

-- root_dir is where the LSP server will start: here at the project root otherwise in current folder

lsp.cmake.setup {on_attach = on_attach}
lsp.tsserver.setup {on_attach = on_attach}
lsp.rust_analyzer.setup { on_attach = on_attach, root_dir =lsp.util.root_pattern('.git', 'Cargo.toml', fn.getcwd())}
lsp.pylsp.setup {root_dir = lsp.util.root_pattern('env', '.git', fn.getcwd()), on_attach = on_attach}
lsp.ccls.setup {
    on_attach=on_attach,
    filetypes = {  'cuda' },
}
lsp.clangd.setup {
    root_dir = lsp.util.root_pattern('.git', fn.getcwd(), '.clangd'), on_attach = on_attach,
}
local sumneko_lua = '/home/anton/.local/share/nvim/lspinstall/lua/sumneko-lua/extension/server/bin/Linux/lua-language-server'
lsp.sumneko_lua.setup{
    cmd = {sumneko_lua},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true,
                [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
            }
        }
    }
}

map('n', '<space>rc', '<cmd>e ~/.config/nvim/init.lua<cr>')
map('n', '<space>cd', '<cmd>cd %:h<cr>')

require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
map('n', '<space>dc', ':lua require[[dap]].continue()<cr>')
map('n', '<space>db', ':lua require[[dap]].toggle_breakpoint()<cr>')
map('n', '<space>ds', ':lua require[[dap]].step_over()<cr>')
map('n', '<space>di', ':lua require[[dap]].step_into()<cr>')
map('n', '<space>dr', ':lua require[[dap]].repl.open()<cr>')
map('n', '<space>z', ':ZenMode<CR>', {silent = true})

map('i', '<C-Space>', 'compe#complete()', {silent = true, expr = true})
require('completion')
require('treesitter-config')
require('telescope-config')
