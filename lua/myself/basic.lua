print 'FJP call lua/myself/basic.lua'

-- nocompatible
-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath 'data' .. '/undo'

-- history
-- 补全增强?
vim.o.wildmenu = true
-- wildmode
-- backspace
-- Don't pass messages to |ins-completin menu|??
vim.o.shortmess = vim.o.shortmess .. 'c'

-- 文件被外部修改时,自动加载
vim.o.autoread = true
-- Automatically save before :next, :make etc.
vim.opt.autowrite = true
-- Change CWD when I open a file
vim.opt.autochdir = true
-- 允许隐藏被修改的buffer
vim.o.hidden = true
-- helplang
-- 更新时间
vim.o.updatetime = 300
-- 设置 timeoutlen 为等待键盘快捷键连击时间为500毫秒
vim.o.timeoutlen = 500

-- 编码设置 --
-- fileformat
-- utf8
vim.g.encoding = 'UTF-8'
vim.o.fileencoding = 'utf-8'
-- fileencodings

-- 搜索设置 --
-- 搜索要高亮
vim.o.hlsearch = true
-- 边输入边搜索
vim.o.incsearch = true
-- 搜索大小写不敏感
vim.o.ignorecase = true
vim.o.smartcase = true

-- 缩进模式 --
-- 缩进4个空格为一个Tab
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true
-- >> << 时移动长度?
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
-- 空格代替Tab
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.smarttab = true
-- 新行对齐当前行
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- cindent
-- filetype plugin indent on
-- 保留虚拟行的缩进。 这些“虚拟线”只有在启用换行时才可见
vim.o.breakindent = true

-- 代码折叠 --
vim.o.foldmethod = 'indent'
vim.o.foldlevelstart = 20
vim.o.foldlevel = 20

-- 代码补全 --
-- 自动补全不自动选中 (不一定有效)
vim.g.completeopt = 'menu,menuone,noselect,noinsert'
-- 补全最多显示10行
vim.o.pumheight = 10

-- 显示设置 --
vim.o.showmatch = true
vim.o.matchtime = 1
-- 显示行号:(相对行号/绝对行号)
vim.wo.number = true
vim.wo.relativenumber = true
-- 禁用自动折行
vim.wo.wrap = false
-- 光标在行首尾时可以跳到下一行
vim.o.whichwrap = '<,>,[,]'
-- linebreak
-- 设置不可见字符
vim.o.list = true
-- vim.o.listchars = "space:·"
-- vim.o.listchars = "tab:»·,trail:·,nbsp:+"
vim.o.listchars = 'tab:+-,trail:-,nbsp:-,eol:$'
-- hjkl 移动时光标周围保留8行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- 显示左侧图标指示列?
vim.wo.signcolumn = 'yes'
-- 实时预览替换效果
vim.o.inccommand = 'split'

-- 状态栏设置 --
-- 命令行行高为2,提供足够的显示空间
vim.o.cmdheight = 2
-- 永远显示 tabline?
vim.o.showtabline = 2

-- 主题设置 --
-- 样式
vim.o.background = 'dark'
vim.o.termguicolors = true
-- 高亮所在行
vim.wo.cursorline = true
-- 分割窗口从下和右出现
vim.o.splitbelow = true
vim.o.splitright = true

-- 其他 --
-- 鼠标支持
vim.o.mouse = 'a'
-- Copy/paste to system clipboard
vim.opt.clipboard = 'unnamedplus'
-- 使用增强状态栏插件后不需要vim模式提示功能
vim.o.showmode = false
-- 开启虚拟文本
vim.opt.virtualedit = 'block'
-- 取消符号隐藏
vim.opt.conceallevel = 0

-----------------------------

-- 在行首按h，折叠起来
vim.api.nvim_set_keymap('n', 'h', "col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc' : 'h'", { expr = true, noremap = true, silent = true })
-- 在折叠上按 l 键会打开折叠
vim.api.nvim_set_keymap('n', 'l', "foldclosed(line('.')) != -1 ? 'zo0' : 'l'", { expr = true, noremap = true, silent = true })
-- 在行首按h，关闭包含在选择范围内的折叠。
vim.api.nvim_set_keymap('v', 'h', "col('.') == 1 && foldlevel(line('.')) > 0 ? 'zcgv' : 'h'", { expr = true, noremap = true, silent = true })
-- 在折叠区域中按下 l 键可以打开包含在选择范围中的折叠区域
vim.api.nvim_set_keymap('v', 'l', "foldclosed(line('.')) != -1 ? 'zogv0' : 'l'", { expr = true, noremap = true, silent = true })

