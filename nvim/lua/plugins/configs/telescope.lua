return {
	"nvim-telescope/telescope.nvim",
	
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			vim.keymap.set("n", "<leader>fd", builtin.find_files, {}),
			vim.keymap.set("n", "<leader>ff", builtin.oldfiles, {})
		})
		telescope.load_extension("fzf")
	end,
}


