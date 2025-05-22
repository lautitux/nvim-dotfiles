return {
  {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    version = "1.*",
    opts = {},
    init = function()
      vim.keymap.set("n", "<leader>p", ":TypstPreview<CR>", { silent = true })
    end
  }
}
