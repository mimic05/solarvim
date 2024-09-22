-- plugins/linters/init.lua
local lint = require('lint')

lint.linters_by_ft = {
    python = { 'flake8' },
    javascript = { 'eslint' },
    lua = { 'luacheck' },
    html = { 'tidy' },
    css = { 'stylelint' },
    json = { 'jsonlint' },
    markdown = { 'markdownlint' },
    sh = { 'shellcheck' },
    php = { 'phpstan' },
}

-- Set up an autocmd to lint on save
vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "BufWinEnter" }, {
    pattern = "*",
    callback = function()
        lint.try_lint()
    end,
})

