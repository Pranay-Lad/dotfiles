return {
	'everblush/nvim',
	config = function()
		require("everblush").setup({			
		})
		vim.cmd('colorscheme everblush')
	end,
}
