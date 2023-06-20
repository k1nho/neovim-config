local keymap = vim.keymap
keymap.set('n', 'x', '"_x') -- avoid x yank

-- use jk instead of esc to escape insert mode
keymap.set('i', 'jk', '<Esc>')
keymap.set('n', '+', '<C-a>') -- increment
keymap.set('n', '-', '<C-x>') -- decrement

keymap.set('n', 'dw', 'vb"_d') -- delete a word backward
keymap.set('n', 'J', "mzJ`z") -- when moving a below line upwards maintain cursor position
keymap.set('x', ';p', "\"_dP") -- keep previous buffer when pasting over a word
keymap.set('n', ";s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>") --quick replace word

--tabs
keymap.set('n', 'te', ':tabedit<Return>', { silent = true }) --open a neovim tab
keymap.set('n', 'ss', ':silent !tmux split-window -v -c "#{pane_current_path}" "zsh"<CR>', { silent = true }) -- split window horizontal
keymap.set('n', 'sv', ':silent !tmux split-window -h -c "#{pane_current_path}" "zsh"<CR>', { silent = true }) -- split window vertical

-- tab navigation (up, down, left, right)
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 's<up>', '<C-w>k')
keymap.set('', 's<down>', '<C-w>j')
keymap.set('', 's<right>', '<C-w>l')
keymap.set('', 's<left>', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')
keymap.set('', 'sh', '<C-w>h')

-- tab resize (up, down, left, right)
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')

-- Vertical movement with center alignment
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')
keymap.set('n', 'n', 'nzz')
keymap.set('n', '<C-u>', '<C-u>zz')

-- Move when highlighted
keymap.set('v', 'J', ":m '>+1<cr>gv=gv")
keymap.set('v', 'K', ":m '<-2<cr>gv=gv")

-- Harpoon
keymap.set('n', '<space>q', ':lua require("harpoon.ui").toggle_quick_menu()<cr>')
keymap.set('n', '<space>w', ':lua require("harpoon.mark").add_file()<cr>')
keymap.set('n', '<space>1', ':lua require("harpoon.ui").nav_file(1)<cr>')
keymap.set('n', '<space>2', ':lua require("harpoon.ui").nav_file(2)<cr>')
keymap.set('n', '<space>3', ':lua require("harpoon.ui").nav_file(3)<cr>')
keymap.set('n', '<space>4', ':lua require("harpoon.ui").nav_file(4)<cr>')
keymap.set('n', '<space>5', ':lua require("harpoon.ui").nav_file(5)<cr>')
keymap.set('n', '<space>6', ':lua require("harpoon.ui").nav_file(6)<cr>')
keymap.set('n', '<space>7', ':lua require("harpoon.ui").nav_file(7)<cr>')
keymap.set('n', '<space>8', ':lua require("harpoon.ui").nav_file(8)<cr>')
keymap.set('n', '<space>9', ':lua require("harpoon.ui").nav_file(9)<cr>')

-- Comment Line command (TS, JS, C++, Go)
keymap.set('n', '<C-l>', 'I//<Esc>')
-- Uncomment Line command 
keymap.set('n', 'm', 'I<Esc>xx')

keymap.set('n', '<space>b', ':NvimTreeToggle<cr>', {silent = true}) -- Open sidebar tree explorer
keymap.set('n', '<space>l', ':lua _LAZYGIT_TOGGLE()<cr>', {silent = true}) --Open lazygit command
