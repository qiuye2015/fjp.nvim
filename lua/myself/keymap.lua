local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- 新建文件
map('n', '<C-n>', ':enew<CR>', opts)
-- 打开文件
map('n', '<C-S-n>', ':edit<CR>', opts)
-- 保存
map('n', '<C-s>', ':w<CR>', opts)
-- 路径查找
map('n', '<C-S-f>', ':grep<CR>', opts)
-- 查找操作
map('n', '<C-S-a>', ':command<CR>', opts)
-- 撤销
map('n', '<C-z>', ':undo<CR>', opts)
-- 重做
map('n', '<C-y>', ':redo<CR>', opts)
-- 剪切
map('n', '<C-x>', ':w !pbcopy<CR>', opts)
-- 复制
map('n', '<C-c>', ':w !pbcopy<CR>', opts)
-- 粘贴
map('n', '<C-v>', ':r !pbpaste<CR>', opts)
-- 查找
map('n', '<C-f>', ':set hlsearch<CR>:set incsearch<CR>', opts)
-- 替换
map('n', '<C-r>', ':%s//g<CR>', opts)
