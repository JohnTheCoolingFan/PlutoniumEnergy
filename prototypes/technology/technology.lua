require("prototypes.technology.ammo")

data:extend({
    {
        type = "technology",
        name = "plutonium-processing",
        icon = "__PlutoniumEnergy__/graphics/technology/plutonium-processing.png",
        icon_size = 256,
        icon_mipmaps = 4,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "advanced-nuclear-fuel-reprocessing"
            },
            {
                type = "unlock-recipe",
                recipe = "advanced-nuclear-fuel-reprocessing-with-barrelling"
            },
            {
                type = 'unlock-recipe',
                recipe = 'used-up-uranium-fuel-cell-solution-centrifuging'
            }
        },
        prerequisites = { "uranium-processing", "nuclear-fuel-reprocessing", "fluid-handling" },
        unit = {
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack",   1 },
                { "chemical-science-pack",   1 },
                { "production-science-pack", 1 }
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
        icon_size = 256,
        icon_mipmaps = 4,
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
        prerequisites = { "plutonium-processing" },
        unit = {
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack",   1 },
                { "chemical-science-pack",   1 },
                { "production-science-pack", 1 }
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
        icon_size = 256,
        icon_mipmaps = 4,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "MOX-fuel-reprocessing"
            },
        },
        prerequisites = { "plutonium-nuclear-power" },
        unit = {
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack",   1 },
                { "chemical-science-pack",   1 },
                { "production-science-pack", 1 }
            },
            time = 30,
            count = 200
        },
        order = "e-p-b-d"
    },
    {
        type = "technology",
        name = "plutonium-enrichment-process",
        icon_size = 256,
        icon_mipmaps = 4,
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
        prerequisites = { "plutonium-processing", "kovarex-enrichment-process" },
        unit = {
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack",   1 },
                { "chemical-science-pack",   1 },
                { "production-science-pack", 1 }
            },
            time = 30,
            count = 2000
        },
        order = "e-p-b-d"
    },
    {
        type = 'technology',
        name = 'nuclear-breeding',
        icon_size = 256,
        icon_mipmaps = 4,
        icon = '__PlutoniumEnergy__/graphics/technology/nuclear-breeding.png',
        effects = {
            {
                type = 'unlock-recipe',
                recipe = 'breeder-reactor'
            },
            {
                type = 'unlock-recipe',
                recipe = 'breeder-fuel-cell'
            },
            {
                type = 'unlock-recipe',
                recipe = 'breeder-fuel-cell-reprocessing'
            }
        },
        prerequisites = { 'plutonium-processing', 'kovarex-enrichment-process' },
        unit = {
            ingredients = {
                { 'automation-science-pack', 1 },
                { 'logistic-science-pack',   1 },
                { 'chemical-science-pack',   1 },
                { 'production-science-pack', 1 }
            },
            -- TODO: adjust balance
            time = 30,
            count = 1000
        },
        order = 'e-p-d-b'
    },
    {
        type = 'technology',
        name = 'breeder-fuel-cell-from-uranium-cell',
        icon_size = 256,
        icon_mipmaps = 4,
        icon = '__PlutoniumEnergy__/graphics/technology/breeder-fuel-cell-from-uranium-cell.png',
        effects = {
            {
                type = 'unlock-recipe',
                recipe = 'breeder-fuel-cell-from-uranium-cell'
            }
        },
        prerequisites = { 'nuclear-breeding', 'nuclear-fuel-reprocessing' },
        unit = {
            ingredients = {
                { 'automation-science-pack', 1 },
                { 'logistic-science-pack',   1 },
                { 'chemical-science-pack',   1 },
                { 'production-science-pack', 1 }
            },
            time = 30,
            count = 500
        },
        order = 'e-p-d-b'
    },
    {
        type = 'technology',
        name = 'breeder-fuel-cell-from-MOX-fuel',
        icon_size = 256,
        icon_mipmaps = 4,
        icon = '__PlutoniumEnergy__/graphics/technology/breeder-fuel-cell-from-MOX-fuel.png',
        effects = {
            {
                type = 'unlock-recipe',
                recipe = 'breeder-fuel-cell-from-MOX-fuel'
            }
        },
        prerequisites = { 'nuclear-breeding', 'MOX-fuel-reprocessing' },
        unit = {
            ingredients = {
                { 'automation-science-pack', 1 },
                { 'logistic-science-pack',   1 },
                { 'chemical-science-pack',   1 },
                { 'production-science-pack', 1 }
            },
            time = 30,
            count = 500
        },
        order = 'e-p-d-b'
    }
})
if settings.startup['PE-disable-MOX-reactor'].value then data.raw['technology']['plutonium-nuclear-power'].effects[2] = nil end
