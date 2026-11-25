require "nvchad.options"

local o = vim.o

local osc52 = require "vim.ui.clipboard.osc52"
local function paste_from_unnamed_register()
	return { vim.fn.split(vim.fn.getreg "", "\n"), vim.fn.getregtype "" }
end
vim.g.clipboard = {
	name = "OSC 52",
	copy = { ["+"] = osc52.copy "+", ["*"] = osc52.copy "*" },
	paste = { ["+"] = paste_from_unnamed_register, ["*"] = paste_from_unnamed_register },
}

-- Indenting
o.expandtab = false
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4
