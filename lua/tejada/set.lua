local opt = vim.opt
local g = vim.g

opt.guicursor = ""
opt.splitright = true
opt.splitbelow = true

opt.nu = true
opt.relativenumber = true

opt.smartindent = true
opt.autoindent = true

opt.cmdheight = 1
opt.showmode = false

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.wrap = true
opt.wrapscan = false
opt.whichwrap = "bs"
opt.linebreak = true
opt.smartcase = true
opt.spell = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 750
opt.pumheight = 10

-- netrw things
g.netrw_browse_split = 0
g.netrw_banner = 0
g.netrw_winsize = 25

vim.cmd [[let g:dbext_default_mysql_cmd = 'mariadb']]
vim.cmd [[set cursorline]]
vim.cmd [[hi Pmenu guibg=#212121]]
vim.cmd([[autocmd FileType * set fo-=r fo-=c fo-=o]]) -- dont continue comments on enter, etc. see :h fo-table

vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
