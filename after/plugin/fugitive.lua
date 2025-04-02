vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
vim.keymap.set("n", "<leader>gp", "<cmd>Gvdiffsplit! <CR>" );

-- doesn't work because buffer numbers are not always 2 or 3
-- vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
-- vim.keymap.set("n", "gr", "<cmd>diffget //3<CR>")

--better to set it, instead of buffer it depends on the
-- buffer you have selected 
vim.keymap.set("n", "gu", "<cmd>diffget<CR>")
vim.keymap.set("n", "gp", "<cmd>diffput<CR>")

local bufnr = vim.api.nvim_get_current_buf()
local opts = { buffer = bufnr, remap = false }

-- don't need it, just use terminal
-- vim.keymap.set("n", "<leader>gp", function()
--     vim.cmd.Git('push')
-- end, opts)

vim.keymap.set("n", "<leader>P", function()
    vim.cmd.Git({ 'pull', '--rebase' })
end, opts)

