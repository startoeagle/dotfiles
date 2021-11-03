local dap_python = require('dap-python')

require("nvim-dap-virtual-text").setup()

dap_python.setup('~/.virtualenvs/debugpy/bin/python')
dap_python.test_runner = 'pytest'

map('n', '<space>dc', ':lua require[[dap]].continue()<cr>')
map('n', '<space>db', ':lua require[[dap]].toggle_breakpoint()<cr>')
map('n', '<space>ds', ':lua require[[dap]].step_over()<cr>')
map('n', '<space>di', ':lua require[[dap]].step_into()<cr>')
map('n', '<space>dt', ':lua require[[dap]].terminate()<cr>')
map('n', '<space>dr', ':lua require[[dap]].restart()<cr>')
map('n', '<space>dp', ':lua require[[dap]].repl.open()<cr>')
map('n', '<space>z', ':ZenMode<CR>', {silent = true})

require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {
        id = "scopes",
        size = 0.25, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.25 },
      { id = "stacks", size = 0.25 },
      { id = "watches", size = 00.25 },
    },
    size = 40,
    position = "left", -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    elements = { "repl" },
    size = 10,
    position = "bottom", -- Can be "left", "right", "top", "bottom"
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
})

