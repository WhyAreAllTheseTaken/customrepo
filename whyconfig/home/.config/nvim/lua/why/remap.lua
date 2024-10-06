vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>h", function ()
    vim.cmd("new ~/.config/nvim/guide.md")
end)

vim.keymap.set("n", "<leader>t", function ()
    vim.cmd("NvimTreeOpen")
end)

vim.keymap.set("i", "(", "()<Esc>i")
vim.keymap.set("i", "[", "[]<Esc>i")
vim.keymap.set("i", "{", "{}<Esc>i")
vim.keymap.set("i", "\"", "\"\"<Esc>i")
