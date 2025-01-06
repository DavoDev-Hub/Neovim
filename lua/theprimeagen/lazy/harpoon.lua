return {
    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" }, -- Asegúrate de incluir plenary.nvim como dependencia
        config = function()
            local harpoon = require("harpoon")
            local harpoon_ui = require("harpoon.ui")
            local harpoon_mark = require("harpoon.mark")

            -- Configuración inicial
            harpoon.setup()

            -- Mapas de teclas
            vim.keymap.set("n", "<leader>a", harpoon_mark.add_file, { desc = "Add file to Harpoon" })
            vim.keymap.set("n", "<C-e>", harpoon_ui.toggle_quick_menu, { desc = "Toggle Harpoon menu" })
            vim.keymap.set("n", "<C-h>", function() harpoon_ui.nav_file(1) end, { desc = "Navigate to file 1" })
            vim.keymap.set("n", "<C-t>", function() harpoon_ui.nav_file(2) end, { desc = "Navigate to file 2" })
            vim.keymap.set("n", "<C-n>", function() harpoon_ui.nav_file(3) end, { desc = "Navigate to file 3" })
            vim.keymap.set("n", "<C-s>", function() harpoon_ui.nav_file(4) end, { desc = "Navigate to file 4" })
        end,
    }
}

