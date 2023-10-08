vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use({
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    })

    use({
        'nvim-telescope/telescope-fzf-native.nvim',
        run =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    })

    use({
        "bluz71/vim-moonfly-colors",
        as = "moonfly"
    })

    use({ 'rose-pine/neovim', as = 'rose-pine' })

    -- document writing
    use({ 'lervag/vimtex' })

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('nvim-treesitter/nvim-treesitter-context')
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    -- use('lukas-reineke/indent-blankline.nvim')

    use('preservim/nerdtree')
    use('Xuyuanp/nerdtree-git-plugin')
    use('ryanoasis/vim-devicons')


    -- weird utils
    use('norcalli/nvim-colorizer.lua')
    use('tpope/vim-commentary')
    use('windwp/nvim-autopairs')
    use('windwp/nvim-ts-autotag')

    use('jose-elias-alvarez/null-ls.nvim')

    use({
        'akinsho/bufferline.nvim',
        tag = "*",
        requires = 'nvim-tree/nvim-web-devicons',
    })

    use('lewis6991/gitsigns.nvim')
    use('dinhhuy258/git.nvim')

    -- database UI
    use('tpope/vim-dadbod')
    use('kristijanhusak/vim-dadbod-ui')
    use('kristijanhusak/vim-dadbod-completion')

    use({
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig"
    })

    use ({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'dev-v3',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            { 'onsails/lspkind.nvim' },
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required


            -- snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
            { 'honza/vim-snippets' },

        }
    })
end)
