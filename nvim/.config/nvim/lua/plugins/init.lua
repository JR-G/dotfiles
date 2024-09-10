-- lua/plugins/init.lua
return {
  -- Color schemes
  { "Rigellute/rigel" },
  { 'relastle/bluewery.vim' },
  { 'rebelot/kanagawa.nvim'},
  { 'neanias/everforest-nvim'},
  {'scottmckendry/cyberdream.nvim'},
  { 'zenbones-theme/zenbones.nvim'},
  {
    'uloco/bluloco.nvim',
    dependencies = { 'rktjmp/lush.nvim'}
  },

  -- Git integration
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signs = {
          add          = { text = '+' },
          change       = { text = '~' },
          delete       = { text = '-' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~-' },
          untracked    = { text = '┆' },
        },
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        watch_gitdir = {
          interval = 1000,
          follow_files = true
        },
        attach_to_untracked = true,
        current_line_blame = false,
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,
        max_file_length = 40000,
      }
    end
  },

  -- Autopairs
  {
    'windwp/nvim-autopairs',
    config = function()
      local status_ok, autopairs = pcall(require, 'nvim-autopairs')
      if not status_ok then
        return
      end

      autopairs.setup {}
    end
  },

  -- Comment
  {
    'numToStr/Comment.nvim',
    config = function()
      local status_ok, Comment = pcall(require, 'Comment')
      if not status_ok then
        return
      end

      Comment.setup {}
    end
  },

  -- Focus.nvim
  {
    'beauwilliams/focus.nvim',
    config = function()
      require("focus").setup()
    end
  },

  -- Elixir support
  {
    'elixir-tools/elixir-tools.nvim',
    config = function()
      require("elixir").setup()
    end
  },

  -- Ruby specific
  { 'tpope/vim-rails' },
  { 'tpope/vim-bundler' },
  { 'tpope/vim-dispatch' },
  { 'thoughtbot/vim-rspec' },
  { 'tpope/vim-obsession' },

  -- Useful tpope plugins
  { 'tpope/vim-endwise' },
  { 'tpope/vim-eunuch' },
  { 'tpope/vim-fugitive' },

  -- Modern surround plugin
  { 'kylechui/nvim-surround', config = true },

  -- Additional utilities
  { 'mbbill/undotree' },
  { 'airblade/vim-localorie' },
  { 'windwp/nvim-ts-autotag', config = true },
  { 'andymass/vim-matchup' },
  { 'junegunn/vim-easy-align' },

  -- Enhance Treesitter
  { 'nvim-treesitter/nvim-treesitter-textobjects' },

  -- Formatter
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          javascript = { "eslint_d" },
          typescript = { "eslint_d" },
          javascriptreact = { "eslint_d" },
          typescriptreact = { "eslint_d" },
        },
      })
    end,
  },

  -- Hover definitions
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({
        lightbulb = {
          enable = false,
        }
      })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
  },

  -- Improve input
  {
    'stevearc/dressing.nvim',
    opts = {},
  },

  -- Copilot
  { 'github/copilot.vim' },

  -- Svelte
  { 'evanleck/vim-svelte' },
  { 'leafOfTree/vim-svelte-plugin' }
}
