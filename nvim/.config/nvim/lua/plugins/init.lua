-- lua/plugins/init.lua

return {
  -- Color scheme
  { "Rigellute/rigel" },
  { 'relastle/bluewery.vim' },

  -- Git integration
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      local status_ok, gitsigns = pcall(require, 'gitsigns')
      if not status_ok then
        return
      end

      gitsigns.setup {}
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
}
