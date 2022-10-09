local Remap = require("remap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap


nnoremap("<leader>j", ":m .+1<CR>==")
nnoremap("<leader>k", ":m -2<CR>==")

inoremap("<leader>j", "<Esc>:m .+1<CR>==gi")
inoremap("<leader>k", "<Esc>:m .-2<CR>==gi")

vnoremap("<leader>j", ":m '>+1<CR>gv=gv")
vnoremap("<leader>k", ":m '<-2<CR>gv=gv")

-- No Remap for Arrow Keys
inoremap("<ScrollWheelUp>", "<Nop>")
inoremap("<ScrollWheelDown>", "<Nop>")
nnoremap("<Left>", ":echoe \"Use h\"<CR>")
nnoremap("<Right>", ":echoe \"Use l\"<CR>")
nnoremap("<Up>", ":echoe \"Use k\"<CR>")
nnoremap("<Down>", ":echoe \"Use j\"<CR>")

-- Better Split navigation

nnoremap("<C-J>", "<C-W><C-J>")
nnoremap("<C-K>", "<C-W><C-K>")
nnoremap("<C-L>", "<C-W><C-L>")
nnoremap("<C-H>", "<C-W><C-H>")