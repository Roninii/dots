return {
  enabled = false,
  'EdenEast/nightfox.nvim',
  priority = 1000,
  opts = {
    options = {
      dim_inactive = true,
      styles = {
        comments = 'italic',
        types = 'italic',
      },
    },
  },
  init = function()
    vim.cmd [[colorscheme nightfox]]
  end,
}
