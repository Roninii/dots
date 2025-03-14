return {
  enabled = false,
  'olimorris/onedarkpro.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    styles = {
      types = 'NONE',
      methods = 'NONE',
      numbers = 'NONE',
      strings = 'NONE',
      comments = 'italic',
      keywords = 'bold,italic',
      constants = 'NONE',
      functions = 'italic',
      operators = 'NONE',
      variables = 'NONE',
      parameters = 'NONE',
      conditionals = 'italic',
      virtual_text = 'italic',
    },
    options = {
      transparency = true,
    },
  },
  init = function()
    vim.cmd [[colorscheme onedark]]
  end,
}
