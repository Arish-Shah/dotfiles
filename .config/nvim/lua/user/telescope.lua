local opts = { noremap=true, silent=true }
local map = vim.keymap.set

local status_ok, utils = pcall(require, "telescope.utils")
if not status_ok then
  vim.notify("telescope.utils not found!")
end

local status_ok, builtin = pcall(require, "telescope.builtin")
if not status_ok then
  vim.notify("telescope.builtin not found!")
end

local project_files = function()
    local _, ret, _ = utils.get_os_command_output({ "git", "rev-parse", "--is-inside-work-tree" })
    if ret == 0 then
        builtin.git_files()
    else
        builtin.find_files()
    end
end

map("n", "<leader>p", project_files, opts)
map("n", "<C-p>", builtin.oldfiles, opts)
map("n", "<C-f>", builtin.buffers, opts)
map("n", "<C-F>", builtin.live_grep, opts)
