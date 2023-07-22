local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'intelephense',
    'rust_analyzer',
    'html',
    'emmet_ls',
    'eslint',
    'vimls',
})

lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<S-TAB>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<TAB>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

-- colorscheme things

local winhighlight = {
    winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
}

require('cmp').setup({
    window = {
        completion = cmp.config.window.bordered(winhighlight),
        documentation = cmp.config.window.bordered(winhighlight),
    }
})

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

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
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
    vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('lspconfig').html.setup({
    single_file_support = false,
    filetypes = { "html", "php" },
})

require('lspconfig').emmet_ls.setup({
    single_file_support = false,
    filetypes = { "html", "php" },
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
