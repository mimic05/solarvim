local set = vim.opt -- setting a local variable 'set', so we don't have to type vim.opt 

-- Tab settings --

set.smarttab = true
set.expandtab = true --  insert spaces instead of tab characters 
set.tabstop = 4 -- length of tab
set.shiftwidth = 4
set.autoindent = true
set.cindent = true

-- Other settings -- 

set.number = true -- show line number
set.cursorline = true -- show line at cursor position
set.paste = false -- allows to paste from clipboard
set.mouse = 'a' -- enable mouse in all mode
set.splitbelow = true
set.splitright = true
set.scrolloff = 8
set.fileencoding ='urf-8'
set.termguicolors = true
set.wrap = true

-- Search settings --

set.ignorecase = true
set.smartcase = true
