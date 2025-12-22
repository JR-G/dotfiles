-- config/nvim/init.lua

-- Python path for neovim
vim.g.python3_host_prog = vim.fn.expand("~/.config/nvim/venv/bin/python")

-- Set leader key
vim.g.mapleader = ","

-- Load lazy.nvim
require("config.lazy")

-- Load core options
require('core.options')

-- Load keymaps
require('core.keymaps')

-- Load autocmds
require('core.autocmds')
