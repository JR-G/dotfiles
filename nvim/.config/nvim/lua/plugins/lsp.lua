-- config/nvim/lua/plugins/lsp.lua

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    "stevearc/conform.nvim",
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
  },
  config = function()
    local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
    if not lspconfig_status_ok then
      return
    end

    local mason_status_ok, mason = pcall(require, 'mason')
    if not mason_status_ok then
      return
    end

    local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
    if not mason_lspconfig_status_ok then
      return
    end

    mason.setup()
    mason_lspconfig.setup({
      ensure_installed = { 'ts_ls', 'html', 'cssls', 'tailwindcss', 'lua_ls', 'emmet_ls', 'svelte', 'elixirls', 'rust_analyzer' },
      automatic_installation = true,
    })

    local on_attach = function(client, bufnr)
      vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
      vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")
      local opts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>so", require("telescope.builtin").lsp_document_symbols, opts)

      vim.keymap.set({ "n", "v" }, "=", function()
        require("conform").format({
          bufnr = bufnr,
          async = true,
          lsp_fallback = true,
        })
      end, { desc = "Format buffer" })
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
    if cmp_nvim_lsp_status_ok then
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    end

    local servers = { 'ts_ls', 'html', 'cssls', 'tailwindcss', 'lua_ls', 'emmet_ls', 'svelte', 'elixirls', 'rust_analyzer' }
    for _, lsp in ipairs(servers) do
      if lsp == 'svelte' then
        lspconfig[lsp].setup {
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            svelte = {
              plugin = {
                svelte = {
                  diagnostics = {
                    enable = true,
                  },
                },
              },
            },
          },
        }
      elseif lsp == 'rust_analyzer' then
        lspconfig[lsp].setup {
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            ['rust-analyzer'] = {
              checkOnSave = {
                command = "clippy"
              }
            }
          }
        }
      else
        lspconfig[lsp].setup {
          on_attach = on_attach,
          capabilities = capabilities,
        }
      end
    end

    -- Configure diagnostic signs
    vim.fn.sign_define("DiagnosticSignError", {text = "󰅚", texthl = "DiagnosticSignError"})
    vim.fn.sign_define("DiagnosticSignWarn", {text = "󰀦", texthl = "DiagnosticSignWarn"})
    vim.fn.sign_define("DiagnosticSignInfo", {text = "󰋽", texthl = "DiagnosticSignInfo"})
    vim.fn.sign_define("DiagnosticSignHint", {text = "󰌶", texthl = "DiagnosticSignHint"})

    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = false,
    })

    local cmp = require('cmp')
    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
      })
    })
  end
}

