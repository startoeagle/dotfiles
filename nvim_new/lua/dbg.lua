local function mason_ex(executable_str)
	local path = vim.fn.stdpath("data") .. "/mason/bin/"
	return path .. executable_str
end

return {
	setup = function()
		local dap = require('dap')
		dap.adapters.codelldb = {
			type = "executable",
			command = mason_ex("codelldb")
		}

		dap.adapters.debugpy = {
			type = 'executable',
			command = mason_ex('debugpy'),
		}

		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = '${workspaceFolder}',
				stopOnEntry = false,
			},
		}

		dap.configurations.odin = dap.configurations.cpp
		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = dap.configurations.cpp

		require('dap-python').setup('uv')
		require('dap-python').test_runner = 'pytest'

		vim.keymap.set('n', '<leader>kt', require('dap-python').test_method)
	end
}
