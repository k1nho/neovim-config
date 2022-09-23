local keymap = vim.keymap
keymap.set('n', 'x', '"_x') -- avoid x yank

-- use CAPS[ instead of esc to escape modes
keymap.set('i', 'jk', '<Esc>')
keymap.set('n', '+', '<C-a>') -- increment
keymap.set('n', '-', '<C-x>') -- decrement

keymap.set('n', 'dw', 'vb"_d') -- delete a word backward
keymap.set('n', '<C-a>', 'gg<S-v>G') -- select entire file

--tabs
keymap.set('n', 'te', ':tabedit<Return>', { silent = true }) --open a neovim tab
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true }) -- split window horizontal
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true }) -- split window vertical

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

-- Move text with alt in visual modeline
-- keymap.set('v', "<A-k>", ":m .-2<CR>==")
-- keymap.set('v', "<A-j>", ":m .+1<CR>==")

keymap.set('n', ';b', ':NvimTreeToggle<cr>', {silent = true}) -- Open sidebar tree explorer
keymap.set('n', ';l', ':lua _LAZYGIT_TOGGLE()<cr>', {silent = true}) --Open lazygit command
