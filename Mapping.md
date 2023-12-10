[toc]

# base

- 查看某个快捷键是在哪个配置文件定义: `:verbose map [快捷键]`

# lazy.nvim

> A modern plugin manager for Neovim

```bash
- :Lazy
- :Lazy home
- :Lazy health
- :Lazy profile
```

## Uninstalling

- [ ] data: ~/.local/share/nvim/lazy
- [ ] state: ~/.local/state/nvim/lazy
- [ ] lockfile: ~/.config/nvim/lazy-lock.json

# which-key.nvim

> WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible key bindings of the command you started typing.
>
> `:checkhealth which_key` 查看是否存在任何冲突的键映射，以防止触发 WhichKey

```bash
- :WhichKey " show all mappings
- :WhichKey <leader> " show all <leader> mappings
- :WhichKey <leader> v " show all <leader> mappings for VISUAL mode
- :WhichKey '' v " show ALL mappings for VISUAL mode
```

# neo-tree.nvim

> Neovim plugin to manage the file system and other tree like structures.
>
> `:h neo-tree`

```bash
- :Neotree filesystem/git_status left/top/float
```

# gitsigns.nvim

- `Gitsigns toggle_current_line_blame` ==> `<leader>tb`

# nvim-treesitter

> 代码高亮

- `:TSInstallInfo` 查看已安装的 Language parser
- `TSModuleInfo`
- `:TSInstall <language_to_install>`

# Comment.nvim

> Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more
>
> `:help comment-nvim`
>
> `:h comment.config`

```bash
# NORMAL mode
`gcc` - Toggles the current line using linewise comment
`gbc` - Toggles the current line using blockwise comment
`[count]gcc` - Toggles the number of line given as a prefix-count using linewise
`[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
`gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment ==> `gcp[count]{motion}`
`gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment ==> `gbp[count]{motion}`

# VISUAL mode
`gc` - Toggles the region using linewise comment
`gb` - Toggles the region using blockwise comment
```

# telescope.nvim

> `:checkhealth telescope`
>
> `:help telescope`

```bash
:Telescope colorscheme
:Telescope find_files		<leader>sf
:Telescope live_grep		<leader>sg
:Telescope keymaps
:Telescope git_branches
:Telescope git_status
:Telescope find_files prompt_prefix=🔍

<leader>?						Find recently opened files
<leader><space>			Find existing buffers
<leader>/           Fuzzily search in current buffer [word]

<leader>sf					[S]earch [F]iles
<leader>sh          [S]earch [H]elp
<leader>sw          [S]earch current [W]ord
<leader>sg          [S]earch by [G]rep
<leader>sd          [S]earch [D]iagnostics
```

# nvim-lspconfig

> Quickstart configs for Nvim LSP
>
> `:help lsp-config`

```bash
- :LspInfo shows the status of active and configured language servers.
- :LspStart <config_name> Start the requested server name. Will only successfully start if the command detects a root directory matching the current config. Pass autostart = false to your .setup{} call for a language server if you would like to launch clients solely with this command. Defaults to all servers matching current buffer filetype.
- :LspStop <client_id> Defaults to stopping all buffer clients.
- :LspRestart <client_id> Defaults to restarting all buffer clients.
- :LspLog
```

```bash
<leader>e		vim.diagnostic.open_float
<leader>q		vim.diagnostic.setloclist

<leader>rn	[R]e[n]am
<leader>ca	[C]ode [A]ction
gr					[G]oto [R]eferences
gd					[G]oto [D]efinitio
gD					[G]oto [D]eclaration
gI					[G]oto [I]mplementation


<leader>D		Type [D]efinition
<leader>ds	[D]ocument [S]ymbols
<leader>ws	[W]orkspace [S]ymbols
<leader>wa	[W]orkspace [A]dd Folder
<leader>wr	[W]orkspace [R]emove Folder
<leader>wl	[W]orkspace [L]ist Folders

K						Hover Documentation
<C-k>				Signature Documentation
Format			Format current buffer with LSP

```

## mason.nvim

> Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters.
>
> `:checkhealth mason`

```bash
- :Mason - opens a graphical status window
- :MasonInstall <package> ... - installs/reinstalls the provided packages
- :MasonUninstall <package> ... - uninstalls the provided packages
- :MasonUninstallAll - uninstalls all packages
- :MasonLog - opens the mason.nvim log file in a new tab window

  - LSP: lspconfig & mason-lspconfig.nvim
  - DAP: nvim-dap
  - Linters: null-ls.nvim or nvim-lint
  - Formatters: null-ls.nvim or formatter.nvim
```

## mason-lspconfig.nvim

> Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim. Strongly recommended for Windows users.
>
> `:h mason-lspconfig-introduction`
>
> `:h mason-lspconfig-commands`
>
> `:h mason-lspconfig-settings`

```bash
- :LspInstall [<server>...]
- :LspUninstall <server> ...
```

# nvim-cmp

> 代码补全引擎

- `cmp-xxx` 基本都是插件补全来源，也就是说当你输入一个变量的时候，可以从多个来源显示补全的内容
- `cmp-nvim-lsp` 就是 Neovim 内置 LSP 提供的补全内容
- `cmp-path` 则是用来补全路径，如果配置了这个，当输入一个路径的时候会补全路径

