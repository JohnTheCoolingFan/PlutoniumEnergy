if settings.startup['enable-plutonium-ammo'].value then
    data:extend({
        {
            type = "technology",
            name = "plutonium-ammo",
            icon = "__PlutoniumEnergy__/graphics/technology/plutonium-ammo.png",
            icon_size = 256,
            icon_mipmaps = 4,
            effects = {
                {
                    type = "unlock-recipe",
                    recipe = "plutonium-rounds-magazine"
                },
                {
                    type = "unlock-recipe",
                    recipe = "plutonium-cannon-shell"
                },
                {
                    type = "unlock-recipe",
                    recipe = "explosive-plutonium-cannon-shell"
                }
            },
            prerequisites = { "plutonium-processing", "uranium-ammo" },
            unit = {
                count = 1250,
                ingredients = {
                    { "automation-science-pack", 1 },
                    { "logistic-science-pack",   1 },
                    { "chemical-science-pack",   1 },
                    { "military-science-pack",   1 },
                    { "utility-science-pack",    1 }
                },
                time = 50
            },
            order = "e-a-c"
        }
    })
end
data:extend({
    {
        type = "technology",
        name = "plutonium-atomic-bomb",
        icon = "__PlutoniumEnergy__/graphics/technology/plutonium-atomic-bomb.png",
        icon_size = 256,
        icon_mipmaps = 4,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "plutonium-atomic-artillery-shell"
            }
        },
        prerequisites = { "nuclear-breeding", "atomic-bomb", "artillery" },
        unit = {
            count = 6000,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack",   1 },
                { "chemical-science-pack",   1 },
                { "military-science-pack",   1 },
                { "production-science-pack", 1 },
                { "utility-science-pack",    1 },
                { "space-science-pack",      1 }
            },
            time = 60
        },
        order = "e-a-c"
    }

})
