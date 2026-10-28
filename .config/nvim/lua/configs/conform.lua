local prettier = { "prettier" }

local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = prettier,
		javascriptreact = prettier,
		typescript = prettier,
		typescriptreact = prettier,
		css = prettier,
		scss = prettier,
		html = prettier,
		json = prettier,
		yaml = prettier,
		markdown = { "prettier", "markdownlint" },
		cs = { "csharpier" },
	},
}

return options
