return {
  'ahmedkhalf/project.nvim',
  dependencies = 'telescope.nvim',
  event = 'VeryLazy',
  cmd = 'Telescope projects',
  keys = { {
    '<leader>p',
    '<cmd>Telescope projects<CR>',
    desc = '[F]ind [P]rojects',
  } },
  opts = {
    detection_methods = { 'pattern', 'lsp' },
    patterns = { '.git', 'package.json', '.terraform', 'go.mod', 'requirements.yml', 'pyrightconfig.json', 'pyproject.toml' },
    ignore_lsp = { 'null-ls', 'efm' },
    exclude_dirs = { '~/' },
    show_hidden = false,
    silent_chdir = true,
  },
  config = function(_, opts)
    require('project_nvim').setup(opts)
    require('telescope').load_extension 'projects'
  end,
}
