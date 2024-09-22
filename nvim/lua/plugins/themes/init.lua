vim.o.background = "dark" -- or "light" for light mode

-- Define a list of colorschemes you like
local colorschemes = {
  "gruvbox",
  "tokyonight-night",
  "nord",
  "catppuccin-mocha",
  "dracula",
  "everforest",
  "onedark",
  "zephyr",
}

-- Seed the random number generator
math.randomseed(os.time())

-- Select a random colorscheme from the list
local random_colorscheme = colorschemes[math.random(#colorschemes)]

-- Set the colorscheme
vim.cmd.colorscheme(random_colorscheme)
