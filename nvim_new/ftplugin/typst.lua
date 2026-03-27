local set = vim.keymap.set

set('i', '$$', '$$<esc>i')
set('i', '$ ', '$  $<esc><left>i')

vim.opt_local.spell=true
vim.opt_local.spelllang="en_us"
