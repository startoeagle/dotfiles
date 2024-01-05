local neotest = require('neotest')

neotest.setup({
    adapters = {
        require("neotest-python")({
            dap = { justMyCode = false },
        }),
    },
})

vim.keymap.set('n', '<leader>tr', neotest.run.run)
