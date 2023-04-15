local builtin = require('telescope.builtin')
vim.keymap.set('n', 'to', builtin.oldfiles, {})
vim.keymap.set('n', 'tb', builtin.find_files, {})
vim.keymap.set('n', 'tw', function()
	builtin.grep_string({search = vim.fn.input("Grep > ") });
end)
