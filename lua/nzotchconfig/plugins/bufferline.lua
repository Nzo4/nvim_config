
return {
    'akinsho/bufferline.nvim',
    version = "*", -- Опционально: используйте стабильную версию
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- Для иконок
    config = function()
        require("bufferline").setup {
            options = {
                numbers = "none", -- Показывать номера буферов (или отключить)
                close_command = "bdelete! %d", -- Команда для закрытия буфера
                right_mouse_command = "bdelete! %d", -- Закрытие правой кнопкой мыши
                left_mouse_command = "buffer %d", -- Переключение левой кнопкой
                middle_mouse_command = nil, -- Отключить команду средней кнопки
                indicator = { style = "icon", icon = "▎" }, -- Иконка индикатора
                buffer_close_icon = "", -- Иконка закрытия буфера
                modified_icon = "●", -- Иконка изменения буфера
                close_icon = "", -- Общая иконка закрытия
                separator_style = "slant", -- Тип разделителей ('slant', 'thick', 'thin')
                show_close_icon = true,
                show_tab_indicators = true,
                enforce_regular_tabs = false,
                always_show_bufferline = true,
                diagnostics = "nvim_lsp", -- Интеграция с LSP
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local icon = level:match("error") and " " or " "
                    return " " .. icon .. count
                end,
            }
        }

        -- Настройка горячих клавиш
        vim.api.nvim_set_keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
        -- Закрытие текущей вкладки через пробел + d
        vim.api.nvim_set_keymap('n', '<Leader>d', ':bp|bd #<CR>', { noremap = true, silent = true })
    end
}
