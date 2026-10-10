remote.add_interface("PlutoniumEnergy", {
    milestones_preset_addons = function()
        return {
            ["Plutonium Energy"] = {
                required_mods = { "PlutoniumEnergy" },
                milestones = {
                    { type = "group",            name = "Plutonium" },
                    { type = "item",             name = "plutonium-239",                    quantity = 1 },
                    { type = "item_consumption", name = "breeder-fuel-cell",                quantity = 2 },
                    { type = "item_consumption", name = "plutonium-fuel-cell",              quantity = 1 },
                    { type = "item",             name = "plutonium-atomic-artillery-shell", quantity = 1 },
                    { type = "item_consumption", name = "MOX-fuel-cell",                    quantity = 50 },
                }
            }
        }
    end
})
