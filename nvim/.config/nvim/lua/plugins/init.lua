-- lua/plugins/init.lua
return {
  -- Color schemes
  {
    'uloco/bluloco.nvim',
    dependencies = { 'rktjmp/lush.nvim'}
  },
  {
    "sainnhe/sonokai",
    priority = 1000,
    config = function()
      vim.g.sonokai_transparent_background = "1"
      vim.g.sonokai_enable_italic = "1"
      vim.g.sonokai_style = "andromeda"
      vim.cmd.colorscheme("sonokai")
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require('rose-pine').setup({
        variant = "moon",
        dark_variant = "moon",
        styles = {
          transparency = true
        }
      })
      vim.cmd("colorscheme rose-pine")
    end
  },

  -- Focus.nvim
  {
    'beauwilliams/focus.nvim',
    config = function()
      require("focus").setup()
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
  { 'tpope/vim-projectionist'},

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
          javascript = { "prettier", "eslint_d" },
          typescript = { "prettier", "eslint_d" },
          javascriptreact = { "prettier", "eslint_d" },
          typescriptreact = { "prettier", "eslint_d" },
          svelte = { "prettier" },
          elixir = { "mix" },
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

  -- Svelte
  { 'evanleck/vim-svelte' },
  { 'leafOfTree/vim-svelte-plugin' },

  -- Argument highlighting
  {
    'm-demare/hlargs.nvim',
    config = function()
      require('hlargs').setup()
    end
  },

  { 'mfussenegger/nvim-dap' },

  -- Noice for UI stuff

	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 5000,
			background_colour = "#000000",
			render = "wrapped-compact",
		},
	},
}
