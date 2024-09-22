require("mason-null-ls").setup({
    ensure_installed = {
        "black",
        "prettier",
        "stylua",
        "jq",
        "shfmt",
        "php-cs-fixer",
    },
    automatic_installation = true,
})

-- plugins/formatters/init.lua
local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        python = { "black" },
        javascript = { "prettier" },
        lua = { "stylua" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "jq" },
        markdown = { "prettier" },
        sh = { "shfmt" },
        php = { "phpcsfixer" },
    },
})

-- Set up an autocmd to format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        conform.format({ async = true })
    end,
})

