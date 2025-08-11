return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    start_in_insert = true,
    -- sensible sizes depending on direction
    size = function(term)
      if term.direction == "horizontal" then
        return 10            -- 15 lines tall
      elseif term.direction == "vertical" then
        return math.floor(vim.o.columns * 0.3) -- 40% width
      end
    end,
  },
  keys = {
    { "<leader>tv", function() vim.cmd("1ToggleTerm direction=vertical") end,   desc = "Terminal [V]ertical)" },
    { "<leader>th", function() vim.cmd("2ToggleTerm direction=horizontal") end, desc = "Terminal [H]orizontal" },
  },
}
