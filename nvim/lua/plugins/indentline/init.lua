-- Enable list mode to show special characters
vim.opt.list = true
vim.opt.listchars = {
    -- tab = "...",  -- Use "...." to represent tabs
    -- space = ".",   -- Use "·" to represent spaces
    -- trail = "·",   -- Use "·" for trailing spaces
    nbsp = "␣",    -- Use "␣" for non-breaking spaces
}

-- Define highlight groups for customization
vim.cmd [[
    highlight one guifg=#FF0000 gui=nocombine  " Regular indent lines (gray)
    highlight two guifg=#61afef gui=nocombine  " Current indent guide (blue)
    highlight three guifg=#FFB6C1 gui=nocombine  " Current indent guide (blue)
]]

local highlight = {
    "one",       -- Highlight group for indent guides
    "two", -- Highlight group for context
    "three",
}

require("ibl").setup {
    indent = {
        char = '┊',  -- Character for indent guides
        -- highlight = highlight,
    },
    whitespace = {
        -- highlight = highlight,  -- Apply defined highlights
        remove_blankline_trail = true,  -- Keep trailing whitespace dots
    },
    exclude = {
        filetypes = { 'help', 'packer', 'dashboard' },  -- Exclude these filetypes
        buftypes = { 'terminal', 'nofile' },  -- Exclude these buffer types
    },
    scope = {
        enabled = true,
        show_start = true,
        show_end = true,
        highlight = highlight,  -- Ensure this matches the highlight group name
        include = {
            node_type = {
                -- Highlight specific Treesitter nodes
                "function", "method", "class", "if_statement", "else_clause",
                "for_statement", "while_statement", "switch_statement", 
                "try_statement", "catch_clause", "block"
            },
        }
    },
}


