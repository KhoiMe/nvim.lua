local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'nvim-telescope/telescope.nvim',
        dependencies = 'nvim-lua/plenary.nvim'
    },

    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },

    { 'rose-pine/neovim',        name = 'rose-pine' },
    { 'tjdevries/colorbuddy.vim' },
    { 'tjdevries/gruvbuddy.nvim' },

    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },



    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    },

    { 'nvim-treesitter/nvim-treesitter-context' },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    { 'mbbill/undotree' },
    { 'tpope/vim-fugitive' },

    { 'akinsho/toggleterm.nvim' },
    { 'ryanoasis/vim-devicons' },

    -- big file thing
    {
        'LunarVim/bigfile.nvim'
    },

    -- latex stuff
    {
        "lervag/vimtex",
        dependencies = {
            "micangl/cmp-vimtex",
        },
        version = "*",
    },


    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    { 'shortcuts/no-neck-pain.nvim' },

    -- weird utils
    { 'norcalli/nvim-colorizer.lua' },
    { 'tpope/vim-commentary' },

    -- {'windwp/nvim-autopairs'},
    { 'windwp/nvim-ts-autotag' },

    { 'nvim-tree/nvim-web-devicons' },

    { 'lewis6991/gitsigns.nvim' },
    { 'dinhhuy258/git.nvim' },

    {
        "SmiteshP/nvim-navic",
        dependencies = "neovim/nvim-lspconfig"
    },

    {
        { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
        { 'neovim/nvim-lspconfig' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/nvim-cmp' },
        { 'L3MON4D3/LuaSnip' }, {
        -- Optional
        'williamboman/mason.nvim',
    },
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional

        -- Autocompletion
        { 'ray-x/cmp-treesitter' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-nvim-lsp-signature-help' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-nvim-lua' },
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        -- { 'hrsh7th/cmp-cmdline' },


        -- snippets
        { 'rafamadriz/friendly-snippets' },
        { 'honza/vim-snippets' },

    } })
