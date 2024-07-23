return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup {
      options = {
        mode = "tabs",
        numbers = "ordinal",
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true,
        enforce_regular_tabs = true,
        show_tab_indicators = true,
        separator_style = "thin",
        always_show_bufferline = true,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true
          }
        },
      }
    }
  end
}
