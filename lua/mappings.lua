require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>df", vim.diagnostic.open_float, { desc = "Open diagnostic on the line in [D]etail" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
