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
		-- main branch: no ensure_installed or auto highlight, so install and start it ourselves
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			pcall(function()
				dofile(vim.g.base46_cache .. "syntax")
				dofile(vim.g.base46_cache .. "treesitter")
			end)

			require("nvim-treesitter").install {
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

			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "cs", "javascript", "typescript", "typescriptreact", "lua", "vim" },
				callback = function(args)
					pcall(vim.treesitter.start, args.buf)
				end,
			})
		end,
	},
}
