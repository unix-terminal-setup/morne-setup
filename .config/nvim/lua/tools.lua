local M = {}

local INSTALL_TIMEOUT_MS = 20 * 60 * 1000

M.treesitter_parsers = {
	"lua",
	"luadoc",
	"printf",
	"vim",
	"vimdoc",
	"javascript",
	"typescript",
	"tsx",
	"c_sharp",
}

-- the lsps and formatters used in configs/lspconfig.lua and configs/conform.lua, plus chadrc's mason.pkgs
function M.mason_packages()
	require("lazy").load { plugins = { "nvim-lspconfig", "conform.nvim", "mason.nvim" } }

	local packages = {}
	for _, tool in ipairs(require("nvchad.mason").get_pkgs()) do
		local name, version = tool:match "^([^@]+)@?(.*)$"
		table.insert(packages, { name = name, version = version ~= "" and version or nil })
	end
	return packages
end

local function install_mason_packages_blocking()
	local registry = require "mason-registry"
	local failed, pending = {}, {}

	local refreshed = false
	registry.refresh(function()
		refreshed = true
	end)
	vim.wait(INSTALL_TIMEOUT_MS, function()
		return refreshed
	end, 200)

	registry:on("package:install:success", function(pkg)
		pending[pkg.name] = nil
	end)
	registry:on("package:install:failed", function(pkg)
		pending[pkg.name] = nil
		table.insert(failed, pkg.name)
	end)

	for _, package in ipairs(M.mason_packages()) do
		local found, pkg = pcall(registry.get_package, package.name)
		if not found then
			table.insert(failed, package.name .. " (not in the Mason registry)")
		elseif not pkg:is_installed() then
			pending[package.name] = true
			pkg:install { version = package.version }
		end
	end

	vim.wait(INSTALL_TIMEOUT_MS, function()
		return next(pending) == nil
	end, 500)
	for name in pairs(pending) do
		table.insert(failed, name .. " (timed out)")
	end
	return failed
end

local function install_treesitter_parsers_blocking()
	local completed, all_installed = pcall(function()
		return require("nvim-treesitter").install(M.treesitter_parsers):wait(INSTALL_TIMEOUT_MS)
	end)
	if completed and all_installed then
		return {}
	end
	return { "treesitter parsers (run :TSInstall " .. table.concat(M.treesitter_parsers, " ") .. ")" }
end

-- for headless setup: installs everything, prints what failed, and exits non-zero if anything did
function M.install_blocking()
	local failed = vim.list_extend(install_mason_packages_blocking(), install_treesitter_parsers_blocking())
	for _, name in ipairs(failed) do
		io.stdout:write("Failed to install: " .. name .. "\n")
	end
	vim.cmd(#failed == 0 and "qall!" or "cquit! 1")
end

return M
