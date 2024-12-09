
return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup {
            options = {
                -- Ваша конфигурация lualine
                theme = 'nord',
                section_separators = '', -- Опционально
                component_separators = '', -- Опционально
            }
        }
    end
}
