-- config/nvim/init.lua

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

-- Set colorscheme safely
local status_ok, _ = pcall(vim.cmd, "colorscheme rigel")
if not status_ok then
  vim.notify("colorscheme rigel not found!")
  return
end
