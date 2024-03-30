local build_commands = {
  c = "g++ -std=c++17 -o %:p:r.o %",
  cpp = "g++ -std=c++17 -Wall -O2 -o %:p:r.o %",
  rust = "cargo build --release",
  go = "go build",
}

local debug_build_commands = {
  c = "g++ -std=c++17 -g -o %:p:r.o %",
  cpp = "g++ -std=c++17 -g -o %:p:r.o %",
  rust = "cargo build",
  go = "go build",
}

local run_commands = {
  c = "%:p:r.o",
  cpp = "%:p:r.o",
  rust = "cargo run --release",
  go = "go run .",
  python = "python3 %",
  sh = "bash %",
}

vim.api.nvim_create_user_command("Build", function()
  local filetype = vim.bo.filetype

  for file, command in pairs(build_commands) do
    if filetype == file then
      vim.cmd("!" .. command)
      break
    end
  end
end, {})

vim.api.nvim_create_user_command("DebugBuild", function()
  local filetype = vim.bo.filetype

  for file, command in pairs(debug_build_commands) do
    if filetype == file then
      vim.cmd("!" .. command)
      break
    end
  end
end, {})

vim.api.nvim_create_user_command("Run", function()
  local filetype = vim.bo.filetype

  for file, command in pairs(run_commands) do
    if filetype == file then
      vim.cmd("sp")
      vim.cmd("term " .. command)
      vim.cmd("resize 20N")
      local keys = vim.api.nvim_replace_termcodes("i", true, false, true)
      vim.api.nvim_feedkeys(keys, "n", false)
      break
    end
  end
end, {})

vim.api.nvim_create_user_command("Ha", function()
  vim.cmd([[Build]])
  vim.cmd([[Run]])
end, {})

---------------------------

-- Create quick code runner shortcuts
local config = {
  key = "<leader>ce",
  filetypes = {
    bash = "bash $fileName",
    sh = "bash $fileName",
    go = "go run $fileName",
    python = "python3 $fileName",
    javascript = "node $fileName",
    haskell = "runhaskell $fileName",
    rust = "cargo run",
    typescript = "deno run",
    c = "cd $folder && gcc $fileName -o $fileNoExt.out && ./$fileNoExt.out",
    cpp = "cd $folder && g++ -std=c++17 %:p -o $fileNoExt.out -Wall -Wextra -Wshadow && ./$fileNoExt.out",
  },
}

local function parseCmd(ft)
  local mappings = {
    fileName = "%%:p",
    fileNoExt = "%%:t:r",
    folder = "%%:p:h",
  }

  local cmd = config.filetypes[ft]
  for keyword, modifier in pairs(mappings) do
    cmd = cmd:gsub("$" .. keyword, modifier)
  end

  return cmd
end

vim.api.nvim_create_augroup("CodeRunner", { clear = true })

for ft, _ in pairs(config.filetypes) do
  local cmd = ":w<CR>:vsp<CR>:term " .. parseCmd(ft) .. "<CR><C-\\><C-n>"
  vim.api.nvim_create_autocmd("Filetype", {
    group = "CodeRunner",
    pattern = ft,
    command = "nnoremap <buffer> " .. config.key .. " " .. cmd,
  })
end
