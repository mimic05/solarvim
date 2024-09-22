require('core.options')
require('core.keymaps')
require('core.plugins')
require('core.indent')

-- Load plugin configurations
require('plugins.themes')
require('plugins.treesitter')
require('plugins.lualine')
require('plugins.bufferline')
require('plugins.telescope')
require('plugins.start')
require('plugins.comment')
require('plugins.tree')
require('plugins.indentline')

-- LSP   --
require('plugins.lspconfig')

-- completion --
require('plugins.completion')

-- snippets --
require('plugins.snippets')

-- linters --
require('plugins.linter')

-- formatter --
require('plugins.formatter')
