return {
  "shaunsingh/nord.nvim",
  priority = 1000, -- Установить высокий приоритет, чтобы Nord применялся первым
  config = function()
  vim.cmd[[colorscheme nord]]
  end,
}
