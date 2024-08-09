return {
  {
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    version = 'v2.*',
    dependencies = { 'rafamadriz/friendly-snippets' },
    config = function()
      require('luasnip').filetype_extend('vue', { 'vue' })
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
  },
}
