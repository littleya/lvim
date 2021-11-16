local M = {}

M.set_hop_keymaps = function()
  local opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", opts)
  vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", opts)
  vim.api.nvim_set_keymap("n", "f", ":HopChar1LineAC<cr>", opts)
  vim.api.nvim_set_keymap("n", "F", ":HopChar1LineBC<cr>", opts)
end

M.config = function()
  -- Whichkey keybindings
  -- ====================
  if lvim.builtin.fancy_dashboard.active then
    lvim.builtin.which_key.mappings[";"] = { "<cmd>Alpha<CR>", "Dashboard" }
  end

  lvim.builtin.which_key.mappings["r"] = {
    name = "Replace",
    f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Current Buffer" },
    p = { "<cmd>lua require('spectre').open()<cr>", "Project" },
    w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  }

  if lvim.builtin.persistence then
    lvim.builtin.which_key.mappings["q"] = {
      name = "+Quit",
      d = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
      l = { "<cmd>lua require('persistence').load(last=true)<cr>", "Restore last session" },
      s = { "<cmd>lua require('persistence').load()<cr>", "Restore for current dir" },
    }
  end

  if lvim.builtin.fancy_bufferline.active then
    lvim.builtin.which_key.mappings["b"] = {
      name = "Buffers",
      ["1"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "goto 1" },
      ["2"] = { "<Cmd>BufferLineGoToBuffer 2<CR>", "goto 2" },
      ["3"] = { "<Cmd>BufferLineGoToBuffer 3<CR>", "goto 3" },
      ["4"] = { "<Cmd>BufferLineGoToBuffer 4<CR>", "goto 4" },
      ["5"] = { "<Cmd>BufferLineGoToBuffer 5<CR>", "goto 5" },
      ["6"] = { "<Cmd>BufferLineGoToBuffer 6<CR>", "goto 6" },
      ["7"] = { "<Cmd>BufferLineGoToBuffer 7<CR>", "goto 7" },
      ["8"] = { "<Cmd>BufferLineGoToBuffer 8<CR>", "goto 8" },
      ["9"] = { "<Cmd>BufferLineGoToBuffer 9<CR>", "goto 9" },
      c = { "<Cmd>BufferLinePickClose<CR>", "delete buffer" },
      p = { "<Cmd>BufferLinePick<CR>", "pick buffer" },
      t = { "<Cmd>BufferLineGroupToggle docs<CR>", "toggle groups" },
      f = { "<cmd>Telescope buffers<cr>", "Find" },
      b = { "<cmd>b#<cr>", "Previous" },
      h = {"<cmd>BufferLineCyclePrev<CR>", "cycle to previous"},
      l = {"<cmd>BufferLineCycleNext<CR>", "cycle to next"},
      ["["] = {"<cmd>BufferLineCyclePrev<CR>", "cycle to previous"},
      ["]"] = {"<cmd>BufferLineCycleNext<CR>", "cycle to next"},
      H = {"<cmd>BufferLineMovePrev<CR>", "move to previous"},
      L = {"<cmd>BufferLineMoveNext<CR>", "move to next"},
    }
  end

  if lvim.builtin.cheat.active then
    lvim.builtin.which_key.mappings["?"] = { "<cmd>Cheat<CR>", "Cheat.sh" }
  end

  lvim.builtin.which_key.mappings["F"] = {
    name = "Find",
    b = { "<cmd>lua require('user.configurations.telescope').builtin()<cr>", "Builtin" },
    f = { "<cmd>lua require('user.configurations.telescope').curbuf()<cr>", "Current Buffer" },
    g = { "<cmd>lua require('user.configurations.telescope').git_files()<cr>", "Git Files" },
    i = { "<cmd>lua require('user.configurations.telescope').installed_plugins()<cr>", "Installed Plugins" },
    l = { "<cmd>lua require('user.configurations.telescope').grep_last_search({layout_strategy = \"vertical\"})<cr>", "Last Search" },
    p = { "<cmd>lua require('user.configurations.telescope').project_search()<cr>", "Project" },
    s = { "<cmd>lua require('user.configurations.telescope').git_status()<cr>", "Git Status" },
    z = { "<cmd>lua require('user.configurations.telescope').search_only_certain_files()<cr>", "Certain Filetype" },
  }

  lvim.builtin.which_key.mappings["o"] = { "<cmd>SymbolsOutline<cr>", "Symbol Outline" }

  lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

  lvim.builtin.which_key.mappings["t"] = {
    name = "+Trouble",
    d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    t = { "<cmd>TodoLocList <cr>", "Todo" },
    w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
  }

  lvim.builtin.which_key.mappings["z"] = { "<cmd>ZenMode<cr>", "Zen" }

  lvim.builtin.which_key.mappings["se"] = { "<cmd>lua require('user.configurations.telescope').file_browser()<cr>", "File Browser" }
  lvim.builtin.which_key.mappings["ss"] = {
    "<cmd>lua require('telescope').extensions.live_grep_raw.live_grep_raw()<cr>",
    "String",
  }

  -- Neoclip

  -- Navigate merge conflict markers
  local whk_status, whk = pcall(require, "which-key")
  if not whk_status then
    return
  end
  whk.register {
    ["]n"] = { "[[:call search('^(@@ .* @@|[<=>|]{7}[<=>|]@!)', 'W')<cr>]]", "next merge conflict" },
    ["[n"] = { "[[:call search('^(@@ .* @@|[<=>|]{7}[<=>|]@!)', 'bW')<cr>]]", "prev merge conflict" },
  }

end

return M
