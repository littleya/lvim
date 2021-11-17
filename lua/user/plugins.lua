local M = {}

M.config = function()
  local neoclip_req = { "tami/sqlite.lua", module = "sqlite"}
  if lvim.builtin.neoclip.enable_persistant_history == false then
    neoclip_req = {}
  end
  lvim.plugins = {
    -- Theme
    -- =====
    {
      "abzcoding/zephyr-nvim",
      config = function()
        -- vim.cmd [[
        --   colorscheme zephyr
        --  ]]
      end,
      -- cond = lvim.builtin.themes.zephyr.condition(),
    },
    {
      "Pocco81/Catppuccino.nvim",
      config = function()
        -- require("user.theme").catppuccino()
      end,
      -- cond = lvim.builtin.themes.catppuccino.condition(),
    },
    {
      "folke/tokyonight.nvim",
      config = function()
        -- require("user.theme").tokyonight()
        -- vim.cmd [[
        --   colorscheme tokyonight
        -- ]]
      end,
      -- cond = lvim.builtin.themes.tokyonight.condition(),
    },
    {
      "abzcoding/doom-one.nvim",
      branch = "feat/nvim-cmp-floating",
      config = function()
        -- require("user.theme").doom()
        -- vim.cmd [[
        --   colorscheme doom-one
        -- ]]
      end,
      -- cond = lvim.builtin.themes.doom_one.condition(),
    },
    {
      "dracula/vim",
    },
    {
      "ray-x/lsp_signature.nvim",
      config = function()
        require("user.configurations.lsp_signature").config()
      end,
      event = 'BufRead',
    },
    {
      "ethanholz/nvim-lastplace",
      config = function()
        require("nvim-lastplace").setup {}
      end,
      event = "BufWinEnter",
      disable = not lvim.builtin.lastplace.active,
    },
    {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup {}
      end,
      event = "BufRead",
    },
    {
      "folke/trouble.nvim",
      config = function()
        require("trouble").setup()
      end,
      cmd = "Trouble",
    },
    {
      "IndianBoy42/hop.nvim",
      event = "BufRead",
      config = function()
        require("user.configurations.hop").config()
      end,
    },
    {
      "simrat39/symbols-outline.nvim",
      setup = function()
        require("user.configurations.symbols-outline").config()
      end,
      event = "BufReadPost",
      -- cmd = "SymbolsOutline",
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      setup = function()
        vim.g.indent_blankline_char = "▏"
      end,
      config = function()
        require("user.configurations.indent_blankline").config()
      end,
      event = "BufRead",
    },
    {
      "kevinhwang91/nvim-bqf",
      config = function()
        require("user.configurations.bqf").config()
      end,
      event = "BufRead",
    },
    {
      "rcarriga/nvim-dap-ui",
      config = function()
        require("dapui").setup()
      end,
      ft = { "python", "rust", "go" },
      requires = { "mfussenegger/nvim-dap" },
      disable = not lvim.builtin.dap.active,
    },
    {
      "andymass/vim-matchup",
      event = "CursorMoved",
      config = function()
        vim.g.matchup_enabled = 1
        vim.g.matchup_surround_enabled = 1
        vim.g.matchup_matchparen_deferred = 1
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
      end,
    },
    {
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      config = function()
        vim.g.mkdp_open_to_the_world = 1
        vim.g.mkdp_port = 32567
      end,
      ft = "markdown",
    },
    {
      "folke/zen-mode.nvim",
      config = function()
        require("user.configurations.zen").config()
      end,
      event = "BufRead",
    },
    {
      "windwp/nvim-spectre",
      event = "BufRead",
      config = function()
        require("user.configurations.spectre").config()
      end,
    },
    {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("user.configurations.colorizer").config()
      end,
      event = "BufRead",
    },
    {
      "folke/persistence.nvim",
      event = "BufReadPre",
      module = "persistence",
      config = function()
        require("persistence").setup()
      end,
      disable = not lvim.builtin.persistence.active,
    },
    {
      "kristijanhusak/orgmode.nvim",
      keys = { "go", "gC" },
      ft = { "org" },
      config = function()
        require("user.configurations.orgmode").setup()
      end,
      disable = not lvim.builtin.orgmode.active,
    },
    {
      "vim-test/vim-test",
      cmd = { "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit" },
      keys = { "<localleader>tf", "<localleader>tn", "<localleader>ts" },
      config = function()
        require("user.configurations.vim_test").config()
      end,
      disable = not lvim.builtin.test_runner.active,
    },
    {
      "folke/lua-dev.nvim",
      ft = "lua",
      before = "williamboman/nvim-lsp-installer",
      disable = not lvim.builtin.lua_dev.active,
    },
    {
      "akinsho/bufferline.nvim",
      config = function()
        require("user.configurations.bufferline").config()
      end,
      requires = "nvim-web-devicons",
      disable = not lvim.builtin.fancy_bufferline.active,
    },
    {
      "RishabhRD/nvim-cheat.sh",
      requires = "RishabhRD/popfix",
      config = function()
        vim.g.cheat_default_window_layout = "vertical_split"
      end,
      opt = true,
      cmd = { "Cheat", "CheatWithoutComments", "CheatList", "CheatListWithoutComments" },
      keys = "<leader>?",
      disable = not lvim.builtin.cheat.active,
    },
    {
      "AckslD/nvim-neoclip.lua",
      config = function()
        require("user.configurations.neoclip").config()
      end,
      opt = true,
      keys = "<leader>y",
      requires = neoclip_req,
      disable = not lvim.builtin.neoclip.active,
    },
    {
      "goolord/alpha-nvim",
      config = function()
        require("user.configurations.dashboard").config()
      end,
      disable = not lvim.builtin.fancy_dashboard.active,
    },
    {
      "gelguy/wilder.nvim",
      -- event = { "CursorHold", "CmdlineEnter" },
      rocks = { "luarocks-fetch-gitrec", "pcre2" },
      requires = { "romgrk/fzy-lua-native" },
      config = function()
        vim.cmd(string.format("source %s", "~/.config/lvim/vimscript/wilder.vim"))
      end,
      run = ":UpdateRemotePlugins",
      disable = not lvim.builtin.fancy_wild_menu.active,
    },
    {
      "karb94/neoscroll.nvim",
      config = function()
        require("neoscroll").setup {
          easing_function = "quadratic",
        }
      end,
      event = "BufRead",
      disable = not lvim.builtin.neoscroll.active,
    },
    {
      "github/copilot.vim",
      disable = not lvim.builtin.sell_your_soul_to_devil,
    },
    {
      "nvim-telescope/telescope-live-grep-raw.nvim",
    },
    {
      "kevinhwang91/rnvimr",
    },
    {
      "arkav/lualine-lsp-progress",
    }
  }
end

return M
