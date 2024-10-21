local IR3 = mods["IndustrialRevolution3"]

if settings.startup['enable-plutonium-ammo'].value then
    data:extend({
        {
            type = "recipe",
            name = "plutonium-rounds-magazine",
            enabled = false,
            energy_required = 10,
            ingredients = IR3 and
                {
                    { type = "item", name = "chromium-magazine", amount = 1 },
                    { type = "item", name = "lead-plate",        amount = 2 },
                    { type = "item", name = "plutonium-238",     amount = 1 }
                }
                or
                {
                    { type = "item", name = "piercing-rounds-magazine", amount = 1 },
                    { type = "item", name = "plutonium-238",            amount = 1 }
                },
            results = { { type = "item", name = "plutonium-rounds-magazine", amount = 1 } }
        },
        {
            type = "recipe",
            name = "plutonium-cannon-shell",
            enabled = false,
            energy_required = 10,
            ingredients = IR3 and
                {
                    { type = "item", name = "cannon-shell",  amount = 1 },
                    { type = "item", name = "lead-plate",    amount = 4 },
                    { type = "item", name = "plutonium-238", amount = 1 }
                }
                or
                {
                    { type = "item", name = "cannon-shell",  amount = 1 },
                    { type = "item", name = "plutonium-238", amount = 1 }
                },
            results = { { type = "item", name = "plutonium-cannon-shell", amount = 1 } }
        },
        {
            type = "recipe",
            name = "explosive-plutonium-cannon-shell",
            enabled = false,
            energy_required = 10,
            ingredients = IR3 and
                {
                    { type = "item", name = "explosive-cannon-shell", amount = 1 },
                    { type = "item", name = "lead-plate",             amount = 4 },
                    { type = "item", name = "plutonium-238",          amount = 1 }
                }
                or
                {
                    { type = "item", name = "explosive-cannon-shell", amount = 1 },
                    { type = "item", name = "plutonium-238",          amount = 1 }
                },
            results = { { type = "item", name = "explosive-plutonium-cannon-shell", amount = 1 } }
        },
    })
end

data:extend({
    {
        type = "recipe",
        name = "plutonium-atomic-artillery-shell",
        enabled = false,
        energy_required = 50,
        ingredients = {
            { type = "item", name = "processing-unit", amount = 10 },
            { type = "item", name = "radar",           amount = 1 },
            { type = "item", name = "explosives",      amount = 30 },
            { type = "item", name = "plutonium-239",   amount = 35 },
            { type = "item", name = "steel-plate",     amount = 15 }
        },
        results = { { type = "item", name = "plutonium-atomic-artillery-shell", amount = 1 } }
    }
})
