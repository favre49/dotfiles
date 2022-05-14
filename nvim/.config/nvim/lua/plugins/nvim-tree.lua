local tree = require 'nvim-tree'

tree.setup({
  hijack_netrw = true,
  view = {
    number = true,
    relativenumber = true,
    mappings = {
      list = {
        { key = {"o", "<CR>"}, action = "edit_in_place" },
        -- NOTE: override the "split" to avoid treating nvim-tree
        -- window as special. Splits will appear as if nvim-tree was a
        -- regular window
        {
          key = "<C-v>",
          action = "split_right",
          action_cb = function(node)
            vim.cmd("vsplit " .. vim.fn.fnameescape(node.absolute_path))
          end,
        },
        {
          key = "<C-x>",
          action = "split_bottom",
          action_cb = function(node)
            vim.cmd("split " .. vim.fn.fnameescape(node.absolute_path))
          end,
        },
        -- NOTE: override the "open in new tab" mapping to fix the error
        -- that occurs there
        {
          key = "<C-t>",
          action = "new_tab",
          action_cb = function(node)
            vim.cmd("tabnew " .. vim.fn.fnameescape(node.absolute_path))
          end,
        },
      }
    }
  },
  actions = {
    change_dir = {
      enable = false,
    },
    open_file = {
      quit_on_open = true,
    },
  }
})

