local rule = require "nvim-autopairs.rule"
local npairs = require "nvim-autopairs"

npairs.setup {}

-- Typst
npairs.add_rule(rule("$", "$"), "typ")
