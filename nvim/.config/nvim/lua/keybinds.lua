local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Clear search highlighting
map('n','<leader><space>', ':noh<cr>', default_opts)

-- Strip all trailing whitespaces
map('n', '<leader>W', [[:%s/\s\+$//<cr>:let@/=''<cr>]], default_opts)

-- Better searching
map('n', '/', '/\\v', { noremap = true })

-- Nvim-Tree keybinds
function NvimTreeVinegarToggle()
  local view = require 'nvim-tree.view'
  if view.is_visible() then
    view.close()
  else
    require 'nvim-tree'.open_replacing_current_buffer()
  end
end

map('n', '<leader>t', ':lua NvimTreeVinegarToggle()<cr>', default_opts)

-- Better splits
map('n', 'ss',':split<cr><C-w>w', default_opts)
map('n', 'sv',':vsplit<cr><C-w>w', default_opts)
map('n', 'sh','<C-w>h', default_opts)
map('n', 'sj','<C-w>j', default_opts)
map('n', 'sk','<C-w>k', default_opts)
map('n', 'sl','<C-w>l', default_opts)

-- Better tabbing
map('n', '<Tab>', ':tabnext<cr>', default_opts)
map('n', '<S-Tab>', ':tabprev<cr>', default_opts)

-- Unmap help and Ex mode
map('n','Q','<Nop>', default_opts)
map('n','<F1>','<Nop>', default_opts)
map('i','<F1>','<Nop>', default_opts)

-- Competitive related mappings
pwd = vim.loop.cwd()
compete_dir = vim.env.COMPETE
if (compete_dir ~= nil and string.match(pwd,compete_dir)) then
  local map = vim.api.nvim_set_keymap
  map('n', '<leader>m', ':!make problem_name=%< <CR>', { noremap = true})
  map('n', '<leader>d', ':!make run problem_name=%< <CR>', { noremap = true })
  map('n', '<leader>r', ':!make test problem_name=%< <CR>', { noremap = true })
end
