-- Настройка нумрации ( числа расположения )
vim.opt.number = true

-- Настройка переноса текста при заполнении ширины экрана
vim.opt.wrap = false

-- Настройка табуляции ( включить/отключить, количество отступов )
vim.opt.expandtab = true 
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Настройка буфера обмена, включаем системный буфер ( можно копировать все что угодно ) 
vim.opt.clipboard = 'unnamedplus'

-- Настройка централизации курсора при заполнении строк кода
vim.opt.scrolloff = 999

-- Настройка поиска игнорирование регистров
vim.opt.ignorecase = true

-- Настройка цветовой схемы ( берем схему терминала )
vim.opt.termguicolors = true

-- Настройка карты клавиш
vim.g.mapleader = " "

-- Отмена текущего выбора ( подсветка, поиск )
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { noremap = true, silent = true })

-- По нажатию gd на клавиатуре можно открыть файл под курсором
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })

-- Сворачивание по отступам
vim.o.foldmethod = "manual" 
-- Включение фолдинга
vim.o.foldenable = true     
     
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format()
  end,
})
