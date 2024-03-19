return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
	    require("neo-tree").setup({
		    popup_border_style = "rounded",
		    enable_git_status = false,
		    enable_diagnostics = false,
		    window = {
			    position = "bottom"
		    },
		    name = {
					use_git_colors = false,
		    },
	    })
    end
}
