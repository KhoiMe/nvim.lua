vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- netrw things
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- font highlight
vim.cmd [[hi Comment gui=bold]]
vim.cmd [[hi @lsp.type.property gui=bold]]
vim.cmd [[hi Boolean gui=bold]]
vim.cmd [[hi @lsp.type.keyword gui=bold]]
vim.cmd [[hi @lsp.type.parameter gui=bold]]
vim.cmd [[hi @lsp.type.variable gui=bold]]

vim.cmd [[let &t_ZH="\e[3m"]]
vim.cmd [[let &t_ZR="\e[23m"]]
