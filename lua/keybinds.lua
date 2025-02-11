-- Remove all default keys: This is the heressy part.

local keys = {
    "a",
    "b",
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    -- "i", We still wan't to f with insert mode
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z",

    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
}

vim.api.nvim_feedkeys("i", "n", false) -- Start in insert mode
vim.keymap.set("i", "<C-S-k>", "<cmd>:norm! dd<cr>") -- Delete whole line
vim.keymap.set("i", "<C-/>", "<cmd>:norm gcc<cr>") -- Comment & Uncomment
vim.keymap.set("i", "<C-p>", "<cmd>:Telescope find_files<cr>") -- Find file
vim.keymap.set("i", "<C-c>", "<cmd>:norm! *yy<cr>") -- Copy whole line
vim.keymap.set("i", "<C-v>", '<C-r>=system("xclip -o -sel -c")<cr>') -- Paste copied, from OS
vim.keymap.set("i", "<A-Down>", "<cmd>:norm! ddp<cr>")
vim.keymap.set("i", "<A-Up>", "<cmd>:norm! ddkP<cr>")

vim.keymap.set("i", "<C-s>", "<cmd>:w!<cr>")
vim.keymap.set("i", "<C-S-q>", "<cmd>:q<cr>")

-- Support for multiple cursors

-- vim.keymap.set("i", "<A-S-Up>", "<cmd>:MCstart<cr>")
-- vim.keymap.set("i", "<A-S-Up>", function() mc.lineAddCursor(-1) end)
-- vim.keymap.set("i", "<A-S-Up>", function() mc.lineAddCursor(-1) end)
-- vim.keymap.set("i", "<A-S-Up>", function() mc.lineAddCursor(-1) end)
-- vim.keymap.set("i", "<A-S-Up>", function() mc.lineAddCursor(-1) end)
-- vim.keymap.set("i", "<A-S-Up>", function() mc.lineAddCursor(-1) end)


vim.keymap.set("v", "<BS>", "d") -- Delete selected
-- I couldn't manage to do Copy to OS, you'll have to use the filthy <C-S-v> (Control + Shift + V) 

for i = 1, #keys do
    vim.keymap.set("n", keys[i], "i") -- Every key in normal mode leads to insert.
    -- It's like hell, every path leads to pain

    -- We could also unbind the keys in the other modes, but it's a little bit
    -- pointless, as only get to those modes in controlled scenarios. You may
    -- think you have freedom, but it's a mere ilusion
end