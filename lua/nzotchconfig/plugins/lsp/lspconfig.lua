
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }

    -- Функция для привязки клавиш при подключении LSP
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr
      opts.desc = "Просмотреть code actions"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

      opts.desc = "Просмотреть документацию того что под курсором"
      keymap.set("n", "K", vim.lsp.buf.hover, opts)
    end

    -- Настройки для автозавершения через nvim-cmp
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Настройка LSP для TypeScript / JavaScript
    lspconfig["ts_ls"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
      end,
      filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
      root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
    })

    -- Настройка LSP для ESLint
    lspconfig["eslint"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
    })

    -- Настройка LSP для NestJS
    lspconfig["ts_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "typescript", "javascript" },
      root_dir = lspconfig.util.root_pattern("nestjs.json", "package.json", "tsconfig.json"),
    })

    -- Настройка LSP для HTML
    lspconfig["html"].setup({ capabilities = capabilities, on_attach = on_attach })

    -- Настройка LSP для Lua
    lspconfig["lua_ls"].setup({ capabilities = capabilities, on_attach = on_attach })

    -- Настройка LSP для CSS
    lspconfig["cssls"].setup({ capabilities = capabilities, on_attach = on_attach })

    -- Настройка LSP для Omnisharp (C#)
    lspconfig["omnisharp"].setup({ capabilities = capabilities, on_attach = on_attach })

    -- Настройка LSP для Tailwind CSS
    lspconfig["tailwindcss"].setup({ capabilities = capabilities, on_attach = on_attach })

    -- Настройка LSP для Emmet Language Server
    lspconfig["emmet_language_server"].setup({ capabilities = capabilities, on_attach = on_attach })

    -- Настройка LSP для PHP (phpactor)
    lspconfig["phpactor"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "php" },
      root_dir = lspconfig.util.root_pattern("composer.json", ".git", "artisan"),
      settings = {
        phpactor = {
          path = "/path/to/phpactor"  -- Укажите путь к phpactor
        }
      }
    })

    -- Настройка LSP для PHP (intelephense)
    lspconfig["intelephense"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "php" },
      root_dir = lspconfig.util.root_pattern("composer.json", ".git", "artisan"),
      settings = {
        intelephense = {
          files = {
            associations = { "*.php", "*.html", "*.js", "*.ts" }
          }
        }
      }
    })
  end
}
