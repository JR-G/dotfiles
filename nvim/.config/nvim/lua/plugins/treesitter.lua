-- config/nvim/lua/plugins/treesitter.lua

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
    if not status_ok then
      return
    end

    configs.setup {
      ensure_installed = { "lua", "vim", "query", "javascript", "typescript", "css", "html" },
      highlight = {
        enable = true,
      },
    }
  end
}

