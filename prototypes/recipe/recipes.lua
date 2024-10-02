require("prototypes.recipe.ammo")

local function reprocessing_icon(cell_icon_path, tint, secondary_tint)
    if type(secondary_tint) == 'number' then
        local mul_tint = {
            tint[1] * secondary_tint,
            tint[2] * secondary_tint,
            tint[3] * secondary_tint,
            tint[4]
        }
        secondary_tint = mul_tint
    end
    local result = {
        {
            icon = '__PlutoniumEnergy__/graphics/icons/reprocessing/reprocessing-bottom.png',
            tint = secondary_tint or tint
        },
        {
            icon = cell_icon_path,
            scale = 0.625 * 0.5
        },
        {
            icon = '__PlutoniumEnergy__/graphics/icons/reprocessing/reprocessing-top.png',
            tint = tint
        }
    }
    return result
end

local function reprocessing_icon_barrel(cell_icon_path, tint, secondary_tint)
    local result = reprocessing_icon(cell_icon_path, tint, secondary_tint)
    table.insert(result, {
        icon = '__base__/graphics/icons/fluid/barreling/empty-barrel.png',
        shift = { 8, -8 },
        scale = 0.25
    })
    return result
end

-- Change some vanilla recipe order
data.raw["recipe"]["kovarex-enrichment-process"].order = "r[uranium-processing]-f[kovarex-enrichment-process]"
data.raw["recipe"]["nuclear-fuel-reprocessing"].order = "r[uranium-processing]-c[reprocessing]-a[regular-uranium]"

