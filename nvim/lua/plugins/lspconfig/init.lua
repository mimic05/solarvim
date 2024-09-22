require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")
local keymaps = require("core.keymaps")
local lspconfig = require('lspconfig')

mason_lspconfig.setup({
  ensure_installed = { "pyright", "html", "cssls", "lua_ls", "intelephense", "bashls" }
})

-- Function to attach LSP-related keymaps
local on_attach = function(client, bufnr)
    keymaps.setup_lsp_keymaps(bufnr)
end

-- Common LSP flags
local lsp_flags = {
    debounce_text_changes = 150,
}

-- Language server settings
local servers = {
    pyright = {},
    -- tsserver = {},
    lua_ls = {
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                },
                diagnostics = {
                    globals = {'vim'},
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                },
                telemetry = {
                    enable = false,
                },
            },
        },
    },
    html = {},
    cssls = {},
    intelephense = {},
    bashls = {},
}
-- Setup each server
for server_name, server_config in pairs(servers) do
    lspconfig[server_name].setup({
        on_attach = on_attach,
        flags = lsp_flags,
        settings = server_config.settings,
    })
end

