return {
  {
    'sunjon/stylish.nvim',
    config = function()
      -- vim.ui.notify = require("stylish").ui_notification()
      vim.keymap.set('n', '<F12>', function()
        require('stylish').ui_clock()
      end, { noremap = true, silent = true })
    end,
  },
}
