vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use({
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        requires = { { 'nvim-lua/plenary.nvim' } }
    })

    use({
        'nvim-telescope/telescope-fzf-native.nvim',
        run =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    })

    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use({ 'tjdevries/colorbuddy.vim' })
    use({ 'tjdevries/gruvbuddy.nvim' })


    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    use('nvim-treesitter/nvim-treesitter-context')
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    -- use('lukas-reineke/indent-blankline.nvim')

    use('akinsho/toggleterm.nvim')
    use('ryanoasis/vim-devicons')


    -- weird utils
    use('norcalli/nvim-colorizer.lua')
    use('tpope/vim-commentary')
    -- use('windwp/nvim-autopairs')
    use('windwp/nvim-ts-autotag')

    use('nvim-tree/nvim-web-devicons')

    use('lewis6991/gitsigns.nvim')
    use('dinhhuy258/git.nvim')

    use({
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig"
    })

    use({
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
            { 'ray-x/cmp-treesitter' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            -- { 'hrsh7th/cmp-cmdline' },


            -- snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
            { 'honza/vim-snippets' },

        }
    })
end)
