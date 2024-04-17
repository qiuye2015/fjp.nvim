return {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim", -- telescope 所需
        "MunifTanjim/nui.nvim",

        -- 可选
        "nvim-treesitter/nvim-treesitter",
        "rcarriga/nvim-notify",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        -- 配置放在这里
        cn = {
            enabled = true,
        },
        lang = "golang",
        injector = { ---@type table<lc.lang, lc.inject>
            ["cpp"] = {
                before = { "#include <bits/stdc++.h>", "using namespace std;" },
                after = "int main() {}",
            },
            ["java"] = {
                before = "import java.util.*;",
            },
            ["golang"] = {
                before = "package main",
            },
        }
    },
}
