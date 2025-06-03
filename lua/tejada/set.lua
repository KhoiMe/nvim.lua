vim.opt.colorcolumn = "80" -- because you need to wrap around this thing
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

vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.smartcase = true
vim.opt.spell = false

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "tex" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "es"
  end,
})


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

-- get latex spell for spanish
vim.cmd([[
    augroup latexSpell
        autocmd!
        autocmd FileType latex setlocal spell spelllang=es
        autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=es
    augroup END

]], false)

vim.cmd [[let g:dbext_default_mysql_cmd = 'mariadb']]
vim.cmd [[ let g:spellfile_URL = 'https://ftp.nluug.nl/vim/runtime/spell']]
-- vim.cmd [[set cursorline]]
vim.cmd [[hi Pmenu guibg=#212121]]

-- turn on navic or not 
-- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

-- highlight when yanking
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

vim.cmd [[
set listchars+=space:·
set list
]]
