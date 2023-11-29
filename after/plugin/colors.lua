require('rose-pine').setup({
    --- @usage 'auto'|'main'|'moon'|'dawn'
    variant = 'auto',
    --- @usage 'main'|'moon'|'dawn'
    dark_variant = 'main',
    bold_vert_split = false,
    dim_nc_background = false,
    disable_background = true,
    disable_float_background = true,
    disable_italics = false,

    --- @usage string hex value or named color from rosepinetheme.com/palette
    groups = {
        background = 'base',
        background_nc = '_experimental_nc',
        panel = 'surface',
        panel_nc = 'base',
        border = 'highlight_med',
        comment = 'muted',
        link = 'iris',
        punctuation = 'subtle',

        error = 'love',
        hint = 'iris',
        info = 'foam',
        warn = 'gold',

        headings = {
            h1 = 'iris',
            h2 = 'foam',
            h3 = 'rose',
            h4 = 'gold',
            h5 = 'pine',
            h6 = 'foam',
        }
    },

    highlight_groups = {
        ColorColumn = { bg = 'rose' },

        -- Blend colours against the "base" background
        CursorLine = { bg = 'foam', blend = 10 },
        StatusLine = { fg = 'love', bg = 'love', blend = 10 },
        Search = { bg = 'gold', inherit = false },
    }
})

-- Set colorscheme after options
vim.cmd('colorscheme rose-pine')

function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#21202e"})
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#21202e"})
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#e0def4"})
    vim.api.nvim_set_hl(0, "Pmenu", { bg = "#212121" })
end

ColorMyPencils()
