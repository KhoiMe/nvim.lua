local lsp = require('lsp-zero')
local vim = vim
local navic = require("nvim-navic")

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    navic.attach({ buffer = bufnr })
end)

lsp.extend_cmp()
require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = { 'tsserver', 'rust_analyzer' },
    handlers = {
        lsp.default_setup,
        lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
        end,
    },
})

require("luasnip.loaders.from_vscode").lazy_load()
require('lsp-zero').extend_cmp()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local winhighlight = { winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel", }


cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'treesitter' },
        -- { name = 'cmdline' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'nvim_lsp_signature_help' },

    },
    mapping = {
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<S-TAB>'] = cmp.mapping.select_prev_item(cmp_action),
        ['<TAB>'] = cmp.mapping.select_next_item(cmp_action),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    formatting = {
        fields = { 'abbr', 'menu', 'kind' },
        format =
            function(entry, item)
                local menu_icon = {
                    nvim_lsp = '[LSP]',
                    luasnip = '[luasnip]',
                    buffer = '[buffer]',
                    path = '[path]',
                    nvim_lua = '[nvim_lua]',
                }
                item.menu = menu_icon[entry.source.name]
                return item
            end,
    },
    window = {
        -- completion = cmp.config.window.bordered(winhighlight),
        documentation = cmp.config.window.bordered(winhighlight),
    }
})

-- cmp.setup.cmdline(':', {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = cmp.config.sources({
--         { name = 'path' }
--     }, {
--         {
--             name = 'cmdline',
--             option = {
--                 ignore_cmds = { 'Man', '!' }
--             }
--         }
--     })
-- })

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = "single"
    }
)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signatureHelp, {
        border = "single"
    }
)
vim.diagnostic.config({ float = { border = "single" } })
--- end of colorscheme things

lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})


lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<SPACE>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<SPACE>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<SPACE>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<SPACE>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<SPACE>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<C-m>", '<cmd>Telescope lsp_references<cr>', { buffer = bufnr })

    -- can't autoformat  because php inline
    -- lsp.buffer_autoformat()
end)

-- nvim navic
local function setup_language_servers(server_names_nav)
    for _, server_nav in ipairs(server_names_nav) do
        require('lspconfig')[server_nav].setup({
            on_attach = function(client, bufnr)
                navic.attach(client, bufnr)
            end,
        })
    end
end

local servers_to_setup = { 'pylsp', 'rust_analyzer', 'cssls', 'tsserver', 'lua_ls', 'html' }
setup_language_servers(servers_to_setup)

-- Php needed
require('lspconfig').emmet_ls.setup({
    single_file_support = false,
    filetypes = { "html", "php" },
})

require('lspconfig').html.setup({
    single_file_support = false,
    filetypes = { "html", "php" },
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end,
})


lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
