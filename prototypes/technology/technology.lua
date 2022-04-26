require("prototypes.technology.ammo")

data:extend({
    {
        type = "technology",
        name = "plutonium-processing",
        icon_size = 128,
        icon = "__PlutoniumEnergy__/graphics/technology/plutonium-processing.png",
        effects = {
            {
                type = "unlock-recipe",
                recipe = "advanced-nuclear-fuel-reprocessing"
            },
            {
                type = 'unlock-recipe',
                recipe = 'used-up-uranium-fuel-cell-solution-centrifuging'
            }
        },
        prerequisites = {"uranium-processing", "nuclear-fuel-reprocessing", "fluid-handling"},
        unit = {
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1}
            },
            time = 30,
            count = 400
        },
        order = "e-p-b-d"
    },
    {
        type = "technology",
        name = "plutonium-nuclear-power",
        icon = "__PlutoniumEnergy__/graphics/technology/plutonium-nuclear-power.png",
        icon_size = 128,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "MOX-fuel"
            },
            {
                type = "unlock-recipe",
                recipe = "MOX-reactor"
            }
        },
        prerequisites = {"plutonium-processing"},
        unit = {
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1}
            },
            time = 35,
            count = 1000
        },
        order = "e-p-b-d"
    },
    {
        type = "technology",
        name = "MOX-fuel-reprocessing",
        icon = "__PlutoniumEnergy__/graphics/technology/MOX-fuel-reprocessing.png",
        icon_size = 128,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "MOX-fuel-reprocessing"
            },
        },
        prerequisites = {"plutonium-nuclear-power"},
        unit = {
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1}
            },
            time = 30,
            count = 200
        },
        order = "e-p-b-d"
    },
    {
        type = "technology",
        name = "plutonium-enrichment-process",
        icon_size = 256, icon_mipmaps = 4,
        icon = "__PlutoniumEnergy__/graphics/technology/plutonium-enrichment-process.png",
        effects = {
            {
                type = 'unlock-recipe',
                recipe = 'plutonium-enrichment-process'
            },
            {
                type = 'unlock-recipe',
                recipe = 'plutonium-fuel'
            }
        },
        prerequisites = {"plutonium-processing", "kovarex-enrichment-process"},
        unit = {
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1}
            },
            time = 30,
            count = 2000
        },
        order = "e-p-b-d"
    }
})
if settings.startup['PE-disable-MOX-reactor'].value then data.raw['technology']['plutonium-nuclear-power'].effects[2] = nil end
