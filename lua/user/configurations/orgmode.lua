local M = {}

M.setup = function()
  local status_ok, org_mode = pcall(require, "orgmode")
  if not status_ok then
    return
  end
  org_mode.setup {
    org_agenda_files = { "~/code/gitea/orgs/**/*" },
    org_default_notes_file = "~/code/gitea/orgs/refile.org",
    org_agenda_templates = {
      T = {
        description = "Todo",
        template = "* TODO %?\n  DEADLINE: %T",
        target = "~/code/gitea/orgs/todos.org",
      },
      w = {
        description = "Work todo",
        template = "* TODO %?\n  DEADLINE: %T",
        target = "~/code/gitea/orgs/work.org",
      },
    },
    mappings = {
      global = {
        org_agenda = "go",
        org_capture = "gC",
      },
    },
  }
end

return M
