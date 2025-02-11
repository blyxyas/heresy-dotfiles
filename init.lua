require("keybinds")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.clipboard="unnamedplus" -- We need xclip, make sure to have xclip
vim.opt.keymodel="startsel,stopsel"

vim.wo.number = true

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {
  	'mrcjkb/rustaceanvim',
  	version = '^5',
  	lazy = false,
    },
    {
      'numToStr/Comment.nvim',
      opts = {
        -- options, empty for now
      }
    },
    {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.8",
      dependencies = { "nvim-lua/plenary.nvim" }
    },
    -- {
    --   "nvim-neo-tree/neo-tree.nvim",
    --   branch = "v3.x",
    --   dependencies = {
    --     "nvim-lua/plenary.nvim",
    --     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    --     "MunifTanjim/nui.nvim",
    --     -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    --   }
    -- },
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
          ensure_installed = { "c", "rust", "javascript", "html", "css", "bash", "diff", "json", "markdown", "markdown_inline", "toml", "typescript" },
          highlight = { enable = true },
          indent = { enable = true },
          sync_install = true
        })
      end
    }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
