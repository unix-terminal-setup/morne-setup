require("nvchad.configs.lspconfig").defaults()

local servers = { "ts_ls", "eslint", "omnisharp" }

-- read :h vim.lsp.config for changing options of lsp servers

-- run eslint --fix on save
local eslint_on_attach = vim.lsp.config.eslint.on_attach
vim.lsp.config("eslint", {
	on_attach = function(client, bufnr)
		if eslint_on_attach then
			eslint_on_attach(client, bufnr)
		end
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "LspEslintFixAll",
		})
	end,
})

vim.lsp.config("omnisharp", {
	settings = {
		FormattingOptions = {
			EnableEditorConfigSupport = true,
			OrganizeImports = false,
		},
		MsBuild = {
			LoadProjectsOnDemand = false,
		},
		RoslynExtensionsOptions = {
			EnableAnalyzersSupport = true,
			EnableImportCompletion = false,
			AnalyzeOpenDocumentsOnly = false,
		},
		Sdk = {
			IncludePrereleases = true,
		},
	},
})

-- omnisharp-extended: follow definitions into decompiled/metadata sources
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client or client.name ~= "omnisharp" then
			return
		end

		local ext = require "omnisharp_extended"
		local function map(lhs, fn, desc)
			vim.keymap.set("n", lhs, fn, { buffer = args.buf, desc = "LSP " .. desc })
		end

		map("gd", ext.lsp_definition, "Go to definition")
		map("<leader>D", ext.lsp_type_definition, "Go to type definition")
		map("gr", ext.lsp_references, "Go to references")
		map("gi", ext.lsp_implementation, "Go to implementation")
	end,
})

vim.lsp.enable(servers)
