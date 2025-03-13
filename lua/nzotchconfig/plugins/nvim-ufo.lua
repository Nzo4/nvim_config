return {
  "kevinhwang91/nvim-ufo",
  dependencies = "kevinhwang91/promise-async",
  config = function()
    vim.o.foldcolumn = "1" -- Показывать индикатор сворачивания
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.o.foldmethod = "manual"

    local ufo = require("ufo")
    ufo.setup()

    vim.keymap.set("n", "zR", ufo.openAllFolds, { desc = "Развернуть все" })
    vim.keymap.set("n", "zM", ufo.closeAllFolds, { desc = "Свернуть все" })
  end
}
