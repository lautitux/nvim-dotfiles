return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-lua/plenary.nvim",
--    {
--      "nvim-telescope/telescope-fzf-native.nvim",
--      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release"
--    }
  },
  config = function()
    local telescope = require "telescope"
    telescope.setup {
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_model = "smart_case"
        }
      }
    }
    local builtin = require "telescope.builtin"
    local previewers = require "telescope.previewers"
    vim.keymap.set("n", "<leader>f", builtin.find_files, { silent = true })
    vim.keymap.set("n", "<leader>g", builtin.live_grep, { silent = true })
    vim.keymap.set("n", "<leader>r", ":Telescope oldfiles<CR>", { silent = true })
    vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "Telescope help tags" })
    vim.keymap.set("n", "<leader>c", builtin.commands, { desc = "List commands" })
    -- vim.keymap.set("n", "<leader>co", builtin.colorscheme, { desc = "Choose colorscheme" })
    vim.keymap.set("n", "<leader>lt", builtin.treesitter, { desc = "List variables" })
    
 --   telescope.load_extension "fzf"
    telescope.load_extension "ui-select"
  end
}
