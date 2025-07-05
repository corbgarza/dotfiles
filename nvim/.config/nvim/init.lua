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
vim.opt.rtp:prepend(lazypath)
vim.opt.relativenumber = true
vim.opt.smarttab = true
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({

spec = { {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},
{"nvim-neo-tree/neo-tree.nvim", lazy = false, dependencies = { 'MunifTanjim/nui.nvim' }},
{"norcalli/nvim-colorizer.lua", lazy = false},
{'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' }},
{'windwp/nvim-autopairs', event = "InsertEnter", config = true},
{"folke/which-key.nvim", event = "VeryLazy", keys = {{"<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Local Keymaps (which-key)"},},},
{"neovim/nvim-lspconfig", lazy = false, dependencies = {{ "ms-jpq/coq_nvim", branch = "coq" }, { "ms-jpq/coq.artifacts", branch = "artifacts" },},
  init = function()
    vim.g.coq_settings = { auto_start = true }
  end,
}

},

install = { colorscheme = { "habamax" } },
checker = { enabled = true },

})
