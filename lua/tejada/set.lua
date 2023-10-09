local vim = vim
vim.opt.nu = true
-- vi.opt.cursorline = true
vim.opt.relativenumber = true

vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

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

vim.opt.updatetime = 10
vim.opt.pumheight = 10

-- netrw things
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.cmd [[let g:dbext_default_mysql_cmd = 'mariadb']]
vim.cmd [[set guicursor=n-v-c-i:block]]
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

-- monfly things
-- vim.g.moonflyNormalFloat = true
-- vim.g.moonflyItalics = true
-- vim.g.moonflyTransparent = true

-- vim.g.moonflyUnderlineMatchParen = true
-- vim.g.moonflyUndercurls = false


-- vim.cmd [[hi @lsp.type.property gui=bold]]
-- vim.cmd [[hi Boolean gui=bold]]
-- vim.cmd [[hi @lsp.type.keyword gui=bold]]
-- vim.cmd [[hi @lsp.type.parameter gui=bold]]
-- vim.cmd [[hi @lsp.type.variable gui=bold]]
--
-- vim.cmd [[let &t_ZH="\e[3m"]]
-- vim.cmd [[let &t_ZR="\e[23m"]]
