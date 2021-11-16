local M = {}

M.config = function()
  -- Barbar
  if lvim.builtin.fancy_bufferline.active then
    lvim.builtin.bufferline.active = false
  end

  -- CMP
  -- ===

  -- nvimtree
  -- ========
  lvim.builtin.nvimtree.setup.auto_open = 0
  lvim.builtin.nvimtree.setup.diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  }

  -- Dashboard
  -- =========================================
  lvim.builtin.dashboard.active = not lvim.builtin.fancy_dashboard.active
  if not lvim.builtin.fancy_dashboard.active then
    lvim.builtin.dashboard.custom_section["m"] = {
      description = { "  Marks              " },
      command = "Telescope marks",
    }
  end

  -- whichkey
  -- ========
  lvim.builtin.which_key.setup.window.winblend = 10
  lvim.builtin.which_key.setup.window.border = "none"
  lvim.builtin.which_key.setup.window.padding = { 0, 0, 0,0 }
  lvim.builtin.which_key.setup.layout.spacing = 3
  lvim.builtin.which_key.setup.layout.height = { min = 1, max = 10}
  lvim.builtin.which_key.setup.ignore_missing = true
  lvim.builtin.which_key.ignore_missing = false

  lvim.builtin.which_key.on_config_done = function(wk)
    local keys = {
      ["ga"] = { "<cmd>lua require('user.configurations.telescope').code_actions()<CR>", "Code Action" },
      ["gR"] = { "<cmd>Trouble lsp_references<CR>", "Goto References" },
      ["gI"] = { "<cmd>lua require('user.configurations.telescope').lsp_implementations()<CR>", "Goto Implementation" },
    }
    wk.register(keys, { mode = "n" })
  end

  -- Project
  -- =======
  lvim.builtin.project.active = true
end

return M
