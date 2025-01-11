return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    version = '*', -- Use the latest stable version
    config = function()
      require('mini.notify').setup()
      require('mini.pairs').setup()
    end,
  },
}
