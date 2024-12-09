return  {
    "neovim/nvim-lspconfig",
   dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
      local lspconfig = require("lspconfig")

      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local keymap = vim.keymap
      local opts = { noremap = true, silent = true}

      local on_attach = function(client, bufnr)
        opts.buffer = bufnr
        opts.desc = "Просмотреть code actions"
        keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)
        
        opts.desc = "Просмотреть документацию того что под курсором"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)
      end
        local capabilities = cmp_nvim_lsp.default_capabilities()

     -- configure html server
      lspconfig["html"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

      lspconfig["lua_ls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = { -- custom settings for lua
                Lua = {
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })
      
    
      -- configure css server
        lspconfig["cssls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
      })

    -- configure tailwindcss server
        lspconfig["tailwindcss"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
      lspconfig["emmet_language_server"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["phpactor"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["intelephense"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

    end
  }

