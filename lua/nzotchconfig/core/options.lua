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

