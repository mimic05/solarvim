
-- Define highlight groups
-- Define highlight groups
-- Enable list mode to show special characters
-- Enable list mode to show special characters
vim.opt.list = true
vim.opt.listchars = {
    tab = "...",  -- Use "...." to represent tabs
    space = "·",   -- Use "·" to represent spaces
    trail = "·",   -- Use "·" for trailing spaces
    nbsp = "␣",    -- Use "␣" for non-breaking spaces
}

-- Define highlight groups for customization
vim.cmd [[
  highlight Whitespace guifg=#636d83 gui=nocombine
  highlight CursorColumn guibg=#3c4048
  highlight IndentBlanklineChar guifg=#56b6c2 gui=nocombine
  highlight IndentBlanklineContextChar guifg=#c678dd gui=nocombine
]]

local highlight = {
    "IndentBlanklineChar",       -- Highlight group for indent guides
    "IndentBlanklineContextChar", -- Highlight group for context
    "Whitespace",                -- Highlight group for whitespace
}

require("ibl").setup {
    indent = {
        char = "┊",  -- Character for indent guides
        highlight = highlight,  -- Apply defined highlights
    },
    whitespace = {
        highlight = highlight,  -- Apply defined highlights
        remove_blankline_trail = true,  -- Keep trailing whitespace dots
    },
    scope = {
        enabled = false,  -- Disable scope highlighting
    },
    exclude = {
        filetypes = { 'help', 'packer', 'dashboard' },  -- Exclude specific filetypes
        buftypes = { 'terminal', 'nofile' },  -- Exclude specific buffer types
    },
}



