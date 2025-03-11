return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
      },
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          path_display = { "truncate" },
          layout_config = {
            horizontal = {
              preview_cutoff = 0
            },
          },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
        },
      })
      telescope.load_extension("fzf")

      local keymap = vim.keymap
      keymap.set("n", "<C-p>", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>",
        { desc = "Fuzzy find files in cmd" })
      keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
      keymap.set("n", "<leader>lg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cmd" })
      keymap.set("n", "<leader>gs", "<cmd>Telescope grep_string<cr>", { desc = "Fuzzy string under cursor in cmd" })
      keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        { desc = "Find functions/symbols" })
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      -- This is your opts table
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  }
}
