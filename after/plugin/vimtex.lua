vim.cmd [[
let maplocalleader = ","
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'options' : [
    \   '-shell-escape',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
]]

-- taken from a friends config
vim.g.vimtex_indent_enabled = false      -- Disable auto-indent from Vimtex
vim.g.tex_indent_items = false           -- Disable indent for enumerate
vim.g.tex_indent_brace = false           -- Disable brace indent

-- Suppression settings
vim.g.vimtex_quickfix_mode = 0     -- Suppress quickfix on save/build
vim.g.vimtex_log_ignore = {        -- Suppress specific log messages
    'Underfull',
    'Overfull',
    'specifier changed to',
    'Token not allowed in a PDF string',
}

-- Other settings
-- vim.g.vimtex_mappings_enabled = false     -- Disable default mappings
vim.g.tex_flavor = 'latex'

