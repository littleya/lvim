
local M = {}

M.config = function()
  local present, alpha = pcall(require, "alpha")
  if not present then
    return
  end

  local header = {
    type = "text",
    val = require("user.configurations.banners").dashboard(),
    opts = {
      position = "center",
      hl = "Comment",
    },
  }

  local handle = io.popen 'fd -d 2 . $HOME"/.local/share/lunarvim/site/pack/packer" | grep pack | wc -l | tr -d "\n" '
  local plugins = handle:read "*a"
  handle:close()

  local thingy = io.popen 'echo "$(date +%a) $(date +%d) $(date +%b)" | tr -d "\n"'
  local date = thingy:read "*a"
  thingy:close()
  plugins = plugins:gsub("^%s*(.-)%s*$", "%1")

  local plugin_count = {
    type = "text",
    val = "└─   " .. plugins .. " plugins in total ─┘",
    opts = {
      position = "center",
      hl = "String",
    },
  }

  local heading = {
    type = "text",
    val = "┌─   Today is " .. date .. " ─┐",
    opts = {
      position = "center",
      hl = "String",
    },
  }

  local fortune = require "alpha.fortune"()
  -- fortune = fortune:gsub("^%s+", ""):gsub("%s+$", "")
  local footer = {
    type = "text",
    val = fortune,
    opts = {
      position = "center",
      hl = "Comment",
      hl_shortcut = "Comment",
    },
  }

  local function button(sc, txt, keybind)
    local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

    local opts = {
      position = "center",
      text = txt,
      shortcut = sc,
      cursor = 5,
      width = 24,
      align_shortcut = "right",
      hl_shortcut = "Number",
      hl = "Function",
    }
    if keybind then
      opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
    end

    return {
      type = "button",
      val = txt,
      on_press = function()
        local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
        vim.api.nvim_feedkeys(key, "normal", false)
      end,
      opts = opts,
    }
  end

  local buttons = {
    type = "group",
    val = {
      button("f", "   Explore", ":Telescope find_files<CR>"),
      button("e", "   New file", ":ene <BAR> startinsert <CR>"),
      button("s", "   Ripgrep", ":Telescope live_grep<CR>"),
      button("r", "   Recents", ":Telescope oldfiles<CR>"),
      button("b", "   Buffers", ":Telescope buffers<CR>"),
      button("o", "   Options", ":e ~/.config/lvim/config.lua | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    },
    opts = {
      spacing = 1,
    },
  }

  local section = {
    header = header,
    buttons = buttons,
    plugin_count = plugin_count,
    heading = heading,
    footer = footer,
  }

  local opts = {
    layout = {
      { type = "padding", val = 1 },
      section.header,
      { type = "padding", val = 2 },
      section.heading,
      section.plugin_count,
      { type = "padding", val = 1 },
      -- section.top_bar,
      section.buttons,
      -- section.bot_bar,
      -- { type = "padding", val = 1 },
      section.footer,
    },
    opts = {
      margin = 5,
    },
  }
  alpha.setup(opts)
end

return M
