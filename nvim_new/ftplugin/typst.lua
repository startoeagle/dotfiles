local set = vim.keymap.set

set('i', '$$', '$$<esc>i')
set('i', '$ ', '$  $<esc><left>i')

vim.opt.spell=true
vim.opt.spelllang="en_us"
