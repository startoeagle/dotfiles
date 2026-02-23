local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ "neovim/nvim-lspconfig" },
		{ "jake-stewart/multicursor.nvim",   branch = "1.0", },
		{ 'nvim-mini/mini.pick',             version = '*',       opts = {} },
		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", },
		{
			"williamboman/mason.nvim",
			config = function() require('mason').setup() end
		},
		{
			"MironPascalCaseFan/debugmaster.nvim",
			-- osv is needed if you want to debug neovim lua code. Also can be used
			-- as a way to quickly test-drive the plugin without configuring debug adapters
			dependencies = { "mfussenegger/nvim-dap", "jbyuki/one-small-step-for-vimkind", 'mfussenegger/nvim-dap-python' },
			config = function()
				local dm = require("debugmaster")
				vim.keymap.set({ "n", "v" }, "<leader>d", dm.mode.toggle, { nowait = true })
				vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

				dm.plugins.osv_integration.enabled = true -- needed if you want to debug neovim lua code
			end
		},
	},
})
