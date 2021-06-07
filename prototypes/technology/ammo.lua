if settings.startup['enable-plutonium-ammo'].value then
    if mods["IndustrialRevolution"] then
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
                    prerequisites = {"plutonium-processing", "uranium-ammo"},
                    unit = {
                        count = 2000,
                        ingredients = {
                            {"automation-science-pack", 1},
                            {"logistic-science-pack", 1},
                            {"chemical-science-pack", 1},
                            {"military-science-pack", 1},
                            {"utility-science-pack", 1}
                        },
                        time = 60
                    },
                    order = "e-a-c"
                }
            })
        --atomic bombs are replaced by artillery shells in IR2
        data:extend({
                {
                    type = "technology",
                    name = "plutonium-atomic-bomb",
                    icon_size = 128,
                    icon = "__PlutoniumEnergy__/graphics/technology/plutonium-atomic-bomb.png",
                    effects = {
                        {
                            type = "unlock-recipe",
                            recipe = "plutonium-atomic-artillery-shell"
                        }
                    },
                    prerequisites = {"plutonium-enrichment-process", "atomic-bomb"},
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
    else
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
                    prerequisites = {"plutonium-processing", "uranium-ammo"},
                    unit = {
                        count = 1250,
                        ingredients = {
                            {"automation-science-pack", 1},
                            {"logistic-science-pack", 1},
                            {"chemical-science-pack", 1},
                            {"military-science-pack", 1}
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
                    prerequisites = {"plutonium-enrichment-process", "atomic-bomb"},
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
    end
end
if mods['bobwarfare'] then
    table.insert(data.raw['technology']['bob-atomic-artillery-shell'].effects, {type = 'unlock-recipe', recipe = 'plutonium-atomic-artillery-shell'})
elseif mods["AtomicArtillery"] then
    table.insert(data.raw["technology"]["plutonium-ammo"].effects, {type = "unlock-recipe", recipe = "plutonium-atomic-artillery-shell"})
end
if mods['SchallArtillery'] then
    table.insert(data.raw['technology']['Schall-artillery-shell-2'].effects, {type = 'unlock-recipe', recipe = 'Schall-plutonium-atomic-artillery-shell'})
end
