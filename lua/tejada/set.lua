local vim = vim

vim.opt.guicursor = ""
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.cmdheight = 1
vim.opt.showmode = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.smartcase = true
vim.opt.spell = false

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

vim.opt.updatetime = 750
vim.opt.pumheight = 10

-- netrw things
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.cmd ([[
    augroup latexSpell
        autocmd!
        autocmd FileType latex setlocal spell spelllang=es
        autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=es
    augroup END
            
]], false)

vim.cmd [[let g:dbext_default_mysql_cmd = 'mariadb']]
vim.cmd [[hi Pmenu guibg=#212121]]
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
