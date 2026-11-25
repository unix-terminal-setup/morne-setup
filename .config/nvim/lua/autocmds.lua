require "nvchad.autocmds"

-- like :MasonInstallAll, but in the background: installs the lsps and formatters
-- used in configs/lspconfig.lua and configs/conform.lua, plus chadrc's mason.pkgs
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	once = true,
	callback = function()
		local packages = require("tools").mason_packages()
		local registry = require "mason-registry"

		registry.refresh(function()
			for _, package in ipairs(packages) do
				local pkg = registry.get_package(package.name)

				if not pkg:is_installed() and not pkg:is_installing() then
					vim.notify("Mason: installing " .. package.name)
					pkg:install { version = package.version }
				end
			end
		end)
	end,
})
