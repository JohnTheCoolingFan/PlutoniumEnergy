require("prototypes.recipe.ammo")

-- Change kovarex recipe order
data.raw["recipe"]["kovarex-enrichment-process"].order = "r[uranium-processing]-f[kovarex-enrichment-process]"

data:extend({
        {
            type = 'recipe',
            name = 'advanced-nuclear-fuel-reprocessing',
            localised_name = {'recipe-name.advanced-nuclear-fuel-reprocessing'},
            icon = '__PlutoniumEnergy__/graphics/icons/advanced-nuclear-fuel-reprocessing.png',
            icon_size = 64,
            icon_mipmamps = 4,
            category = 'chemistry',
            enabled = false,
            ingredients = {
                {type = 'item', name = 'used-up-uranium-fuel-cell', amount = 1},
                {type = 'fluid', name = 'sulfuric-acid', amount = 25}
            },
            energy_required = 1,
            results = {
                {type = 'fluid', name = 'used-up-uranium-fuel-cell-solution', amount = 50}
            },
            order = 'r[uranium-processing]-c[advanced-nuclear-fuel-reprocessing]',
            subgroup = 'intermediate-product',
            show_amount_in_title = false,
            always_show_products = true,
            crafting_machine_tint = {
                primary = {r = 0.651, g = 0.851, b = 0.075, a = 1.000}, -- #A6D913
                secondary = {r = 0.525, g = 0.694, b = 0.039, a = 1.000}, -- #86b10a
                tertiary = {r = 0.475, g = 0.541, b = 0.282, a = 1.000}, -- #798a48
                quaternary = {r = 0.753, g = 0.863, b = 0.075, a = 1.000} -- #c0dc13
            }
        },
        {
            type = 'recipe',
            name = 'used-up-uranium-fuel-cell-solution-centrifuging',
            icon = '__PlutoniumEnergy__/graphics/icons/used-up-uranium-fuel-cell-solution-centrifuging.png',
            icon_size = 64,
            icon_mipmamps = 4,
            category = 'centrifuging',
            enabled = false,
            ingredients = {
                {type = 'item', name = 'used-up-uranium-fuel-cell-solution-barrel', amount = 10}
            },
            energy_required = 60,
            results = {
                {type = 'item', name = 'uranium-238',   amount_min = 8, amount_max = 10},
                {type = 'item', name = 'plutonium-238', amount_min = 3, amount_max = 6},
                {type = 'item', name = 'plutonium-239', amount = 1, probability = 0.25},
                {type = 'item', name = 'empty-barrel',  amount = 10}
            },
            order = 'r[uranium-processing]-d[advanced-nuclear-fuel-reprocessing]',
            subgroup = 'intermediate-product'
        },
        {
            type = 'recipe',
            name = "MOX-fuel",
            energy_required = 10,
            enabled = false,
            ingredients = {
                {"iron-plate", 10},
                {"uranium-235", 1},
                {"plutonium-239", 3},
                {"plutonium-238", 15}
            },
            result = "MOX-fuel",
            result_count = 10
        },
        {
            type = "recipe",
            name = "MOX-fuel-reprocessing",
            energy_required = 50,
            enabled = false,
            category = "centrifuging",
            ingredients = {{"used-up-MOX-fuel", 5}},
            icon = "__PlutoniumEnergy__/graphics/icons/MOX-fuel-reprocessing.png",
            icon_size = 64,
            icon_mipmaps = 4,
            subgroup = "intermediate-product",
            order = "r[uranium-processing]-e[MOX-fuel-reprocessing]",
            main_product = "",
            results = {
                {
                    name = "plutonium-239",
                    amount = 1
                },
                {
                    name = "plutonium-238",
                    amount = 5
                }
            },
            allow_decomposition = false
        },
        {
            type = "recipe",
            name = "plutonium-fuel",
            energy_required = 40,
            enabled = false,
            category = "centrifuging",
            ingredients = {{"plutonium-239", 1}, {"nuclear-fuel", 1}},
            icon = "__PlutoniumEnergy__/graphics/icons/plutonium-fuel.png",
            icon_size = 64, icon_mipmaps = 4,
            result = "plutonium-fuel"
        },
        {
            type = "recipe",
            name = "plutonium-enrichment-process",
            energy_required = 80,
            enabled = false,
            category = "centrifuging",
            ingredients = {
                {'plutonium-239', 30},
                {'plutonium-238', 10},
            },
            icon = "__PlutoniumEnergy__/graphics/icons/plutonium-enrichment-process.png",
            icon_size = 64, icon_mipmaps = 4,
            subgroup = "intermediate-product",
            order = "r[uranium-processing]-f[plutonium-enrichment-process]",
            main_product = "",
            results = {
                {'plutonium-239', 32},
                {'plutonium-238', 2},
            },
            allow_decomposition = false
        },
        {
            type = "recipe",
            name = "MOX-reactor",
            energy_required = 8,
            enabled = false,
            ingredients = {
                {"concrete", 400},
                {"steel-plate", 400},
                {"advanced-circuit", 400},
                {"copper-plate", 400}
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
                {"concrete", 1000},
                {"steel-plate", 1000},
                {"advanced-circuit", 1000},
                {"copper-plate", 1000}
            },
            result = "breeder-reactor",
            requester_paste_multiplier = 1
        }
    })

if mods["IndustrialRevolution"] then
    -- Recipe tweaks
    data.raw['recipe']['plutonium-fuel'].ingredients = {
        {"rocket-fuel", 1},
        {"plutonium-239", 1}
    }
    data.raw['recipe']['plutonium-fuel'].energy_required = 90
    data.raw['recipe']['plutonium-fuel'].category = 'chemistry'
    -- Add Shielded Steel plate to recipes
    data.raw['recipe']['MOX-fuel'].ingredients = {
        {"lead-plate-special", 10},
        {"uranium-238", 19},
        {"plutonium-239", 1}
    }
    data.raw['recipe']['MOX-reactor'].ingredients = {
        {"lead-plate-special", 80},
        {"computer-mk3", 4},
        {"heat-pipe", 4},
        {"graphite", 60},
        {"refined-concrete", 200},
    }
    -- Add lead scrap to reprocessing recipes
    data.raw["recipe"]["MOX-fuel-reprocessing"].results = {
        {
            name = "plutonium-239",
            amount = 1
        },
        {
            name = "plutonium-238",
            amount = 5
        },
        {
            name = "steel-scrap",
            amount = 2
        },
        {
            name = "lead-scrap",
            amount = 1
        }
    }
    table.insert(data.raw['recipe']['advacned-nuclear-fuel-reprocessing'].results, {name="steel-scrap", amount=1})
    table.insert(data.raw['recipe']['advacned-nuclear-fuel-reprocessing'].results, {name="lead-scrap", amount=1})
    -- Subgroup and ordering fixes
    data.raw['recipe']['MOX-fuel-reprocessing'].subgroup = 'ir2-fuels'
    data.raw['recipe']['plutonium-enrichment-process'].subgroup = 'ir2-fuels'
    data.raw['recipe']['MOX-fuel'].subgroup = 'ir2-fuels'
    data.raw['recipe']['MOX-fuel'].category = 'centrifuging'
end
