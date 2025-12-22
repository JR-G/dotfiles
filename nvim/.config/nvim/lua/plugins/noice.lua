return {
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
}
