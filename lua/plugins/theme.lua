return {
--  {
--    "nyoom-engineering/oxocarbon.nvim",
--    config = function()
--      vim.opt.background = "dark"
--      vim.cmd "colorscheme oxocarbon"
--    end
--  },
    {
      "vague2k/vague.nvim",
      config = function()
        local vague = require "vague"
        vague.setup {
          style = { strings = "none" }
        }
        vim.opt.background = "dark"
        vim.cmd "colorscheme vague"
      end
    }
}
