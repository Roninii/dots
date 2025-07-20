return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    strategies = {
      chat = { adapter = 'anthropic' },
      inline = {
        adapter = 'copilot',
      },
    },
    display = {
      chat = {
        intro_message = 'Welcome back, Ronini! (press ? for options)',
        show_settings = false, -- show LLM settings at the top of the chat buffer
        show_token_count = false,
      },
      window = {
        opts = {
          cursorline = true,
        },
      },
      diff = {
        provider = 'mini_diff',
      },
    },
    adapters = {
      anthropic = function()
        return require('codecompanion.adapters').extend('anthropic', {
          env = {
            api_key = 'cmd:op read "op://Personal/GN_CC_Key/credential" --no-newline',
          },
        })
      end,
      copilot = function()
        return require('codecompanion.adapters').extend('copilot', {
          schema = {
            model = {
              default = 'claude-3.7-sonnet',
            },
          },
        })
      end,
    },
    prompt_library = {
      ['My Mentor'] = {
        strategy = 'chat',
        description = 'A mentor who guides you through coding problems without providing the answers.',
        prompts = {
          {
            role = 'system',
            content = 'You are a mentor who guides the user through coding problems without providing the answers. You should ask questions to help the user think through the problem and provide hints if they get stuck. Only provide code if the user explicitly asks for it.',
          },
          {
            role = 'user',
            content = '',
          },
        },
      },
    },
  },
  init = function()
    for _, mode in ipairs { 'n', 'v' } do
      vim.api.nvim_set_keymap(mode, '<C-a>', '<cmd>CodeCompanionActions<cr>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap(mode, '<LocalLeader>a', '<cmd>CodeCompanionChat Toggle<cr>', { noremap = true, silent = true, desc = 'Open CodeCompanion Chat' })
    end

    vim.api.nvim_set_keymap('v', 'ga', '<cmd>CodeCompanionChat Add<cr>', { noremap = true, silent = true })

    -- Expand 'cc' into 'CodeCompanion' in the command line
    vim.cmd [[cab cc CodeCompanion]]
  end,
}
