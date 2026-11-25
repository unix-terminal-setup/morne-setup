-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "catppuccin",
}

-- mason-registry's omnisharp v2.0.0 entry points at -net6.0 assets that release no longer ships
M.mason = {
	pkgs = { "omnisharp@v1.39.15" },
	skip = { "omnisharp" },
}

return M
