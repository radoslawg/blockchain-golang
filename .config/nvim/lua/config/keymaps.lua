
local opts = { noremap = true, silent = true }

-- Save file without formatting
vim.keymap.set("n", "<leader>sw", "<CMD>noautocmd w<CR>", { desc = "Save file without formatting", unpack(opts) })

-- Delete single character without copying into register
vim.keymap.set("n", "x", '"_x', { desc = "Delete single character without copying into register", unpack(opts) })

vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory in Oil", unpack(opts) })

vim.keymap.set("n", "<leader>to", "<CMD>tabnew<CR>", { desc = "Open new tab", unpack(opts) })
vim.keymap.set("n", "<leader>tc", "<CMD>tabclose<CR>", { desc = "Close current tab", unpack(opts) })
vim.keymap.set("n", "<leader>tn", "<CMD>tabn<CR>", { desc = "Switch to next tab", unpack(opts) })
vim.keymap.set("n", "<leader>tp", "<CMD>tabp<CR>", { desc = "Switch to previous tab", unpack(opts) })

--Buffer Navigation
vim.keymap.set("n", "<Tab>", "<CMD>bnext<CR>", { desc = "Next buffer", unpack(opts) })
vim.keymap.set("n", "<S-Tab>", "<CMD>bprevious<CR>", { desc = "Previous buffer", unpack(opts) })
vim.keymap.set("n", "<leader>x", "<CMD>bdelete!<CR>", { desc = "Delete buffer", unpack(opts) })
vim.keymap.set("n", "<leader>b", "<CMD>enew<CR>", { desc = "New buffer", unpack(opts) })

-- Window Management
vim.keymap.set("n", "<leader>v", "<CMD>vsplit<CR>", { desc = "Vertical window split", unpack(opts) })
vim.keymap.set("n", "<leader>h", "<CMD>split<CR>", { desc = "Horizontal window split", unpack(opts) })
vim.keymap.set("n", "<leader>q", "<CMD>q<CR>", { desc = "Close window", unpack(opts) })
vim.keymap.set("n", "<leader>o", "<CMD>only<CR>", { desc = "Close other windows", unpack(opts) })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize window sizes", unpack(opts) })

-- Navigating between windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Navigate to the window on the left", unpack(opts) })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Navigate to the window below", unpack(opts) })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Navigate to the window above", unpack(opts) })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Navigate to the window on the right", unpack(opts) })

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<CMD>set wrap!<CR>", { desc = "Toggle line wrapping", unpack(opts) })

-- Stay in visual mode after shifting
vim.keymap.set("x", "<", "<gv", { desc = "Stay in visual mode after shifting", unpack(opts) })
vim.keymap.set("x", ">", ">gv", { desc = "Stay in visual mode after shifting", unpack(opts) })

-- Diagnostic navigation
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Navigate to previous diagnostic", unpack(opts) })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Navigate to next diagnostic", unpack(opts) })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open diagnostics", unpack(opts) })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Set location list", unpack(opts) })

-- Split resizing
vim.keymap.set("n", "<Right>", "<CMD>vertical resize +2<CR>", { desc = "Increase vertical split size", unpack(opts) })
vim.keymap.set("n", "<Left>", "<CMD>vertical resize -2<CR>", { desc = "Decrease vertical split size", unpack(opts) })
vim.keymap.set("n", "<Up>", "<CMD>resize +2<CR>", { desc = "Increase horizontal split size", unpack(opts) })
vim.keymap.set("n", "<Down>", "<CMD>resize -2<CR>", { desc = "Decrease horizontal split size", unpack(opts) })

