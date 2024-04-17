return {
  'preservim/tagbar',
  lazy = true,
  ft = { 'markdown', 'go', 'lua', 'python', 'cpp', 'java' },
  config = function()
    vim.keymap.set('n', '<leader>tb', ':TagbarToggle<cr>', { noremap = true })
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
  end,
}
