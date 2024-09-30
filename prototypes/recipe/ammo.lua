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
                    { "chromium-magazine", 1 },
                    { "lead-plate",        2 },
                    { "plutonium-238",     1 }
                }
                or
                {
                    { "piercing-rounds-magazine", 1 },
                    { "plutonium-238",            1 }
                },
            result = "plutonium-rounds-magazine"
        },
        {
            type = "recipe",
            name = "plutonium-cannon-shell",
            enabled = false,
            energy_required = 10,
            ingredients = IR3 and
                {
                    { "cannon-shell",  1 },
                    { "lead-plate",    4 },
                    { "plutonium-238", 1 }
                }
                or
                {
                    { "cannon-shell",  1 },
                    { "plutonium-238", 1 }
                },
            result = "plutonium-cannon-shell"
        },
        {
            type = "recipe",
            name = "explosive-plutonium-cannon-shell",
            enabled = false,
            energy_required = 10,
            ingredients = IR3 and
                {
                    { "explosive-cannon-shell", 1 },
                    { "lead-plate",             4 },
                    { "plutonium-238",          1 }
                }
                or
                {
                    { "explosive-cannon-shell", 1 },
                    { "plutonium-238",          1 }
                },
            result = "explosive-plutonium-cannon-shell"
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
            { "rocket-control-unit", 10 },
            { "radar",               1 },
            { "explosives",          30 },
            { "plutonium-239",       35 },
            { "steel-plate",         15 }
        },
        result = "plutonium-atomic-artillery-shell"
    }
})
