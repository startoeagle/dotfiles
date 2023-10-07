-- Load Telescope and additional extensions
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
    },
    frecency = {
      show_scores = false,
      show_unindexed = true,
      ignore_patterns = {'*.git/*'},
    },
  },
  defaults = {
    prompt_prefix = "> ",
    selection_caret = "> ",
    mappings = {
      i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
      },
    },
  },
}

-- Load additional Telescope extensions
-- require('telescope').load_extension('fzf')
-- require('telescope').load_extension('frecency')

-- Map keys for searching buffers and Git files
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>Telescope buffers<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>Telescope git_files<cr>', { noremap = true, silent = true })
