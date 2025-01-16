return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",

  dependencies = { "rafamadriz/friendly-snippets" },

  config = function()
    local ls = require("luasnip")
    ls.filetype_extend("javascript", { "jsdoc" })

    -- TODO: What is expand?
    vim.keymap.set({ "i", "s" }, "<C-s>e", function() ls.expand() end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-s>s", function() ls.jump(1) end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-s>S", function() ls.jump(-1) end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-s>E", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })

    local s = ls.snippet
    local i = ls.insert_node
    local t = ls.text_node
    local fmt = require("luasnip.extras.fmt").fmt
    local rep = require("luasnip.extras").rep

    -- Snippet dinámico para etiquetas HTML
    ls.add_snippets("html", {
      s("tag", fmt("<{}>{}</{}>", {
        i(1, "tag"), -- Inserta la etiqueta (por ejemplo, h1, div)
        i(2, ""),    -- Inserta el contenido dentro de la etiqueta
        rep(1),      -- Repite la etiqueta de apertura como cierre
      })),
    })

    -- Snippet para un documento HTML completo
    ls.add_snippets("html", {
      s("html", {
        t({
          "<!DOCTYPE html>",
          "<html lang=\"en\">",
          "<head>",
          "  <meta charset=\"UTF-8\">",
          "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">",
          "  <title>Document</title>",
          "</head>",
          "<body>",
          "</body>",
          "</html>",
        }),
      }),
    })
  end,
}

