---@type ChadrcConfig
local M = {}
local opt = vim.opt

M.ui = { theme = 'catppuccin' }
M.plugins = 'custom.plugins'

-- Indenting
opt.expandtab = false
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4

return M
