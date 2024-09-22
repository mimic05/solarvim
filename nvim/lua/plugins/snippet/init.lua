-- lua/plugins/luasnip.lua

local ls = require("luasnip")

-- Load snippets from VSCode extensions
require("luasnip.loaders.from_vscode").lazy_load()

-- Snippets are stored in 'snippets' folder
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/snippets" })

-- Key mapping for snippets
ls.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
})

