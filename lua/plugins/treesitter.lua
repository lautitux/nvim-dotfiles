return {
  "nvim-treesitter/nvim-treesitter",
  build = "TSUpdate",
  config = function()
    local treesitter = require "nvim-treesitter.configs"
    treesitter.setup {
      ensure_installed = {
        "vimdoc", "c", "cpp", "lua", "rust",
        "typst", "python", "dart", "haskell",
      },
      sync_install = false,
      auto_install = true,
      indent = { enable = true },
      highlight = {
        enable = true,
        disable = function(lang, buf)
          local max_file_size = 100 * 1024 -- 100 KiB
          local ok, stat = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stat and stat.size > max_file_size then
            vim.notify(
              "File larger than "..tostring(max_file_size / 1024).."KiB treesitter disabled for performance.",
              vim.log.levels.WARN,
              { title = "Treesitter" }
            )
            return true
          end
          return false
        end
      }
    }
  end
}