-- 支持在 Visual 模式下，通过 C-y 复制到系统剪切板
vim.api.nvim_set_keymap('v', '<C-y>', '"+y', { noremap = true })

-- 支持在 Normal 模式下，通过 C-p 粘贴系统剪切板
vim.api.nvim_set_keymap('n', '<C-p>', '"*p', { noremap = true })

-- 打开文件后自动跳转到最后编辑的行
vim.cmd 'autocmd BufReadPost * if line("\'\\"") > 0 && line("\'\\"") <= line("$") | execute "normal! g\'\\"" | endif'
-- 设置自动保存
vim.cmd [[
augroup autosave
    autocmd!
    autocmd BufLeave * silent! wall
augroup END
]]
-- Trim whitespace
vim.api.nvim_create_user_command('TrimWhiteSpace', 'keeppatterns %s/\\s\\+$//e <Bar> :nohlsearch', { force = true })
-- delete blank lines
vim.api.nvim_create_user_command('DeleteBlankLines', function()
  local input = vim.fn.input('', ':g/^$/d')
  vim.cmd(input)
  vim.fn.histadd('cmd', input)
end, { force = true })
-- CDC = Change to Directory of Current file
vim.api.nvim_create_user_command('CdCurrentDirectory', 'lcd %:p:h', { force = true })

local Util = require 'myself.util'

Util.map('n', '<leader>tF', function()
  Util.float_term(nil, { cwd = Util.get_root() })
end, { desc = 'Terminal (root dir)' })
Util.map('n', '<leader>tf', function()
  Util.float_term()
end, { desc = 'Terminal (cwd)' })
Util.map('t', '<esc><esc>', '<c-\\><c-n>', { desc = 'Enter Normal Mode' })

-- run :GoBuild or :GoTestCompile based on the go file
local function build_go_files()
  if vim.endswith(vim.api.nvim_buf_get_name(0), '_test.go') then
    vim.cmd 'GoTestCompile'
  else
    vim.cmd 'GoBuild'
  end
end

-- vim-go
vim.keymap.set('n', '<leader>cg', build_go_files, { desc = 'GoBuild or GoTestCompile' })
-- Go uses gofmt, which uses tabs for indentation and spaces for aligment.
-- Hence override our indentation rules.
vim.api.nvim_create_autocmd('Filetype', {
  group = vim.api.nvim_create_augroup('setIndent', { clear = true }),
  pattern = { 'go' },
  command = 'setlocal noexpandtab tabstop=4 shiftwidth=4',
})

-- Run gofmt/gofmpt, import packages automatically on save
vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('setGoFormatting', { clear = true }),
  pattern = '*.go',
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { 'source.organizeImports' } }
    local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params, 2000)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, 'utf-16')
        else
          vim.lsp.buf.execute_command(r.command)
        end
      end
    end
    vim.lsp.buf.format()
  end,
})

-- If I visually select words and paste from clipboard, don't replace my
-- clipboard with the selected word, instead keep my old word in the
-- clipboard
vim.keymap.set('x', 'p', '"_dP')

-- automatically resize all vim buffers if I resize the terminal window
-- vim.api.nvim_command('autocmd VimResized * wincmd =')

-- Use python3 w.r.t. $PATH as the host python for neovim.
if vim.g.python3_host_prog == '' or not vim.g.python3_host_prog then
  vim.g.python3_host_prog = vim.fn.exepath 'python3'
end

-- local function find_python_executable()
--   if vim.env.VIRTUAL_ENV then
--     local paths = vim.fn.glob(vim.env.VIRTUAL_ENV .. "/**/bin/python", true, true)
--     local executable_path = table.concat(paths, ", ")
--     if executable_path ~= "" then
--       vim.api.nvim_echo({ { "Using path for python: " .. executable_path, "None" } }, false, {})
--       return executable_path
--     end
--   elseif vim.fn.filereadable(".venv/bin/python") == 1 then
--     local executable_path = vim.fn.expand(".venv/bin/python")
--     vim.api.nvim_echo({ { "Using path for python: " .. executable_path, "None" } }, false, {})
--     return executable_path
--   end
--   vim.api.nvim_echo({ { "No python executable found (see autocmds.lua)", "WarningMsg" } }, false, {})
-- end

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "python" },
--   callback = function()
--     vim.g.python3_host_prog = find_python_executable() -- python executable
--     vim.opt_local.colorcolumn = "72,88" -- Ruler at column number
--     vim.opt_local.tabstop = 4 -- Number of spaces tabs count for
--     vim.opt_local.shiftwidth = 4 -- Size of an indent
--   end,
-- })
