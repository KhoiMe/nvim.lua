local builtin = require('telescope.builtin')

vim.keymap.set('n', 'to', builtin.oldfiles, {})
vim.keymap.set('n', 'tf', builtin.find_files, {})
vim.keymap.set('n', 'tb', builtin.buffers, {})

vim.keymap.set('n', 'tw', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

require('telescope').setup {
    defaults = {
    },
    pickers = {
        find_files = {
            theme = "ivy",
        },
        oldfiles = {
            theme = "ivy",
        },
        buffers = {
            theme = "ivy",
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,               -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case",   -- or "ignore_case" or "respect_case"
        },
    },
    planets = {
        show_pluto = true,
        show_moon = true,
    }
}
