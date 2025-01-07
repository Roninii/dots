return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    version = '*', -- Use the latest stable version
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      require('mini.animate').setup()

      require('mini.git').setup()
      require('mini.diff').setup()

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      local statusline = require 'mini.statusline'
      statusline.setup {}

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- Automatic highlighting of word under cursor
      require('mini.cursorword').setup()

      -- Highlight indent scope
      require('mini.indentscope').setup()

      -- Jump to next/previous single character
      require('mini.jump').setup()

      -- Show notifications
      require('mini.notify').setup()

      -- Move lines and selections in direction
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

      -- Start page
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

      -- File utils
      require('mini.files').setup {
        mappings = {
          go_in = '<Right>',
          go_in_plus = '<S-Right>',
          go_out = '<Left>',
          go_out_plus = '<S-Left>',
        },
      }
      local minifiles_toggle = function()
        if not MiniFiles.close() then
          MiniFiles.open()
        end
      end
      vim.keymap.set('n', '<leader>b', minifiles_toggle, { desc = 'File Tree' })

      -- Show keybindings on the fly
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

      -- Pair matching
      require('mini.pairs').setup()
    end,
  },
}
