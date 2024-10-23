-- Remap files, where all the remap concerning the basic vim expirience is coded
-- Leader def
vim.g.mapleader = ' ' -- sets the leader to [space]
vim.g.maplocalleader = '\\'

-- UI
vim.keymap.set('n', "<leader>pv", vim.cmd.Ex, {desc = "Go to file explorere"}) 

-- Navigate the buffers
vim.keymap.set('n', "<leader>bn", vim.cmd.bnext, {desc = "Go to next buffer"})
vim.keymap.set('n', "<leader>bp", vim.cmd.bprev, {desc = "Go to prev buffer"})
vim.keymap.set('n', "<leader>bv", vim.cmd.vsplit, {desc = "Split buffer verticaly"})
vim.keymap.set('n', "<leader>bh", vim.cmd.split, {desc = "Split buffer horizontaly"})
vim.keymap.set('n', "<leader>wx", "<C-w>q", {desc = "Quit current window"})
vim.keymap.set('n', "<leader>bw", vim.cmd.bd, {desc = "Close the curent buffer"})

-- Navigate the windows
vim.keymap.set('n', "<C-h>", "<C-w>h")
vim.keymap.set('n', "<C-j>", "<C-w>j")
vim.keymap.set('n', "<C-k>", "<C-w>k")
vim.keymap.set('n', "<C-l>", "<C-w>l")