data:extend({
    -- Advanced nuclear fuel reprocessing
    {
        type = 'recipe',
        name = 'advanced-nuclear-fuel-reprocessing',
        localised_name = { 'recipe-name.advanced-nuclear-fuel-reprocessing' },
        icons = reprocessing_icon(
            '__base__/graphics/icons/used-up-uranium-fuel-cell.png',
            { 0, 1, 0, 1 }, 0.75
        ),
        icon_size = 64,
        icon_mipmamps = 4,
        category = 'chemistry',
        enabled = false,
        ingredients = {
            { type = 'item',  name = 'used-up-uranium-fuel-cell', amount = 1 },
            { type = 'fluid', name = 'sulfuric-acid',             amount = 25 }
        },
        energy_required = 1,
        results = {
            { type = 'fluid', name = 'used-up-uranium-fuel-cell-solution', amount = 50 }
        },
        order = 'r[uranium-processing]-c[reprocessing]-b[advanced-uranium]-a[no-barreling]',
        subgroup = 'intermediate-product',
        show_amount_in_title = false,
        always_show_products = true,
        crafting_machine_tint = {
            primary = { r = 0.651, g = 0.851, b = 0.075, a = 1.000 },   -- #A6D913
            secondary = { r = 0.525, g = 0.694, b = 0.039, a = 1.000 }, -- #86b10a
            tertiary = { r = 0.475, g = 0.541, b = 0.282, a = 1.000 },  -- #798a48
            quaternary = { r = 0.753, g = 0.863, b = 0.075, a = 1.000 } -- #c0dc13
        },
        allow_decomposition = false
    },
    {
        -- Same as above, but barelling is built-in
        type = 'recipe',
        name = 'advanced-nuclear-fuel-reprocessing-with-barrelling',
        localised_name = { 'recipe-name.advanced-nuclear-fuel-reprocessing-with-barrelling' },
        icons = reprocessing_icon_barrel(
            '__base__/graphics/icons/used-up-uranium-fuel-cell.png',
            { 0, 1, 0, 1 }, 0.75
        ),
        icon_size = 64,
        icon_mipmamps = 4,
        category = 'chemistry',
        enabled = false,
        ingredients = {
            { type = 'item',  name = 'used-up-uranium-fuel-cell', amount = 1 },
            { type = 'fluid', name = 'sulfuric-acid',             amount = 25 },
            { type = 'item',  name = 'empty-barrel',              amount = 1 }
        },
        energy_required = 1,
        results = {
            { type = 'item', name = 'used-up-uranium-fuel-cell-solution-barrel', amount = 1 }
        },
        order = 'r[uranium-processing]-c[reprocessing]-b[advanced-uranium]-b[with-barreling]',
        subgroup = 'intermediate-product',
        show_amount_in_title = false,
        always_show_products = true,
        crafting_machine_tint = {
            primary = { r = 0.651, g = 0.851, b = 0.075, a = 1.000 },   -- #A6D913
            secondary = { r = 0.525, g = 0.694, b = 0.039, a = 1.000 }, -- #86b10a
            tertiary = { r = 0.475, g = 0.541, b = 0.282, a = 1.000 },  -- #798a48
            quaternary = { r = 0.753, g = 0.863, b = 0.075, a = 1.000 } -- #c0dc13
        },
        allow_decomposition = false
    },
    {
        type = 'recipe',
        name = 'used-up-uranium-fuel-cell-solution-centrifuging',
        icon = '__PlutoniumEnergy__/graphics/icons/used-up-uranium-fuel-cell-solution-centrifuging.png',
        icon_size = 64,
        category = 'centrifuging',
        enabled = false,
        ingredients = {
            { type = 'item', name = 'used-up-uranium-fuel-cell-solution-barrel', amount = 10 }
        },
        energy_required = 60,
        results = {
            { type = 'item', name = 'uranium-238',   amount_min = 8, amount_max = 10 },
            { type = 'item', name = 'plutonium-238', amount_min = 3, amount_max = 6 },
            { type = 'item', name = 'plutonium-239', amount = 1,     probability = 0.02 },
            { type = 'item', name = 'empty-barrel',  amount = 10,    catalyst_amount = 10 }
        },
        crafting_machine_tint = {
            primary = { r = 0.651, g = 0.851, b = 0.075, a = 1.000 } -- #A6D913
        },
        order = 'r[uranium-processing]-c[reprocessing]-b[advanced-uranium]-c[centrifuging]',
        subgroup = 'intermediate-product',
        allow_decomposition = false
    },

    -- Plutonium fuel cell and reprocessing
    {
        type = 'recipe',
        name = "plutonium-fuel-cell",
        energy_required = 10,
        enabled = false,
        ingredients = {
            { "iron-plate",    10 },
            { "plutonium-239", 1 },
            { "plutonium-238", 4 },
            { "uranium-238",   15 }
        },
        result = "plutonium-fuel-cell",
        result_count = 10
    },
    {
        type = "recipe",
        name = "plutonium-fuel-cell-reprocessing",
        energy_required = 50,
        enabled = false,
        category = "centrifuging",
        ingredients = { { "used-up-plutonium-fuel-cell", 10 } },
        icons = reprocessing_icon(
            '__PlutoniumEnergy__/graphics/icons/used-up-plutonium-fuel-cell.png',
            { 0, 1, 1, 1 }, 0.75
        ),
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "nuclear-plutonium",
        order = "r[uranium-processing]-c[reprocessing]-c[MOX]",
        main_product = "",
        crafting_machine_tint = {
            primary = { r = 0.000, g = 1.000, b = 0.961, a = 1.000 } -- #00FFF5
        },
        results = {
            {
                name = "plutonium-239",
                amount = 1,
                probability = 0.01
            },
            {
                name = "plutonium-238",
                amount = 4
            }
        },
        allow_decomposition = false
    },

    -- MOX fuel cell and reprocessing
    {
        type = 'recipe',
        name = "MOX-fuel-cell",
        energy_required = 10,
        enabled = false,
        ingredients = {
            { "iron-plate",    10 },
            { "uranium-238",   15 },
            { "plutonium-238", 5 }
        },
        result = "MOX-fuel-cell",
        result_count = 20
    },
    {
        type = "recipe",
        name = "MOX-fuel-cell-reprocessing",
        energy_required = 50,
        enabled = false,
        category = "centrifuging",
        ingredients = { { "used-up-MOX-fuel-cell", 20 } },
        icons = reprocessing_icon(
            '__PlutoniumEnergy__/graphics/icons/used-up-MOX-fuel-cell.png',
            { 0, 1, 0.5, 1 }, 0.75
        ),
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "nuclear-plutonium",
        order = "r[uranium-processing]-c[reprocessing]-c[MOX]",
        main_product = "",
        crafting_machine_tint = {
            primary = { r = 0.000, g = 1.000, b = 0.7, a = 1.000 }
        },
        results = {
            {
                name = "plutonium-238",
                amount = 3
            },
            {
                name = "uranium-238",
                amount = 4
            }
        },
        allow_decomposition = false
    },

    -- Breeder fuel cell
    {
        type = 'recipe',
        name = 'breeder-fuel-cell',
        energy_required = 10,
        enabled = false,
        ingredients = {
            { 'iron-plate',    10 },
            { 'plutonium-239', 1 },
            { 'uranium-238',   19 }
        },
        result = 'breeder-fuel-cell',
        result_count = 2
    },
    {
        type = 'recipe',
        name = 'breeder-fuel-cell-from-uranium-cell',
        icon = '__PlutoniumEnergy__/graphics/icons/breeder-fuel-cell-from-uranium-cell.png',
        icon_size = 64,
        icon_mipmaps = 4,
        category = 'centrifuging',
        energy_required = 15,
        enabled = false,
        ingredients = {
            { 'iron-plate',                20 },
            { 'used-up-uranium-fuel-cell', 10 },
            { 'plutonium-239',             1 }
        },
        crafting_machine_tint = {
            primary = { r = 1.000, g = 0.000, b = 0.388, a = 1.000 } -- #FF0063
        },
        order = 'r[uranium-processing]-b[obreeder-fuel-cell]-b[uranium]',
        result = 'breeder-fuel-cell',
        result_count = 4,
        allow_decomposition = false
    },
    {
        type = 'recipe',
        name = 'breeder-fuel-cell-from-MOX-fuel-cell',
        icon = '__PlutoniumEnergy__/graphics/icons/breeder-fuel-cell-from-MOX-fuel-cell.png',
        icon_size = 64,
        icon_mipmaps = 4,
        category = 'centrifuging',
        energy_required = 7.5,
        enabled = false,
        ingredients = {
            { 'iron-plate',            10 },
            { 'used-up-MOX-fuel-cell', 5 },
            { 'uranium-238',           10 }
        },
        crafting_machine_tint = {
            primary = { r = 1.000, g = 0.000, b = 0.388, a = 1.000 } -- #FF0063
        },
        order = 'r[uranium-processing]-b[obreeder-fuel-cell]-c[mox]',
        result = 'breeder-fuel-cell',
        result_count = 2,
        allow_decomposition = false
    },
    {
        type = 'recipe',
        name = 'breeder-fuel-cell-reprocessing',
        localised_name = { 'recipe-name.breeder-fuel-cell-reprocessing' },
        icons = reprocessing_icon(
            '__PlutoniumEnergy__/graphics/icons/used-up-breeder-fuel-cell.png',
            { 1, 0, 1, 1 }, 0.75
        ),
        icon_size = 64,
        icon_mipmamps = 4,
        category = 'chemistry',
        enabled = false,
        ingredients = {
            { type = 'item',  name = 'used-up-breeder-fuel-cell', amount = 1 },
            { type = 'fluid', name = 'sulfuric-acid',             amount = 125 }
        },
        energy_required = 2,
        results = {
            { type = 'fluid', name = 'used-up-breeder-fuel-cell-solution', amount = 250 }
        },
        order = 'r[uranium-processing]-c[reprocessing]-d[breeder]-a[no-barreling]',
        subgroup = 'nuclear-breeding',
        show_amount_in_title = false,
        always_show_products = true,
        crafting_machine_tint = {
            primary = { r = 0.467, g = 0.000, b = 0.180, a = 1.000 },   -- #77002E
            secondary = { r = 0.694, g = 0.000, b = 0.039, a = 1.000 }, -- #B1000A
            tertiary = { r = 0.541, g = 0.000, b = 0.282, a = 1.000 },  -- #8A0043
            quaternary = { r = 0.863, g = 0.000, b = 0.075, a = 1.000 } -- #DC0013
        },
        allow_decomposition = false
    },
    {
        -- Same, but with barrelling in a single step
        type = 'recipe',
        name = 'breeder-fuel-cell-reprocessing-with-barrelling',
        localised_name = { 'recipe-name.breeder-fuel-cell-reprocessing-with-barreling' },
        icons = reprocessing_icon_barrel(
            '__PlutoniumEnergy__/graphics/icons/used-up-breeder-fuel-cell.png',
            { 1, 0, 1, 1 }, 0.75
        ),
        icon_size = 64,
        icon_mipmamps = 4,
        category = 'chemistry',
        enabled = false,
        ingredients = {
            { type = 'item',  name = 'used-up-breeder-fuel-cell', amount = 1 },
            { type = 'fluid', name = 'sulfuric-acid',             amount = 125 },
            { type = 'item',  name = 'empty-barrel',              amount = 5 }
        },
        energy_required = 2.5,
        results = {
            { type = 'item', name = 'used-up-breeder-fuel-cell-solution-barrel', amount = 5 }
        },
        order = 'r[uranium-processing]-c[reprocessing]-d[breeder]-b[with-barreling]',
        subgroup = 'nuclear-breeding',
        show_amount_in_title = false,
        always_show_products = true,
        crafting_machine_tint = {
            primary = { r = 0.467, g = 0.000, b = 0.180, a = 1.000 },   -- #77002E
            secondary = { r = 0.694, g = 0.000, b = 0.039, a = 1.000 }, -- #B1000A
            tertiary = { r = 0.541, g = 0.000, b = 0.282, a = 1.000 },  -- #8A0048
            quaternary = { r = 0.863, g = 0.000, b = 0.075, a = 1.000 } -- #DC0013
        },
        allow_decomposition = false
    },
    {
        type = 'recipe',
        name = 'used-up-breeder-fuel-cell-solution-centrifuging',
        icon = '__PlutoniumEnergy__/graphics/icons/used-up-breeder-fuel-cell-solution-centrifuging.png',
        icon_size = 64,
        category = 'centrifuging',
        enabled = false,
        ingredients = {
            { type = 'item', name = 'used-up-breeder-fuel-cell-solution-barrel', amount = 10 }
        },
        energy_required = 40,
        results = {
            { type = 'item', name = 'plutonium-238', amount = 4 },
            { type = 'item', name = 'plutonium-239', amount = 2 },
            { type = 'item', name = 'empty-barrel',  amount = 10, catalyst_amount = 10 },
        },
        crafting_machine_tint = {
            primary = { r = 0.467, g = 0.000, b = 0.180, a = 1.000 } -- #77002E
        },
        order = 'r[uranium-processing]-c[reprocessing]-d[breeder]-c[centrifuging]',
        subgroup = 'nuclear-breeding',
        allow_decomposition = false
    },

    -- Plutonium fuel (chemical fuel)
    {
        type = "recipe",
        name = "plutonium-fuel",
        energy_required = 40,
        enabled = false,
        category = "centrifuging",
        ingredients = { { "plutonium-239", 1 }, { "nuclear-fuel", 1 } },
        icon = "__PlutoniumEnergy__/graphics/icons/plutonium-fuel.png",
        icon_size = 64,
        icon_mipmaps = 4,
        crafting_machine_tint = {
            primary = { r = 0.000, g = 1.000, b = 0.961, a = 1.000 } -- #00FFF5
        },
        result = "plutonium-fuel"
    },

    -- Reactors
    {
        type = "recipe",
        name = "MOX-reactor",
        energy_required = 8,
        enabled = false,
        ingredients = {
            { "concrete",         400 },
            { "steel-plate",      400 },
            { "advanced-circuit", 400 },
            { "copper-plate",     400 }
        },
        result = "MOX-reactor",
        requester_paste_multiplier = 1
    },
    {
        type = "recipe",
        name = "breeder-reactor",
        energy_required = 8,
        enabled = false,
        ingredients = {
            { "concrete",         1000 },
            { "steel-plate",      1000 },
            { "advanced-circuit", 1000 },
            { "copper-plate",     1000 }
        },
        result = "breeder-reactor",
        requester_paste_multiplier = 1
    }
})

if mods["IndustrialRevolution3"] then
    require('compat.IndustrialRevolution3.recipe-tweaks')
end
