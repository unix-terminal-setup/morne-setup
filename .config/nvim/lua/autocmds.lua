require "nvchad.autocmds"

-- like :MasonInstallAll, but in the background: installs the lsps and formatters
-- used in configs/lspconfig.lua and configs/conform.lua, plus chadrc's mason.pkgs
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	once = true,
	callback = function()
		-- load these first so their servers and formatters are known
		require("lazy").load { plugins = { "nvim-lspconfig", "conform.nvim", "mason.nvim" } }

		local registry = require "mason-registry"

		registry.refresh(function()
			for _, tool in ipairs(require("nvchad.mason").get_pkgs()) do
				local name, version = tool:match "^([^@]+)@?(.*)$"
				local pkg = registry.get_package(name)

				if not pkg:is_installed() and not pkg:is_installing() then
					vim.notify("Mason: installing " .. name)
					pkg:install { version = version ~= "" and version or nil }
				end
			end
		end)
	end,
})
