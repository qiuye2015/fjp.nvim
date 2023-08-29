return {
  "preservim/tagbar",
  lazy = true,
  ft = { "markdown", "go", "lua", 'python', 'cpp', 'java' },
  config = function()
    vim.keymap.set('n', '<leader>t', ':TagbarToggle<cr>', { noremap = true })
    -- vim.keymap.set("n", "l", "foldclosed('.') != -1 ? 'zo' : 'l'", { expr = true })
    -- vim.keymap.set("n", "L", "foldclosed('.') != -1 ? 'zO' : '$'", { expr = true })
    -- vim.api.nvim_set_keymap('n', '<Space>0',
    --   [[ foldclosed(line(".")) < 0 && foldlevel(line(".")) > 0 ? 'zc:IndentBlanklineRefresh<CR>' : 'zo:IndentBlanklineRefresh<CR>' ]],
    --   { silent = true, noremap = true, expr = true })
    -- vim.api.nvim_set_keymap('v', '<Space>0',
    --   [[ foldclosed(line(".")) < 0 && foldlevel(line(".")) > 0 ? '<ESC>zc:IndentBlanklineRefresh<CR>' : '<ESC>zo:IndentBlanklineRefresh<CR>' ]],
    -- { silent = true, noremap = true, expr = true })

    -- " 用空格键来开关折叠
    -- nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
    -- " Ctrl-Shift-_
    -- nnoremap <C-_> @=((foldclosed(line('.')) < 0) ? 'zM' : 'zR')<CR>

    -- vim.g.tagbar_autoclose = 1
    vim.g.tagbar_autofocus = 1
    vim.g.tagbar_autopreview = 0
    vim.g.tagbar_sort = 0 -- sort by position in file
    vim.g.tagbar_show_data_type = 1
    vim.g.tagbar_show_linenumbers = 1
    vim.g.tagbar_zoomwidth = 1
    vim.g.tagbar_autoshowtag = 1
    vim.g.tagbar_show_tag_count = 1
    vim.g.tagbar_foldlevel = 1
    vim.g.tagbar_wrap = 1
    -- vim.g.tagbar_ctags_bin = ctags
  end
}
