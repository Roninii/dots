return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      lazygit = { enabled = true },
      gitbrowse = { enabled = true },
    },
    keys = {
      {
        '<leader>gg',
        function()
          Snacks.lazygit()
        end,
        desc = 'Lazy[G]it',
      },
      {
        '<leader>gy',
        function()
          Snacks.gitbrowse.open {
            open = function(url)
              local id = MiniNotify.add('Yanked url to clipboard', 'INFO')
              vim.defer_fn(function()
                MiniNotify.remove(id)
              end, 3000)

              vim.fn.setreg('+', url)
            end,
          }
        end,
        desc = '[Y]ank Git URL',
        mode = { 'n', 'v' },
      },
    },
  },
}
