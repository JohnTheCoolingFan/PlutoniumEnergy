require("prototypes.recipe.ammo")

local recipes = {}

-- Change kovarex recipe order
data.raw["recipe"]["kovarex-enrichment-process"].order = "r[uranium-processing]-d[kovarex-enrichment-process]"

local advanced_nuclear_fuel_reprocessing = util.table.deepcopy(data.raw["recipe"]["nuclear-fuel-reprocessing"])

advanced_nuclear_fuel_reprocessing.name = "advanced-nuclear-fuel-reprocessing"
advanced_nuclear_fuel_reprocessing.icon = "__PlutoniumEnergy__/graphics/icons/advanced-nuclear-fuel-reprocessing.png"
advanced_nuclear_fuel_reprocessing.icon_size = 32

advanced_nuclear_fuel_reprocessing.enabled = false

advanced_nuclear_fuel_reprocessing.ingredients = {{"used-up-uranium-fuel-cell", 10}}
advanced_nuclear_fuel_reprocessing.energy_required = 100
advanced_nuclear_fuel_reprocessing.results = {{name = ((mods['SchallUraniumProcessing'] or "uranium-238") and 'uranium-concetrate'), amount = 5}, {name = "PE-plutonium-239", amount = 2}}

advanced_nuclear_fuel_reprocessing.order = "r[uranium-processing]-c[advanced-nuclear-fuel-reprocessing]"
table.insert(recipes, advanced_nuclear_fuel_reprocessing)

data:extend(recipes)

data:extend({
    -- Isotope-to-isotope recipes
    {
        type = "recipe",
        name = "plutonium-238-nuclesynthesis",
        localised_name = {(mods['SchallUraniumProcessing'] or "recipe-name.plutonium-238-nuclesynthesis") and 'recipe-name.SUP-plutonium-238-nuclesynthesis'},
        show_amount_in_title = false,
        energy_required = 10,
        enabled = false,
        category = "nucleosynthesis",
        ingredients = {{"uranium-238", 10}},
        icon = "__PlutoniumEnergy__/graphics/icons/plutonium-238-nucleosynthesis.png",
        icon_size = 32,
        subgroup = "raw-material",
        order = "l[plutonium-238-nuclesynthesis]",
        results = {
            {name = "PE-plutonium-238", amount = 5}
        }
    },
    {
        type = "recipe",
        name = "plutonium-239-alpha-decay",
        localised_name = {(mods['SchallUraniumProcessing'] or "recipe-name.plutonium-239-alpha-decay") and 'recipe-name.SUP-plutonium-239-alpha-decay'},
        show_amount_in_title = false,
        energy_required = 10,
        enabled = false,
        category = "alpha-decay",
        ingredients = {{"PE-plutonium-239", 5}},
        icon = "__PlutoniumEnergy__/graphics/icons/plutonium-239-alpha-decay.png",
        icon_size = 32,
        subgroup = "raw-material",
        order = "m[plutonium-239-decay]",
        results = {
            {name = "uranium-235", amount = 2}
        }
    },
    {
        type = "recipe",
        name = "uranium-238-excess-neutron-capture",
        localised_name = {(mods['SchallUraniumProcessing'] or "recipe-name.uranium-238-excess-neutron-capture") and 'recipe-name.SUP-uranium-238-excess-neutron-capture'},
        show_amount_in_title = false,
        energy_required = 10,
        enabled = false,
        category = "excess-neutron-capture",
        ingredients = {{"uranium-238", 10}},
        icon = "__PlutoniumEnergy__/graphics/icons/uranium-238-excess-neutron-capture.png",
        icon_size = 32,
        subgroup = "raw-material",
        order = "m[excess-neutron-capture]",
        results = {
            {name = "PE-plutonium-239", amount = 2}
        }
    },
    {
        type = "recipe",
        name = "MOX-fuel",
        energy_required = 10,
        enabled = false,
        ingredients = {
            {"iron-plate", 10},
            {"uranium-235", 1},
            {"PE-plutonium-239", 3},
            {"PE-plutonium-238", 15}
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
        icon_size = 32,
        subgroup = "intermediate-product",
        order = "r[uranium-processing]-e[MOX-fuel-reprocessing]",
        main_product = "",
        results = {
            {
                name = "PE-plutonium-239",
                amount = 1
            },
            {
                name = "PE-plutonium-238",
                amount = 5
            }
        },
        allow_decomposition = false
    },
    {
        type = "recipe",
        name = "MOX-reactor",
        energy_required = 8,
        enabled = false,
        ingredients = {
            {"concrete", 600},
            {"steel-plate", 600},
            {"advanced-circuit", 600},
            {"copper-plate", 600}
        },
        result = "MOX-reactor",
        requester_paste_multiplier = 1
    },
    {
        type = "recipe",
        name = "industrial-reactor",
        energy_required = 4,
        enabled = false,
        ingredients = {
            {"concrete", 150},
            {"steel-plate", 75},
            {"advanced-circuit", 120},
            {"iron-gear-wheel", 120}
        },
        result = "industrial-reactor",
        requester_paste_multiplier= 10
    }
})
