return {
  {
    "nyoom-engineering/oxocarbon.nvim",
    config = function()
      vim.opt.background = "dark"
      vim.cmd "colorscheme oxocarbon"
    end
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false }
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require "configs.autopairs"
    end
  },
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    versions = "1.*",
    opts = {
      keymap = { preset = "default" },
      completion = { documentation = { auto_show = false } },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_exteneded = { "sources.default" }
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    config = function()
      require "configs.lspconfig"
    end,
  },
  { -- Collection of various small independent plugins/modules
    "echasnovski/mini.nvim",
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci"  - [C]hange [I]nside ["]quote
      require("mini.ai").setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd"   - [S]urround [D]elete ["]quotes
      -- - sr)"  - [S]urround [R]eplace [)] ["]
      require("mini.surround").setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don"t like it,
      --  and try some other statusline plugin
      local statusline = require "mini.statusline"
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return "%2l:%-2v"
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
