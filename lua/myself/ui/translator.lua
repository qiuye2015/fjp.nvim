return {
    'voldikss/vim-translator',
    event = 'VeryLazy',
    config = function()
        vim.keymap.set({'n', 'x'}, '<leader>tw', ':TranslateW<CR>', {
            noremap = true,
            silent = true
        })

        vim.g.translator_window_max_width = 0.5 -- 设置悬浮窗大小
        vim.g.translator_default_engines = {'google', -- "bing",
        -- "youdao",
        'haici'}
    end
}
