local opt = vim.opt
opt.swapfile = false
opt.number = true
opt.relativenumber = true
opt.signcolumn = 'yes'
opt.cursorline = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.winborder = 'rounded'
opt.completeopt = 'menu,fuzzy,noinsert'
opt.lcs = opt.lcs + 'space:•'
opt.list = true
vim.cmd.colorscheme('antons')

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

local function leadermap(suffix, rhs, desc)
    set('n', '<leader>' .. suffix, rhs, { desc = desc })
end

leadermap('ff', function() vim.cmd('Pick files') end, "Pick files")
leadermap('fb', function() vim.cmd('Pick buffers') end, "Pick buffers")
leadermap('fh', function() vim.cmd('Pick help') end, "Pick help")
leadermap('fg', function() vim.cmd('Pick grep_live') end, "Pick grep_live")
leadermap('fl', function() vim.cmd('Pick buf_lines') end, "Pick buf_lines")
leadermap('fk', function() vim.cmd('Pick keymaps') end, "Pick keymaps")

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
set({ "n", "v" }, "<leader>A", mc.matchAllAddCursors)
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

    layerSet({ "x" }, "&", mc.alignCursors)
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

leadermap("v", require('jj').open, "Start jjui")
