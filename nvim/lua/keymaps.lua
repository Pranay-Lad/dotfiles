local keymap = vim.keymap

vim.g.mapleader = " "

keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>")
keymap.set("n", "<leader>l", "<Cmd>Neotree focus<CR>")

keymap.set("n", "<leader>r", "<Cmd>VimtexCompile<CR>")
keymap.set("n", "<leader>cc", "<Cmd>VimtexStop<CR> <Cmd>VimtexClean<CR>")

