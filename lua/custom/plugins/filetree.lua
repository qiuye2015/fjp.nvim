return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>nl", "<cmd>:Neotree filesystem left toggle<cr>",   desc = "NeoTree left toggle" },
    { "<leader>nt", "<cmd>:Neotree filesystem top toggle<cr>",    desc = "NeoTree top toggle" },
    { "<leader>nb", "<cmd>:Neotree filesystem bottom toggle<cr>", desc = "NeoTree bottom toggle" },
    { "<leader>nr", "<cmd>:Neotree filesystem left reveal<cr>",   desc = "NeoTree left reveal" },
    { "<leader>nf", "<cmd>:Neotree filesystem float toggle<cr>",  desc = "NeoTree float toggle" },
  },
  config = function()
    -- disable netrw at the very start of our init.lua, because we use nvim-tree
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require("neo-tree").setup({
      close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    })
  end,
}
