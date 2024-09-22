-- treesitter.lua

require'nvim-treesitter.configs'.setup {
  ensure_installed = {"lua", "python", "html", "css", "javascript", "cpp"}, -- List of languages to manage
  highlight = {
    enable = true,              -- Enable syntax highlighting
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,             -- Enable automatic indentation
  },
  autopairs = {
    enable = true,            -- Enable automatic pairing of parentheses, brackets, etc.
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}

