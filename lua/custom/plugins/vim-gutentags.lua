return {
  {
    'ludovicchabant/vim-gutentags',
    config = function()
      vim.g.gutentags_ctags_exclude = {
        '*.git', '*.svn', '*.hg',
        'cache', 'build', 'dist', 'bin', 'node_modules', 'bower_components',
        '*-lock.json', '*.lock',
        '*.min.*',
        '*.bak',
        '*.zip',
        '*.pyc',
        '*.class',
        '*.sln',
        '*.csproj', '*.csproj.user',
        '*.tmp',
        '*.cache',
        '*.vscode',
        '*.pdb',
        '*.exe', '*.dll', '*.bin',
        '*.mp3', '*.ogg', '*.flac',
        '*.swp', '*.swo',
        '.DS_Store', '*.plist',
        '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png', '*.svg',
        '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
        '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx', '*.xls',
      }
      vim.g.gutentags_exclude_filetypes = {
        'gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git'
      }

      vim.g.gutentags_add_default_project_roots = false
      vim.g.gutentags_project_root = {
        '.git', '.hg', '.svn'
      }
      vim.g.gutentags_cache_dir = vim.fn.expand('~/.cache/tags')
      vim.g.gutentags_generate_on_new = true
      vim.g.gutentags_generate_on_missing = true
      vim.g.gutentags_generate_on_write = true
      vim.g.gutentags_generate_on_empty_buffer = true
      vim.g.gutentags_background_update = true
      vim.g.gutentags_ctags_extra_args = { '--tag-relative=yes', '--fields=+ailmnS', }
    end
  },
}
