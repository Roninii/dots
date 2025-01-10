return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    version = '*', -- Use the latest stable version
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.animate').setup()
      local miniclue = require 'mini.clue'
      miniclue.setup {
        window = {
          config = {
            width = 'auto',
          },
          delay = 500,
        },

        triggers = {
          -- Leader triggers
          { mode = 'n', keys = '<Leader>' },
          { mode = 'x', keys = '<Leader>' },

          -- Built-in completion
          { mode = 'i', keys = '<C-x>' },

          -- `g` key
          { mode = 'n', keys = 'g' },
          { mode = 'x', keys = 'g' },

          -- Marks
          { mode = 'n', keys = "'" },
          { mode = 'n', keys = '`' },
          { mode = 'x', keys = "'" },
          { mode = 'x', keys = '`' },

          -- Registers
          { mode = 'n', keys = '"' },
          { mode = 'x', keys = '"' },
          { mode = 'i', keys = '<C-r>' },
          { mode = 'c', keys = '<C-r>' },

          -- Window commands
          { mode = 'n', keys = '<C-w>' },

          -- `z` key
          { mode = 'n', keys = 'z' },
          { mode = 'x', keys = 'z' },
        },

        clues = {
          -- Enhance this by adding descriptions for <Leader> mapping groups
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
        },
      }
      require('mini.cursorword').setup()
      require('mini.diff').setup()
      require('mini.files').setup {
        windows = {
          preview = true,
          width_preview = 100,
        },
      }
      require('mini.git').setup()
      require('mini.icons').setup()
      require('mini.indentscope').setup()
      require('mini.jump').setup()
      require('mini.move').setup {
        mappings = {
          -- Visual mode
          left = '<M-Left>',
          right = '<M-Right>',
          down = '<M-Down>',
          up = '<M-Up>',
          -- Normal mode
          line_left = '<M-Left>',
          line_right = '<M-Right>',
          line_down = '<M-Down>',
          line_up = '<M-Up>',
        },
      }
      require('mini.notify').setup()
      require('mini.pairs').setup()
      local statusline = require 'mini.statusline'
      require('mini.starter').setup {
        header = [[
██████╗  ██████╗ ███╗   ██╗██╗███╗   ██╗██╗
██╔══██╗██╔═══██╗████╗  ██║██║████╗  ██║██║
██████╔╝██║   ██║██╔██╗ ██║██║██╔██╗ ██║██║
██╔══██╗██║   ██║██║╚██╗██║██║██║╚██╗██║██║
██║  ██║╚██████╔╝██║ ╚████║██║██║ ╚████║██║
╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝╚═╝  ╚═══╝╚═╝
        ]],
        footer = '',
      }
      require('mini.surround').setup()

      -- Mock Neovim web devicons globally so that Telescope calls mini.icons
      MiniIcons.mock_nvim_web_devicons()

      -- Modify statusline to show line and column number with : instead of |
      statusline.setup {}
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- Add a function and keymap for toggling the file tree
      local minifiles_toggle = function()
        if not MiniFiles.close() then
          MiniFiles.open()
        end
      end
      vim.keymap.set('n', '<leader>ft', minifiles_toggle, { desc = '[F]ile [T]ree' })
    end,
  },
}
