require('legendary').setup({
  keymaps = {
    -- map keys to a command
    { '<leader>ll', ':Legendary <CR>', description = 'Legendary menu' },
    { '<leader>tk', ':Telescope keymaps <CR>', description = 'Legendary key map' },
    { '<leader>lc', ':Legendary commands <CR>', description = 'Legendary commands' },
    { '<leader>lf', ':Legendary functions <CR>', description = 'Legendary functions' },
    { '<leader>tt', ':Telescope  <CR>', description = 'Telescope' },
    { '<leader>tc', ':Telescope commands <CR>', description = 'Telescope commands' },
    { '<leader>tk', ':Telescope keymaps  <CR>', description = 'Telescope keymaps' },
    { '<leader>tf', ':Telescope find_files  <CR>', description = 'Telescope fin_files' },
    { '<leader>ps', ':PackerSync <CR>', description = 'PackerSync' },
    { '<leader>dn', ':Neotree <CR>', description = 'Neotree' },
    
  }
    -- map keys to a function
  --   { '<leader>h', function() print('hello world!') end, description = 'Say hello' },
  --   -- keymaps have opts.silent = true by default, but you can override it
  --   { '<leader>s', ':SomeCommand<CR>', description = 'Non-silent keymap', opts = { silent = false } },
  --   -- create keymaps with different implementations per-mode
  --   {
  --     '<leader>c',
  --     { n = ':LinewiseCommentToggle<CR>', x = ":'<,'>BlockwiseCommentToggle<CR>" },
  --     description =\ 'Toggle comment'
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
