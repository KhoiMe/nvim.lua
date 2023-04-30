vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
vim.keymap.set("n", "gh", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "ge", "<cmd>diffget //3<CR>")

local bufnr = vim.api.nvim_get_current_buf()
local opts = { buffer = bufnr, remap = false }

vim.keymap.set("n", "<leader>gp", function()
    vim.cmd.Git('push')
end, opts)
