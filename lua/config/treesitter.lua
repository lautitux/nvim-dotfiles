local treesitter = require "nvim-treesitter"

treesitter.setup {}

treesitter.install {
  "rust", "javascript", "zig",
  "c", "cpp", "c3", "haskell",
  "python",
}

vim.treesitter.start()
