data:extend({
    {
        type = "technology",
        name = "plutonium-ammo",
        icon = "__PlutoniumEnergy__/graphics/technology/plutonium-ammo.png",
        icon_size = 128,
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
        prerequisites = {"plutonium-nuclear-power", "uranium-ammo"},
        unit = {
            count = 1250,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"military-science-pack", 1},
                {"utility-science-pack", 1}
            },
            time = 50
        },
        order = "e-a-c"
    },
    {
        type = "technology",
        name = "plutonium-atomic-bomb",
        icon_size = 128,
        icon = "__PlutoniumEnergy__/graphics/technology/plutonium-atomic-bomb.png",
        effects = {
            {
                type = "unlock-recipe",
                recipe = "plutonium-atomic-bomb"
            }
        },
        prerequisites = {"plutonium-nuclear-power", "atomic-bomb"},
        unit = {
            count = 6000,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"military-science-pack", 1},
                {"production-science-pack", 1},
                {"utility-science-pack", 1}
            },
            time = 60
        },
        order = "e-a-c"
    }
})

if mods["AtomicArtillery"] then
    table.insert(data.raw["technology"]["plutonium-ammo"].effects, {type = "unlock-recipe", recipe = "plutonium-atomic-artillery-shell"})
end
