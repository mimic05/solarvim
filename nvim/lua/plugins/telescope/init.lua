function get_parent_dir()
  local cwd = vim.fn.getcwd() -- Get the current working directory
  return vim.fn.fnamemodify(cwd, ':h') -- :h removes the last directory from the list
end                                    -- thus returning the parent directory


require('telescope').setup {
    defaults = {
        file_ignore_patterns = {"node_modules", ".git"},
        file_sorter = require('telescope.sorters').get_fuzzy_file,
        generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
        path_display = { "absolute" },
        winblend = 0,
    -- Additional settings
    },

    pickers = {
        find_files = {
            find_command = {
                'fd',
                '--type', 'file',
                '--hidden',
                '--follow',
                '--exclude', '.git',
                '--max-depth', '10',  -- Adjust max depth if needed
            },
            --cwd = vim.fn.expand('$HOME'), -- Set the current working directory to the user's home
            cwd = get_parent_dir() -- setting the current working directory to parent directory
        },

        live_grep = {
            vimgrep_arguments = {
                'rg',
                '--color=never',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
                '--smart-case',
                '--hidden',
                '--no-ignore',
                '--max-columns=2048'
            },
        -- cwd = vim.fn.expand('$HOME') -- Remove cwd to use the current working directory
            cwd = get_parent_dir() -- setting the current working directory to parent directory
        },
        extensions = {
            
        }
    }
}

