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
                recipe = 'uranium-fuel-cell-waste-solution-centrifuging'
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
            count = 1000
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
                recipe = "plutonium-fuel-cell"
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
            count = 750
        },
        order = "e-p-b-d"
    },
    {
        type = "technology",
        name = "MOX-nuclear-power",
        icon = "__PlutoniumEnergy__/graphics/technology/MOX-nuclear-power.png",
        icon_size = 256,
        icon_mipmaps = 4,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "MOX-fuel-cell"
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
            count = 500
        },
        order = "e-p-b-d"
    },
    {
        type = "technology",
        name = "plutonium-reprocessing",
        icon = "__PlutoniumEnergy__/graphics/technology/plutonium-reprocessing.png",
        icon_size = 256,
        icon_mipmaps = 4,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "plutonium-fuel-cell-reprocessing"
            },
            {
                type = "unlock-recipe",
                recipe = "MOX-fuel-cell-reprocessing"
            },
        },
        prerequisites = { "plutonium-nuclear-power", "MOX-nuclear-power" },
        unit = {
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack",   1 },
                { "chemical-science-pack",   1 },
                { "production-science-pack", 1 }
            },
            time = 30,
            count = 500
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
            },
            {
                type = 'unlock-recipe',
                recipe = 'breeder-fuel-cell-reprocessing-with-barrelling'
            },
            {
                type = 'unlock-recipe',
                recipe = 'breeder-fuel-cell-waste-solution-centrifuging'
            },
            {
                type = 'unlock-recipe',
                recipe = 'plutonium-fuel'
            }
        },
        prerequisites = { 'plutonium-nuclear-power', 'kovarex-enrichment-process' },
        unit = {
            ingredients = {
                { 'automation-science-pack', 1 },
                { 'logistic-science-pack',   1 },
                { 'chemical-science-pack',   1 },
                { 'production-science-pack', 1 },
                { 'space-science-pack',      1 },
            },
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
        name = 'breeder-fuel-cell-from-MOX-fuel-cell',
        icon_size = 256,
        icon = '__PlutoniumEnergy__/graphics/technology/breeder-fuel-cell-from-MOX-fuel-cell.png',
        effects = {
            {
                type = 'unlock-recipe',
                recipe = 'breeder-fuel-cell-from-MOX-fuel-cell'
            }
        },
        prerequisites = { 'nuclear-breeding', 'plutonium-reprocessing' },
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
        type = "technology",
        name = "fission-reactor-equipment-from-plutonium",
        icons = util.technology_icon_constant_equipment(
        "__PlutoniumEnergy__/graphics/technology/fission-reactor-equipment-from-plutonium.png"),
        prerequisites = { "fission-reactor-equipment", "plutonium-nuclear-power" },
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "fission-reactor-equipment-from-plutonium"
            }
        },
        unit =
        {
            count = 50,
            ingredients =
            {
                { "automation-science-pack", 1 },
                { "logistic-science-pack",   1 },
                { "chemical-science-pack",   1 },
                { "military-science-pack",   1 },
                { "utility-science-pack",    1 }
            },
            time = 20
        }
    },
    {
        type = "technology",
        name = "fission-reactor-equipment-from-MOX-fuel",
        icons = util.technology_icon_constant_equipment(
        "__PlutoniumEnergy__/graphics/technology/fission-reactor-equipment-from-MOX-fuel.png"),
        prerequisites = { "fission-reactor-equipment", "MOX-nuclear-power" },
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "fission-reactor-equipment-from-MOX-fuel"
            }
        },
        unit =
        {
            count = 50,
            ingredients =
            {
                { "automation-science-pack", 1 },
                { "logistic-science-pack",   1 },
                { "chemical-science-pack",   1 },
                { "military-science-pack",   1 },
                { "utility-science-pack",    1 }
            },
            time = 20
        }
    }
})
if settings.startup['PE-disable-MOX-reactor'].value then data.raw['technology']['MOX-nuclear-power'].effects[2] = nil end
