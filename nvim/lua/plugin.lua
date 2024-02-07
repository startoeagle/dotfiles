require('packer').startup(function()
    -- Packer manages itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use 'neovim/nvim-lspconfig'

    use "mfussenegger/nvim-dap"

    use {
        "NeogitOrg/neogit",
        requires = {
            "nvim-lua/plenary.nvim",  -- required
            "sindrets/diffview.nvim", -- optional - Diff integration

            -- Only one of these is needed, not both.
            "nvim-telescope/telescope.nvim", -- optional
            "ibhagwan/fzf-lua",              -- optional
        },
        -- config = true
    }

    use {
        "nvim-neotest/neotest",
        "nvim-neotest/neotest-python",
        requires = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter"
        }
    }

    use 'folke/neodev.nvim'

    use 'lewis6991/gitsigns.nvim'

    use { 'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline'
        }
    }
    -- Treesitter for better syntax highlighting
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- REPL integration (Conjure)
    use 'Olical/conjure'
    use { 'eraserhd/parinfer-rust', run = '! cargo build --release' }

    use 'mg979/vim-visual-multi'

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
                triggers_nowait = {
                    -- marks
                    " ",
                    "`",
                    "'",
                    "g`",
                    "g'",
                    -- registers
                    '"',
                    "<c-r>",
                    -- spelling
                    "z=",
                },
                triggers_blacklist = {
                    -- list of mode / prefixes that should never be hooked by WhichKey
                    -- this is mostly relevant for keymaps that start with a native binding
                    i = { "j", "k" },
                    v = { "j", "k" },
                },
            }
        end
    }

    use 'ray-x/lsp_signature.nvim'
    use 'folke/zen-mode.nvim'
    use 'tpope/vim-surround'
    use 'morhetz/gruvbox'
    use 'wlangstroth/vim-racket'

    use 'kyazdani42/nvim-web-devicons'
    use 'hoob3rt/lualine.nvim'
end)
