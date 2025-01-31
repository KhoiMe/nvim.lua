return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require('telescope').setup {
        pickers = {
          find_files = {
            theme = "dropdown"
            -- dropdown
          }
        },
        extensions = {
          fzf = {
                fuzzy = true,                   -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true,    -- override the file sorter
                case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            }
        }
      }

      require('telescope').load_extension('fzf')
        vim.keymap.set('n', 'to', builtin.oldfiles, {})
        vim.keymap.set('n', 'gt', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', 'tb', builtin.buffers, {})

        vim.keymap.set('n', 'tw', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end)
    end
  }
}
