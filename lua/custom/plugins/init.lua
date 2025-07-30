--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup {
        keymaps = {
          accept_suggestion = '<C-l>', -- Accept the suggestion
          clear_suggestion = '<C-h>', -- Clear the suggestion
          accept_word = '<C-j>', -- Accept the word
        },
      }
    end,
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
        theme = 'doom',
        config = {
          header = { 'NEOVIM' }, --your header
          center = {
            {
              icon = ' ',
              icon_hl = 'Title',
              desc = 'Find File           ',
              desc_hl = 'String',
              key = 'b',
              keymap = 'SPC f f',
              key_hl = 'Number',
              key_format = ' %s', -- remove default surrounding `[]`
              action = 'lua print(2)',
            },
            {
              icon = ' ',
              desc = 'Find Dotfiles',
              key = 'f',
              keymap = 'SPC f d',
              key_format = ' %s', -- remove default surrounding `[]`
              action = 'lua print(3)',
            },
          },
          footer = {}, --your footer
        },
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
  { 'nvim-tree/nvim-web-devicons', opts = {} },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    vim.keymap.set('n', '<leader>n', ':Neotree<CR>'),
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }

      -- Move to previous/next
      map('n', '<Leader>,', '<Cmd>BufferPrevious<CR>', opts)
      map('n', '<Leader>.', '<Cmd>BufferNext<CR>', opts)

      -- Re-order to previous/next
      map('n', '<Leader><', '<Cmd>BufferMovePrevious<CR>', opts)
      map('n', '<Leader>>', '<Cmd>BufferMoveNext<CR>', opts)

      -- Goto buffer in position...
      map('n', '<Leader>1', '<Cmd>BufferGoto 1<CR>', opts)
      map('n', '<Leader>2', '<Cmd>BufferGoto 2<CR>', opts)
      map('n', '<Leader>3', '<Cmd>BufferGoto 3<CR>', opts)
      map('n', '<Leader>4', '<Cmd>BufferGoto 4<CR>', opts)
      map('n', '<Leader>5', '<Cmd>BufferGoto 5<CR>', opts)
      map('n', '<Leader>6', '<Cmd>BufferGoto 6<CR>', opts)
      map('n', '<Leader>7', '<Cmd>BufferGoto 7<CR>', opts)
      map('n', '<Leader>8', '<Cmd>BufferGoto 8<CR>', opts)
      map('n', '<Leader>9', '<Cmd>BufferGoto 9<CR>', opts)
      map('n', '<Leader>0', '<Cmd>BufferLast<CR>', opts)

      -- Close buffer
      map('n', '<Leader>c', '<Cmd>BufferClose<CR>', opts)
    end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
      icons = {
        filetype = {
          enable = true,
        },
      },
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
}
