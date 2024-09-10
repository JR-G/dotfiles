-- config/nvim/lua/plugins/nvim-tree.lua

return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local status_ok, nvim_tree = pcall(require, "nvim-tree")
    if not status_ok then
      return
    end

    nvim_tree.setup({
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
      sort_by = "case_sensitive",
      view = {
        adaptive_size = true,
        -- Mappings are now set in the on_attach function
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
      -- Define the on_attach function to set keymaps
      on_attach = function(bufnr)
        local api = require('nvim-tree.api')

        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- Default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- Custom mappings
        vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))
      end,
    })
  end
}

