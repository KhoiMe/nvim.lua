vim.g.mapleader = "."
vim.keymap.set("n", "<leader>pv", vim.cmd.Oil)

-- Window behavior
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "se", "<C-w>l")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sk", "<C-w>k")

-- window splits
vim.keymap.set("n", "ss", ":split<CR>")
vim.keymap.set("n", "sv", ":vsplit<CR>")

-- between buffers
vim.keymap.set("n", "<TAB>", "<C-^>")
vim.keymap.set("n", "<S-TAB>", ":bnext<CR>")

-- tab things
vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>")

-- essential movement
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set('n', "n", "nzzzv")
-- vim.keymap.set('n', "N", "Nzzzv")

-- greatest remap ever: paste without changing clipboard 
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever: Copy to clipboard 
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

--- nah, why I didn't notice:
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/scripts/myScripts/tmux-sessions<CR>")

vim.keymap.set("n", "<leader>l", "<cmd>silent !xelatex main.tex<CR>")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "Q", "<nop>")

-- letting Ctr+y be used for both open and closing terminal
vim.keymap.set("n", "<C-y>", ":ToggleTerm<CR>")
vim.keymap.set('t', '<C-y>', [[<C-\><C-n>:ToggleTerm<CR>]], { noremap = true, silent = true })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
--
vim.keymap.set("n", "<leader>w",":Td<CR>")
