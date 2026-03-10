local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc }) -- логика блять 
end

-- навигация по окнам 
map("n", "<A-Left>", "<C-w>h", "окно влево")
map("n", "<A-Right>", "<C-w>l", "окно вправо")
map("n", "<A-Down>", "<C-w>j", "окно вниз")
map("n", "<A-Up>", "<C-w>k", "окно вверх")

-- буферы
map("n", "<S-l>", ":bnext<CR>",     "следующий буфер")
map("n", "<S-h>", ":bprevious<CR>", "предыдущий буфер")
map("n", "<leader>x", ":bdelete<CR>", "закрыть буфер")

-- файловое дерево
map("n", "<leader>e", ":NvimTreeToggle<CR>", "файловое дерево")

-- телескоп
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>",  "найти файл")
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>",   "поиск по тексту")
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>",     "открытые буферы")

-- разное
map("n", "<leader>w", ":w<CR>",  "сохранить")
map("n", "<leader>q", ":q<CR>",  "закрыть")
map("v", "<",  "<gv", "отступ влево (держит выделение)")
map("v", ">",  ">gv", "отступ вправо (держит выделение)")
