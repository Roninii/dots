return {
  enabled = false,
  'navarasu/onedark.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    style = 'dark',

    code_style = {
      comments = 'italic',
    },
  },
  init = function()
    vim.cmd [[colorscheme onedark]]
  end,
}
