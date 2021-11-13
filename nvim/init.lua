require('plugins')
require('common')
local indent = 4
cmd 'set termguicolors'
cmd 'colorscheme one'                             -- Put your favorite colorscheme here
cmd 'set background=dark'
cmd 'set colorcolumn=81'
opt('b', 'expandtab', true)                           -- Use spaces instead of tabs
opt('b', 'shiftwidth', indent)                        -- Size of an indent
opt('b', 'smartindent', true)                         -- Insert indents automatically
opt('b', 'tabstop', indent)                           -- Number of spaces tabs count for
opt('o', 'completeopt', 'menu', 'menuone', 'noselect')           -- Completion options (for compe)
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

    print('LSP activated!')
end
local lsp = require 'lspconfig'

-- root_dir is where the LSP server will start: here at the project root otherwise in current folder

lsp.cmake.setup {on_attach = on_attach}
lsp.tsserver.setup {on_attach = on_attach}
lsp.rust_analyzer.setup { on_attach = on_attach, root_dir =lsp.util.root_pattern('.git', 'Cargo.toml', fn.getcwd())}
lsp.pylsp.setup {root_dir = lsp.util.root_pattern('env', '.git', fn.getcwd()), on_attach = on_attach}
lsp.ccls.setup {
    on_attach=on_attach,
    filetypes = { 'cuda' },
}
lsp.clangd.setup {
    root_dir = lsp.util.root_pattern('.git', fn.getcwd(), '.clangd'), on_attach = on_attach,
    filetypes = { 'c', 'cpp' },
}

lsp.clojure_lsp.setup {
    on_attach=on_attach,
    root_dir = lsp.util.root_pattern('.git', fn.getcwd()),
}

-- An example of configuring for `sumneko_lua`,
--  a language server for Lua.

-- set the path to the sumneko installation
local system_name = "Linux" -- (Linux, macOS, or Windows)
local sumneko_root_path = '$HOME'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

require('lspconfig').sumneko_lua.setup({
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    -- An example of settings for an LSP server.
    --    For more options, see nvim-lspconfig
    settings = {
    Lua = {
        runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
        },
        diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
        },
        workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
        },
    }
    },

    on_attach = on_attach,
})

map('n', '<space>rc', '<cmd>e $MYVIMRC<CR>')
map('n', '<space>cd', '<cmd>cd %:h<cr>')
map('n', '<space><space>', '<cmd>noh<cr>')
-- map('t', '<Esc>', '<C-\\><C-n>')
cmd 'tnoremap <Esc> <C-\\><c-n>'
cmd 'inoremap jk <Esc>'

local iron = require('iron')

iron.core.add_repl_definitions {
 -- python = {
 --   mycustom = {
 --     command = {"mycmd"}
 --   }
 -- },
  clojure = {
    lein_connect = {
      command = {"lein", "repl", ":connect"}
    }
  }
}

iron.core.set_config {
  preferred = {
    python = "ipython",
    clojure = "lein"
  }
}

require('completion')
require('treesitter-config')
require('telescope-config')
require('debug-config')
