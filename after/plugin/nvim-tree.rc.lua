local status, nvimtree = pcall(require, 'nvim-tree')
if (not status) then return end

local config_status, nvim_tree_config =  pcall(require, 'nvim-tree.config')
if (not config_status) then return end

local tree_callback = nvim_tree_config.nvim_tree_callback

nvimtree.setup{
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
    root_folder_modifier = ":t",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 30,
    side = "left",
    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, cb =tree_callback "edit" },
        { key = "h", cb = tree_callback   "close_node" },
        { key = "v", cb = tree_callback "vsplit" },
      },
    },
  },
  filters = {
    dotfiles = false,
  },
}
