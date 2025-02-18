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
      -- vim.cmd("colorscheme rose-pine")
      require('rose-pine').setup({
        styles = {
          transparency = true
        }
      })
    end
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

  -- Copilot
  -- { 'github/copilot.vim' },

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

  -- Debugging
  { 'puremourning/vimspector' },
  { 'mfussenegger/nvim-dap' },

  -- Noice for UI stuff
  {
    "folke/noice.nvim",
    opts = function()
        -- Initialize opts with a default empty table
        local opts = {
            routes = {},  -- Initialize routes as empty array
            commands = {
                all = {
                    view = "split",
                    opts = { enter = true, format = "details" },
                    filter = {},
                },
            },
            presets = {
                lsp_doc_border = true,
            },
        }

        -- Now you can safely insert into opts.routes
        table.insert(opts.routes, {
            filter = {
                event = "notify",
                find = "No information available",
            },
            opts = { skip = true },
        })

        local focused = true
        vim.api.nvim_create_autocmd("FocusGained", {
            callback = function()
                focused = true
            end,
        })
        vim.api.nvim_create_autocmd("FocusLost", {
            callback = function()
                focused = false
            end,
        })

        table.insert(opts.routes, 1, {
            filter = {
                cond = function()
                    return not focused
                end,
            },
            view = "notify_send",
            opts = { stop = false },
        })

        return opts  -- Return the configured opts table
    end,
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
},

	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 5000,
			background_colour = "#000000",
			render = "wrapped-compact",
		},
	},
}
