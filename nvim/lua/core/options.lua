local opt = vim.opt

-- нумерация строки
opt.number = true
opt.relativenumber = true

-- табы
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- внешний вид
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes" 
opt.scrolloff = 8
opt.wrap = false

-- поиск
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- разное
opt.swapfile = false
opt.undofile = true
opt.updatetime = 250
opt.clipboard = "unnamedplus"
