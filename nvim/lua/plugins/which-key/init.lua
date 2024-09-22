

-- File: lua/plugins/which-key/init.lua
local wk = require('which-key')

wk.setup {
    -- Configure your options here
    window = {
        border = 'single',  -- Border style
        position = 'bottom',  -- Position of the window
        height = 0.2,  -- Height of the window
        winblend = 0,  -- Transparency of the window
    },
    layout = {
        align = 'center',  -- Center the window
    },
    ignore_missing = false,  -- Show a message if a keymap is not available
    show_help = true,  -- Show the help text
    triggers = "auto",  -- Automatically trigger the window
}

wk.register({
    -- General mappings
    ["<leader>"] = {
        f = { name = "Files" },
        g = { name = "Git" },
        t = { name = "Telescope" },
        b = { name = "Buffers" },
        l = { name = "LSP" },
        w = { name = "Windows" },
        m = { name = "Markdown" },
    },

    -- File-related mappings
    ["<leader>f"] = {
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        g = { "<cmd>Telescope live_grep<cr>", "Find Text" },
        b = { "<cmd>Telescope buffers<cr>", "List Buffers" },
        h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
        r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
        c = { "<cmd>Telescope commands<cr>", "Commands" },
    },

    -- Git-related mappings
    ["<leader>g"] = {
        s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
        u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo Stage Hunk" },
        r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
        p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
        b = { "<cmd>Gitsigns blame_line<cr>", "Blame Line" },
        d = { "<cmd>Gitsigns diffthis<cr>", "Diff This" },
        a = { "<cmd>Git add .<cr>", "Git Add All" },
        c = { "<cmd>Git commit<cr>", "Git Commit" },
        p = { "<cmd>Git push<cr>", "Git Push" },
        f = { "<cmd>Git fetch<cr>", "Git Fetch" },
        l = { "<cmd>Git log<cr>", "Git Log" },
    },

    -- Telescope-related mappings
    ["<leader>t"] = {
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
        b = { "<cmd>Telescope buffers<cr>", "Buffers" },
        h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
        c = { "<cmd>Telescope commands<cr>", "Commands" },
        r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
        m = { "<cmd>Telescope marks<cr>", "Marks" },
        s = { "<cmd>Telescope spell_suggest<cr>", "Spell Suggestions" },
    },

    -- Buffer-related mappings
    ["<leader>b"] = {
        n = { "<cmd>bn<cr>", "Next Buffer" },
        p = { "<cmd>bp<cr>", "Previous Buffer" },
        d = { "<cmd>bd<cr>", "Delete Buffer" },
        l = { "<cmd>ls<cr>", "List Buffers" },
    },

    -- LSP-related mappings
    ["<leader>l"] = {
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to Definition" },
        h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Documentation" },
        i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Go to Implementation" },
        r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
        s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
        t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename Symbol" },
    },

    -- Window-related mappings
    ["<leader>w"] = {
        s = { "<cmd>split<cr>", "Split Window Horizontally" },
        v = { "<cmd>vsplit<cr>", "Split Window Vertically" },
        c = { "<cmd>close<cr>", "Close Window" },
        o = { "<cmd>only<cr>", "Close Other Windows" },
        h = { "<cmd>wincmd h<cr>", "Move to Left Window" },
        j = { "<cmd>wincmd j<cr>", "Move to Bottom Window" },
        k = { "<cmd>wincmd k<cr>", "Move to Top Window" },
        l = { "<cmd>wincmd l<cr>", "Move to Right Window" },
    },

    -- Markdown-related mappings
    ["<leader>m"] = {
        p = { "<cmd>MarkdownPreview<cr>", "Preview Markdown" },
        t = { "<cmd>MarkdownPreviewToggle<cr>", "Toggle Markdown Preview" },
        s = { "<cmd>MarkdownPreviewStop<cr>", "Stop Markdown Preview" },
    },
}, { prefix = "<leader>" })
