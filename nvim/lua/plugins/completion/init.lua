local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")
local keymaps = require("core.keymaps")

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(), -- Display borders around the completion window
        documentation = cmp.config.window.bordered(), -- Display borders around the documentation window
    },
    mapping = keymaps.setup_cmp_keymaps(cmp),
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
        { name = "cmdline" },
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
            before = function(entry, vim_item)
                return vim_item
            end,
        }),
    },
})
vim.opt.pumheight = 5
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- For `/` command-line completion.
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- For `:` command-line completion.
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
