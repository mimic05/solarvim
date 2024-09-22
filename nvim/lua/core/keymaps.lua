local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local function options(description)
    local option = {noremap = true, silent = true, desc = description}
    return option
end

vim.g.mapleader = ' '

-- Custom mappings
map('i', 'jk', '<esc>', opts)          -- jk to go normal mode from insert mode
map('v', '<', '<gv', opts)             -- indent line in < direction
map('v', '>', '>gv', opts)             -- indent line in > direction
map('n', 'bp', ':bp<CR>', opts)        -- go to left in buffer
map('n', 'bn', ':bn<CR>', opts)        -- go to right in buffer
map('n', ';', ':', opts)               -- ; to type command instead of :
map('n', 'Q', '@q', opts)              -- Q to run qq macro
map('n', '<leader>qq', ':q<CR>', options("Exit"))
map('n', '<leader>w', ':w<CR>', options("Save"))
map('n', '<leader>k', ':bnext<CR>', options("Buffer Next"))
map('n', '<leader>j', ':bprev<CR>', options("Buffer Previous"))

-- File Explorer --
map('n', '<leader>ee', ':Neotree toggle<CR>', options("File Explorer"))
--map('n', '<leader>f', ':Neotree focus<CR>', options("File Explorere Focus"))

-- Telescope --

map('n', '<leader>ff', '<cmd>Telescope find_files <CR>', options("Find Files"))
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', options("Live Grep"))
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', options("Buffers"))
map('n', '<leader>fo', '<cmd>Telescope oldfiles<CR>', options("Old Files"))
map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', options("Help"))

-- Comment --

map('n', '<leader>cl', '<Plug>(comment_toggle_linewise_current)', options('Comment Current Line'))
map('n', '<leader>c', '<Plug>(comment_toggle_linewise)', options('Comment Pending'))
map('x', '<leader>cl', '<Plug>(comment_toggle_linewise_visual)', options('Comment Selected'))

-- LSP Mappings
local M = {}

-- Setup LSP-specific keymaps for a buffer
function M.setup_lsp_keymaps(bufnr)
    local buf_map = function(mode, lhs, rhs, desc)
        local names = { noremap = true, silent = true, buffer = bufnr, desc = desc }
        map(mode, lhs, rhs, names) -- replaced options with names 
    end

    buf_map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', "Go to Definition")
    buf_map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', "Go to Declaration")
    buf_map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', "Go to Implementation")
    buf_map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', "Show References")
    buf_map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', "Hover Documentation")
    buf_map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', "Signature Help")
    buf_map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', "Rename Symbol")
    buf_map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', "Code Action")
    buf_map('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', "Show Diagnostics")
    buf_map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', "Previous Diagnostic")
    buf_map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', "Next Diagnostic")
    buf_map('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', "Diagnostics List")
end

function M.setup_cmp_keymaps(cmp)
    return {
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable, -- Remove default `<C-y>` mapping
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
                require("luasnip").expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
                require("luasnip").jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }
end

return M
