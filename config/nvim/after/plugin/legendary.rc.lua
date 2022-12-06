-- More info -- see docs -- https://github.com/mrjones2014/legendary.nvim
require('legendary').setup({
  keymaps = {
    -- map keys to a command
    { '<leader>ff', ':Telescope find_files <CR>', description = 'Find files' },
    { '<leader>ll', ':Legendary <CR>', description = 'Legendary menu' },
    { '<leader>lk', ':Legendary keymaps <CR>', description = 'Legendary key map' },
    { '<leader>lc', ':Legendary commands <CR>', description = 'Legendary commands' },
    { '<leader>lf', ':Legendary functions <CR>', description = 'Legendary functions' },
    { '<leader>la', ':Telescope autocmds <CR>', description = 'Legendary autocmds' },
    { '<leader>ps', ':PackerSync <CR>', description = 'Legendary autocmds' },
    { '<leader>nt', ':Neotree <CR>', description = 'Legendary autocmds' },
    { '<leader>se', ':Sexplore <CR>', description = 'Legendary autocmds' },
  }
    -- map keys to a function
  --   { '<leader>h', function() print('hello world!') end, description = 'Say hello' },
  --   -- keymaps have opts.silent = true by default, but you can override it
  --   { '<leader>s', ':SomeCommand<CR>', description = 'Non-silent keymap', opts = { silent = false } },
  --   -- create keymaps with different implementations per-mode
  --   {
  --     '<leader>c',
  --     { n = ':LinewiseCommentToggle<CR>', x = ":'<,'>BlockwiseCommentToggle<CR>" },
  --     description = 'Toggle comment'
  --   },
  --   -- create item groups to create sub-menus in the finder
  --   -- note that only keymaps, commands, and functions
  --   -- can be added to item groups
  --   {
  --     -- groups with same itemgroup will be merged
  --     itemgroup = 'short ID',
  --     description = 'A submenu of items...',
  --     icon = '',
  --     keymaps = {
  --       -- more keymaps here
  --     },
  --   },
  -- },
  -- commands = {
  --   -- easily create user commands
  --   { ':SayHello', function() print('hello world!') end, description = 'Say hello as a command' },
  --   {
  --     -- groups with same itemgroup will be merged
  --     itemgroup = 'short ID',
  --     -- don't need to copy the other group data because
  --     -- it will be merged with the one from the keymaps table
  --     commands = {
  --       -- more commands here
  --     },
  --   },
  -- },
  -- funcs = {
  --   -- Make arbitrary Lua functions that can be executed via the item finder
  --   { function() doSomeStuff() end, description = 'Do some stuff with a Lua function!' },
  --   {
  --     -- groups with same itemgroup will be merged
  --     itemgroup = 'short ID',
  --     -- don't need to copy the other group data because
  --     -- it will be merged with the one from the keymaps table
  --     funcs = {
  --       -- more funcs here
  --     },
  --   },
  -- },
  -- autocmds = {
  --   -- Create autocmds and augroups
  --   { 'BufWritePre', vim.lsp.buf.format, description = 'Format on save' },
  --   {
  --     name = 'MyAugroup',
  --     clear = true,
  --     -- autocmds here
  --   },
  -- },
})
