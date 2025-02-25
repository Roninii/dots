return {
  enabled = false,
  'olimorris/onedarkpro.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    styles = {
      types = 'italic',
      comments = 'italic',
      virtual_text = 'italic',
    },
  },
  init = function()
    vim.cmd [[colorscheme onedark]]
  end,
}
