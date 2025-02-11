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


vim.api.nvim_feedkeys("i", "n", false)
vim.keymap.set("i", "<C-S-k>", "<cmd>:norm! dd<cr>") -- Delete whole line
vim.keymap.set("i", "<C-/>", "<cmd>:norm gcc<cr>") -- Comment & Uncomment
vim.keymap.set("i", "<C-p>", "<cmd>:Telescope find_files<cr>") -- Find file

for i = 1, #keys do
    vim.keymap.set("n", keys[i], "i")
end