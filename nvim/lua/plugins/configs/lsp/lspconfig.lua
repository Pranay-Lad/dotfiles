return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp"
	},
	config = function()
		local lspconfig = require("lspconfig")

		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap
		
		local opts = {noremap = true, silent = true}


		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			opts.desc = "Show LSP references"
			keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

			opts.desc = "Show LSP Definitions"
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		lspconfig['clangd'].setup( {
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = { "clangd", "--completion-style=detailed" },
		})

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						gloabls = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["texlab"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		
	end,
}
