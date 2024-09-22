local style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light"}

require('onedark').setup {
    style = style_list[1]
}

vim.cmd("colorscheme onedark")
