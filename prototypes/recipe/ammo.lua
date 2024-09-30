local ammo_recipes = {}

if #ammo_recipes > 0 then data:extend(ammo_recipes) end

if settings.startup['enable-plutonium-ammo'].value then
    if mods["IndustrialRevolution3"] then
        --adds lead plates to the ammo recipes
        data:extend({
            {
                type = "recipe",
                name = "plutonium-rounds-magazine",
                enabled = false,
                energy_required = 10,
                ingredients = {
                    { "chromium-magazine", 1 },
                    { "lead-plate",        2 },
                    { "plutonium-238",     1 }
                },
                result = "plutonium-rounds-magazine"
            },
            {
                type = "recipe",
                name = "plutonium-cannon-shell",
                enabled = false,
                energy_required = 10,
                ingredients = {
                    { "cannon-shell",  1 },
                    { "lead-plate",    4 },
                    { "plutonium-238", 1 }
                },
                result = "plutonium-cannon-shell"
            },
            {
                type = "recipe",
                name = "explosive-plutonium-cannon-shell",
                enabled = false,
                energy_required = 10,
                ingredients = {
                    { "explosive-cannon-shell", 1 },
                    { "lead-plate",             4 },
                    { "plutonium-238",          1 }
                },
                result = "explosive-plutonium-cannon-shell"
            },
        })
    else
        data:extend({
            -- Ammo
            {
                type = "recipe",
                name = "plutonium-rounds-magazine",
                enabled = false,
                energy_required = 10,
                ingredients = {
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
                ingredients = {
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
                ingredients = {
                    { "explosive-cannon-shell", 1 },
                    { "plutonium-238",          1 }
                },
                result = "explosive-plutonium-cannon-shell"
            }
        })
    end
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
