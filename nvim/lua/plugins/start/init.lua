package.path = package.path .. ';' .. 'C:\\Users\\mimic\\AppData\\Local\\nvim\\lua\\plugins\\start\\arts.lua'

local db = require("dashboard")
local art = require("start.arts")

---- Random number -----
local head_list = art.header()
local footer_list = art.footer()
local table_length = table.getn(head_list)

math.randomseed(os.time())
local random_number = math.random(table_length)

local head = head_list[random_number]

-- footer -- 
local function plugins_count()
    local stats = require('lazy').stats()
    return stats.loaded
end

local plugins = plugins_count()

table.insert(footer_list, " ")
table.insert(footer_list, "🌷  Loaded " .. plugins .. " plugins 🌿")

db.setup({
  theme = 'doom',
  config = {
    header = head, --your header
        
    center = {
    { desc = '⠀⠀⠀📄  Recent Files',
        action = 'Telescope oldfiles' },

    { desc = '⠀⠀⠀🔭  Find  File  ',
        action = 'Telescope find_files hidden=true' },

    { desc = '⠀⠀⠀🕸️  config      ',
        action = ':e C:\\Users\\mimic\\AppData\\Local\\nvim\\init.lua' },
    },



    footer = footer_list  --your footer
  }
})
