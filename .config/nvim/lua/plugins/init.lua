return {
	{
		"stevearc/conform.nvim",
		opts = require "configs.conform",
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = { "Hoffs/omnisharp-extended-lsp.nvim" },
		config = function()
			require "configs.lspconfig"
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			filters = {
				-- matched against every node, so nested paths are covered too
				custom = function(path)
					local name = vim.fs.basename(path)
					if name == ".git" or name == ".DS_Store" then
						return true
					end
					-- Godot metadata
					if name:match "%.import$" or name:match "%.uid$" then
						return true
					end
					-- dotnet build output
					return (name == "bin" or name == "obj") and vim.fn.isdirectory(path) == 1
				end,
			},
			view = {
				width = { min = 40 },
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				-- NvChad defaults, this list replaces rather than extends them
				"lua",
				"luadoc",
				"printf",
				"vim",
				"vimdoc",
				"javascript",
				"typescript",
				"tsx",
				"c_sharp",
			},
		},
	},
}
