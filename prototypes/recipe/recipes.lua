require("prototypes.recipe.ammo")


local recipes = {}

-- Change kovarex recipe order
data.raw["recipe"]["kovarex-enrichment-process"].order = "r[uranium-processing]-e[kovarex-enrichment-process]"


local advanced_nuclear_fuel_reprocessing = util.table.deepcopy(data.raw["recipe"]["nuclear-fuel-reprocessing"])

advanced_nuclear_fuel_reprocessing.name = "advanced-nuclear-fuel-reprocessing"
advanced_nuclear_fuel_reprocessing.icon = "__PlutoniumEnergy__/graphics/icons/advanced-nuclear-fuel-reprocessing.png"
advanced_nuclear_fuel_reprocessing.icon_size = 64
advanced_nuclear_fuel_reprocessing.icon_mipamps = 4
advanced_nuclear_fuel_reprocessing.enabled = false
advanced_nuclear_fuel_reprocessing.ingredients = {{"used-up-uranium-fuel-cell", 10}}
advanced_nuclear_fuel_reprocessing.energy_required = 100
table.insert(advanced_nuclear_fuel_reprocessing.results, {'plutonium-239', 2})
table.insert(advanced_nuclear_fuel_reprocessing.results, {'plutonium-238', 3})
advanced_nuclear_fuel_reprocessing.order = "r[uranium-processing]-c[advanced-nuclear-fuel-reprocessing]"
table.insert(recipes, advanced_nuclear_fuel_reprocessing)


data:extend(recipes)

data:extend({
        {
            type = "recipe",
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
            order = "r[uranium-processing]-d[MOX-fuel-reprocessing]",
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
            energy_required = 90,
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
            energy_required = 120,
            enabled = false,
            category = "centrifuging",
            ingredients = {
                {'plutonium-239', 30},
                {'plutonium-238', 10},
                {'uranium-235',   10},
                {'uranium-238',   20}
            },
            icon = "__PlutoniumEnergy__/graphics/icons/plutonium-enrichment-process.png",
            icon_size = 64, icon_mipmaps = 4,
            subgroup = "intermediate-product",
            order = "r[uranium-processing]-f[plutonium-enrichment-process]",
            main_product = "",
            results = {
                {'plutonium-239', 32},
                {'plutonium-238', 2},
                {'uranium-235',   12},
                {'uranium-238',   10}
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
        }
    })

if mods["IndustrialRevolution"] then
    -- Recipe tweaks
    data.raw['recipe']['plutonium-fuel'].ingredients = {
        {"rocket-fuel", 1},
        {"plutonium-239", 1}
    }
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
    data.raw["recipe"]["advanced-nuclear-fuel-reprocessing"].results = {
        {
            name = "plutonium-239",
            amount = 1
        },
        {
            name = "plutonium-238",
            amount = 3
        },
        {
            name = "steel-scrap",
            amount = 10
        },
        {
            name = "lead-scrap",
            amount = 5
        },
        {
            name = "uranium-238",
            amount = 4
        }
    }
    -- Subgroup and ordering fixes
    data.raw['recipe']['MOX-fuel-reprocessing'].subgroup = 'ir2-fuels'
    data.raw['recipe']['plutonium-enrichment-process'].subgroup = 'ir2-fuels'
    data.raw['recipe']['MOX-fuel'].subgroup = 'ir2-fuels'
    data.raw['recipe']['MOX-fuel'].category = 'centrifuging'
end
