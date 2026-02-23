vim.opt.swapfile = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.winborder = 'rounded'
vim.opt.completeopt = 'menu,fuzzy,noinsert'
vim.opt.lcs = vim.opt.lcs + 'space:•'
vim.opt.list = true
vim.cmd.colorscheme('default')

vim.g.mapleader = ' '
vim.g.localleader = ' '

require('lsp')
require('plugins')
require('dbg').setup()

vim.api.nvim_set_hl(0, "debugPC", { bg = "#FF2C2C" })

-------------------
-- Keybinds
-------------------

local set = vim.keymap.set

function leadermap(suffix, rhs, desc)
	set('n', '<leader>' .. suffix, rhs, { desc = desc })
end

leadermap('ff', function() vim.cmd('Pick files') end)
leadermap('fb', function() vim.cmd('Pick buffers') end)
leadermap('fh', function() vim.cmd('Pick help') end)
leadermap('fg', function() vim.cmd('Pick grep') end)
leadermap('fl', function() vim.cmd('Pick grep_live') end)


--- maybe add in python ftplugin
require('debugmaster').keys.add({
	key = "<CR>",
	action = require('dap-python').test_method,
	desc = "Jump to the current stack frame"
})

local mc = require("multicursor-nvim")
mc.setup()

-- Add or skip cursor above/below the main cursor.
set({ "n", "x" }, "<up>", function() mc.lineAddCursor(-1) end)
set({ "n", "x" }, "<down>", function() mc.lineAddCursor(1) end)
set({ "n", "x" }, "<leader><up>", function() mc.lineSkipCursor(-1) end)
set({ "n", "x" }, "<leader><down>", function() mc.lineSkipCursor(1) end)

set({ "n", "x" }, "<c-k>", function() mc.lineAddCursor(-1) end)
set({ "n", "x" }, "<c-j>", function() mc.lineAddCursor(1) end)
set({ "n", "x" }, "<leader><c-k>", function() mc.lineSkipCursor(-1) end)
set({ "n", "x" }, "<leader><c-j>", function() mc.lineSkipCursor(1) end)

-- Add or skip adding a new cursor by matching word/selection
set({ "n", "x" }, "<leader>n", function() mc.matchAddCursor(1) end)
set({ "n", "x" }, "<leader>s", function() mc.matchSkipCursor(1) end)
set({ "n", "x" }, "<leader>N", function() mc.matchAddCursor(-1) end)
set({ "n", "x" }, "<leader>S", function() mc.matchSkipCursor(-1) end)

-- Add and remove cursors with control + left click.
set("n", "<c-leftmouse>", mc.handleMouse)
set("n", "<c-leftdrag>", mc.handleMouseDrag)
set("n", "<c-leftrelease>", mc.handleMouseRelease)

-- Disable and enable cursors.
set({ "n", "x" }, "<c-q>", mc.toggleCursor)

-- Mappings defined in a keymap layer only apply when there are
-- multiple cursors. This lets you have overlapping mappings.
mc.addKeymapLayer(function(layerSet)
	-- Select a different cursor as the main one.
	layerSet({ "n", "x" }, "<left>", mc.prevCursor)
	layerSet({ "n", "x" }, "<right>", mc.nextCursor)

	-- Delete the main cursor.
	layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

	-- Enable and clear cursors using escape.
	layerSet("n", "<esc>", function()
		if not mc.cursorsEnabled() then
			mc.enableCursors()
		else
			mc.clearCursors()
		end
	end)
end)

-- Customize how cursors look.
local hl = vim.api.nvim_set_hl
hl(0, "MultiCursorCursor", { reverse = true })
hl(0, "MultiCursorVisual", { link = "Visual" })
hl(0, "MultiCursorSign", { link = "SignColumn" })
hl(0, "MultiCursorMatchPreview", { link = "Search" })
hl(0, "MultiCursorDisabledCursor", { reverse = true })
hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })

-- Split visual selections by regex.
set("x", "S", mc.splitCursors)
