---@diagnostic disable-next-line: missing-fields
require('nvim-ts-autotag').setup {
    ensure_installed = { "javascript", "html", "php", "c", "lua", "vim", "vimdoc", "query", "latex"},
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    autotag = {
        enable = true,
        enable_rename = true,
    },
    indent = {
        enable = true,
    },
}
---@diagnostic disable-next-line: missing-fields
require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "blade", "html", "php", "markdown", "markdown_inline", "latex" },
    sync_install = false,
    auto_install = true,
    ignore_install = { "javascript" },
    highlight = {
        enable = true,
        disable = { "c", "rust", "php" },
        additional_vim_regex_highlighting = false,
    },
}

vim.api.nvim_create_autocmd("User", {
    pattern = "TSUpdate",
    callback = function()
        local parsers = require "nvim-treesitter.parsers"
        parsers.blade = {
            tier = 0,

            ---@diagnostic disable-next-line: missing-fields
            install_info = {
                url = "https://github.com/EmranMR/tree-sitter-blade",
                files = { "src/parser.c" },
                branch = "main",
            },
            filetype = "blade"
        }
    end,
})
