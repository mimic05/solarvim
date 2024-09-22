config = function()
require('neo-tree').setup({
  close_if_last_window = true,  -- Close NeoTree if it is the last window left
  popup_border_style = "rounded", -- Border style for popups
  enable_git_status = true, -- Show git status in the file explorer
  enable_diagnostics = true, -- Show diagnostics in the file explorer
  filesystem = {
    follow_current_file = true, -- This will find and focus the current file in the NeoTree window
    hijack_netrw_behavior = "open_current", -- Open NeoTree when netrw is used
    use_libuv_file_watcher = true, -- Use libuv to watch for filesystem changes
    commands = {}, -- Custom commands
    window = {
      position = "left", -- Position of NeoTree window
      width = 20, -- Width of NeoTree window
      mappings = {
        ["<BS>"] = "navigate_up", -- Use <BS> to navigate up to the parent directory
        ["<CR>"] = "open",
        ["o"] = "open",
        ["C"] = "close_node",
        ["z"] = "close_all_nodes",
      },
    },
  },
})
end
