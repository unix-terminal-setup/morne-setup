local plugins = {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require "custom.configs.null-ls"
			end,
		},
		config = function()
			require "plugins.configs.lspconfig"
			require "custom.configs.lspconfig"
		end
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			filters = {
				custom = {
					"^.git$", -- .git ignore
					"^.DS_Store$", -- Mac specific ignore
					"\\.import$", -- Godot import ignore
				}
			},
			view = {
				adaptive_size = true,
				width = 40,
			},
		},
	},
	{
		"Hoffs/omnisharp-extended-lsp.nvim"
	},
}
return plugins
