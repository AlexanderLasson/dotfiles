-- nvim-tree is a file explorer tree for Neovim
-- https://github.com/nvim-tree/nvim-tree.lua

return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<leader>e', '<cmd>NvimTreeToggle<CR>', desc = 'File tree toggle', silent = true },
    { '<leader>o', '<cmd>NvimTreeFindFile<CR>', desc = 'File tree reveal current file', silent = true },
    { '\\', '<cmd>NvimTreeFindFileToggle<CR>', desc = 'File tree reveal', silent = true },
  },
  opts = {
    -- oil.nvim is the default file explorer, so don't let nvim-tree hijack directories
    disable_netrw = false,
    hijack_netrw = false,
    hijack_directories = { enable = false },
    view = {
      width = 28,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = false,
    },
    on_attach = function(bufnr)
      local api = require 'nvim-tree.api'
      api.config.mappings.default_on_attach(bufnr)
      vim.keymap.set('n', '\\', api.tree.close, { buffer = bufnr, desc = 'nvim-tree: Close', silent = true })
    end,
  },
}
