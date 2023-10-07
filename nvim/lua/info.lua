require('nvim-web-devicons').setup()
require('lualine').setup{
  options = {
    theme = 'gruvbox',  -- Choose a theme
    icons_enabled = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {
      {'filename', file_status = true, path = 1},
      'diff',
      {'diagnostics', sources = {'nvim_lsp'}},
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'},
  },
  extensions = {'nvim-tree', 'fugitive'},
}

