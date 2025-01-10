return {
  enabled = true,
  'navarasu/onedark.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    code_style = {
      comments = 'italic',
    },
  },
  init = function()
    vim.cmd [[colorscheme onedark]]
  end,
}
