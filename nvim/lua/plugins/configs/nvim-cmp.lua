return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local cmp = require("cmp")
		vim.api.nvim_set_hl(0, "MyPmenu",{ fg = "#232a2d", bg = "NONE"})
		vim.api.nvim_set_hl(0, "MyPmenuSel",{ fg = "#232a2d", bg = "#67b0e8"})
		
		vim.api.nvim_set_hl(0, "CmpItemAbbr",	{ fg = "#dadada", bg = "NONE"})
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#67b0e8", bg = "NONE"})
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#e5c76b", bg = "NONE"})						
		local luasnip = require("luasnip")
			
		require("luasnip.loaders.from_vscode").lazy_load()
			
		cmp.setup({
			completion = {
				completeopt = "menu, menuone, preview",
			},

			window = {
				completion = cmp.config.window.bordered({
					winhighlight = "Normal:Pmenu,FloatBorder:MyPmenu,CursorLine:MyPmenuSel,Search:PmenuSel",
					scrollbar = false,
			}),

			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			
			sources = cmp.config.sources({
				{ name = "nvim_lsp_signature_help"},
				{name = "nvim_lsp"},
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),

			mapping = cmp.mapping.preset.insert({
				["<tab>"] = cmp.mapping.confirm( {select = false} ),
				["<C-q>"] = cmp.mapping.select_prev_item(),
				["<C-e>"] = cmp.mapping.select_next_item(),
				["<C-o>"] = cmp.mapping.abort(),
			})
					
		})
	end,
}



