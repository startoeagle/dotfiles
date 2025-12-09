-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    {
      'igorlfs/nvim-dap-view',
      ---@module 'dap-view'
      ---@type dapview.Config
      opts = {},
    },
    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
  },
  keys = {
    -- Basic debugging keymaps, feel free to change to your liking!
    {
      '<leader>dc',
      function()
        require('dap').continue()
      end,
      desc = 'Debug: Start/Continue',
    },
    {
      '<leader>di',
      function()
        require('dap').step_into()
      end,
      desc = 'Debug: Step Into',
    },
    {
      '<c-s>',
      function()
        require('dap').step_over()
      end,
      desc = 'Debug: Step Over',
    },
    {
      '<leader>do',
      function()
        require('dap').step_out()
      end,
      desc = 'Debug: Step Out',
    },
    {
      '<leader>b',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Debug: Toggle Breakpoint',
    },
    {
      '<leader>B',
      function()
        require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end,
      desc = 'Debug: Set Breakpoint',
    },
    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
  },
  config = function()
    local dap = require 'dap'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'delve',
      },
    }

    require('dap-go').setup {
      delve = {
        -- On Windows delve must be run attached or it crashes.
        -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
        detached = vim.fn.has 'win32' == 0,
      },
    }

    dap.adapters.lldb = {
      type = 'server',
      port = '${port}',
      executable = {
        command = '/Users/anton.karlsson/.local/share/nvim/mason/packages/codelldb/codelldb',
        args = { '--port', '${port}' },
        detached = vim.loop.os_uname().sysname ~= 'Windows',
      },
    }

    print 'register python daps'
    dap.configurations.python = {
      {
        name = 'Run pytest with lldb',
        type = 'lldb',
        request = 'launch',
        program = 'python',
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = { '-m', 'pytest', vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()) },
      },
    }
    dap.configurations.python = {
      {
        name = 'Run pytest with lldb',
        type = 'lldb',
        request = 'launch',
        program = 'python',
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = { '-m', 'pytest', vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()) },
      },
    }
    dap.configurations.odin = {
      {
        name = 'Run odin with lldb',
        type = 'lldb',
        request = 'launch',
        program = '${fileDirname}',
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
      },
    }
  end,
}
