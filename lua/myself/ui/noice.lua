-- noicer ui
-- https://github.com/folke/noice.nvim
return {
  'folke/noice.nvim',
  -- enabled = false,
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    'rcarriga/nvim-notify',
  },
  event = 'VeryLazy',
  opts = {
    -- cmdline = {
    -- },
    cmdline = {
      enabled = true, -- enables the Noice cmdline UI
      view = 'cmdline_popup', -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
      opts = {}, -- global options for the cmdline. See section on views
      ---@type table<string, CmdlineFormat>
      format = {
        cmdline = { icon = '>' },
        search_down = { icon = '🔍⌄' },
        search_up = { icon = '🔍⌃' },
        filter = { icon = '$' },
        lua = { icon = '☾' },
        help = { icon = '?' },
      },
    },
    routes = {},
    messages = {
      -- NOTE: If you enable messages, then the cmdline is enabled automatically.
      -- This is a current Neovim limitation.
      enabled = true, -- enables the Noice messages UI
      view = 'mini',
      view_error = 'mini',
      view_warn = 'mini',
      view_search = 'mini',
    },
    lsp = {
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
      },
    },
    presets = {
      bottom_search = false,
      command_palette = false,
      long_message_to_split = true,
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false, -- add a border to hover docs and signature help
    },
  },
    -- stylua: ignore
    keys = {
        { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c",
            desc = "Redirect Cmdline" },
        { "<leader>nl", function() require("noice").cmd("last") end,    desc = "Noice Last Message" },
        { "<leader>nh", function() require("noice").cmd("history") end, desc = "Noice History" },
        { "<leader>na", function() require("noice").cmd("all") end,     desc = "Noice All" },
        { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true,
            expr = true, desc = "Scroll forward", mode = { "i", "n", "s" } },
        { "<c-b>", function() if not require("noice.lsp").scroll( -4) then return "<c-b>" end end, silent = true,
            expr = true, desc = "Scroll backward", mode = { "i", "n", "s" } },
        -- open noice history in telescope
        { "<leader>sh", '<cmd>Noice telescope<cr>', desc = 'Notification History' }
    },
  init = function()
    -- when loading back the session, got double lualine for all buffers in other tabpage #bug
    vim.cmd 'autocmd TabEnter * set cmdheight=0'
  end,
}
