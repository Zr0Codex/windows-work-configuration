local function map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { silent = true })
end

local status, telescope = pcall(require, "telescope.builtin")
if status then
  map("n", "<leader>ff", telescope.find_files)
  map("n", "<leader>fg", telescope.live_grep)
  map("n", "<leader>fb", telescope.buffers)
  map("n", "<leader>fh", telescope.help_tags)
  map("n", "<leader>fs", telescope.git_status)
  map("n", "<leader>fc", telescope.git_commits)
else
  print("Telescopt not found")
end


-- save 
map("n", "<leader>w", "<CMD>update<CR>")

-- quit
map("n", "<leader>q", "<CMD>q<CR>")

-- exit insert mode
map("i", "jj", "<ESC>")

-- Windows
map("n", "<leader>[", "<CMD>vsplit<CR>")
map("n", "<leader>]", "<CMD>split<CR>")

-- neo tree:
map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
map("n", "<leader>o", "<CMD>Neotree focus<CR>")

-- Buffer
map("n", "<TAB>", "<CMD>bnext<CR>")
map("n", "<S-TAB>", "<CMD>bprevious<CR>")

-- Terminal
map("n", "<leader>th", "<CMD>ToggleTerm size=10 direction=horizontal<CR>")
map("n", "<leader>tv", "<CMD>ToggleTerm size=80 direction=vertical<CR>")

-- markdown preview
map("n", "<leader>m", "<CMD>MarkdownPreview<CR>")
map("n", "<leader>mn", "<CMD>MarkdownPreviewStop<CR>")


-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")
