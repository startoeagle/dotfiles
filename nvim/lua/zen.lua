-- Load zen-mode
require("zen-mode").setup {
  window = {
    backdrop = 1, -- enable backdrop (0 disables it)
    height = 1.0, -- height of the Zen window
    width = 0.75, -- width of the Zen window
  },
}

-- Map key for toggling Zen mode
vim.api.nvim_set_keymap('n', '<leader>z', '<cmd>ZenMode<cr>', { noremap = true, silent = true })
