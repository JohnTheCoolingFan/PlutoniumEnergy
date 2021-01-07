require("prototypes.recipe.ammo")

local recipe_names = {}

if mods['SchallUraniumProcessing'] then
    recipe_names = {
        ['plutonium-238-nucleosynthesis']      = 'recipe-name.SUP-plutonium-238-nucleosynthesis',
        ['plutonium-239-alpha-decay']          = 'recipe-name.SUP-plutonium-239-alpha-decay',
        ['uranium-238-excess-neutron-capture'] = 'recipe-name.SUP-uranium-238-excess-neutron-capture'
    }
else
    recipe_names = {
        ['plutonium-238-nucleosynthesis']      = 'recipe-name.plutonium-238-nucleosynthesis',
        ['plutonium-239-alpha-decay']          = 'recipe-name.plutonium-239-alpha-decay',
        ['uranium-238-excess-neutron-capture'] = 'recipe-name.uranium-238-excess-neutron-capture'
    }
end

local recipes = {}

-- Change kovarex recipe order
data.raw["recipe"]["kovarex-enrichment-process"].order = "r[uranium-processing]-d[kovarex-enrichment-process]"

local advanced_nuclear_fuel_reprocessing = util.table.deepcopy(data.raw["recipe"]["nuclear-fuel-reprocessing"])

advanced_nuclear_fuel_reprocessing.name = "advanced-nuclear-fuel-reprocessing"
advanced_nuclear_fuel_reprocessing.icon = "__PlutoniumEnergy__/graphics/icons/advanced-nuclear-fuel-reprocessing.png"
advanced_nuclear_fuel_reprocessing.icon_size = 64
advanced_nuclear_fuel_reprocessing.icon_mipamps = 4

advanced_nuclear_fuel_reprocessing.enabled = false

advanced_nuclear_fuel_reprocessing.ingredients = {{"used-up-uranium-fuel-cell", 10}}
advanced_nuclear_fuel_reprocessing.energy_required = 100
advanced_nuclear_fuel_reprocessing.results = {{name = ((mods['SchallUraniumProcessing'] and settings.startup['PE-SUP-advanced-nfr-uranium-concentrate'].value) and "uranium-concentrate") or 'uranium-238', amount = 5}, {name = "plutonium-239", amount = 2}}

advanced_nuclear_fuel_reprocessing.order = "r[uranium-processing]-c[advanced-nuclear-fuel-reprocessing]"
table.insert(recipes, advanced_nuclear_fuel_reprocessing)

data:extend(recipes)

data:extend({
    -- Isotope-to-isotope recipes
    {
        type = "recipe",
        name = "plutonium-238-nuclesynthesis",
        localised_name = {recipe_names['plutonium-238-nucleosynthesis']},
        show_amount_in_title = false,
        always_show_products = true,
        energy_required = 10,
        enabled = false,
        category = "nucleosynthesis",
        ingredients = {{"uranium-238", 10}},
        icon = "__PlutoniumEnergy__/graphics/icons/plutonium-238-nucleosynthesis.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "raw-material",
        order = "l[plutonium-238-nuclesynthesis]",
        results = {
            {name = "plutonium-238", amount = 5}
        }
    },
    {
        type = "recipe",
        name = "plutonium-239-alpha-decay",
        localised_name = {recipe_names['plutonium-239-alpha-decay']},
        show_amount_in_title = false,
        always_show_products = true,
        energy_required = 10,
        enabled = false,
        category = "alpha-decay",
        ingredients = {{"plutonium-239", 5}},
        icon = "__PlutoniumEnergy__/graphics/icons/plutonium-239-alpha-decay.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "raw-material",
        order = "m[plutonium-239-decay]",
        results = {
            {name = "uranium-235", amount = 2}
        }
    },
    {
        type = "recipe",
        name = "uranium-238-excess-neutron-capture",
        localised_name = {recipe_names['uranium-238-excess-neutron-capture']},
        show_amount_in_title = false,
        always_show_products = true,
        energy_required = 10,
        enabled = false,
        category = "excess-neutron-capture",
        ingredients = {{"uranium-238", 10}},
        icon = "__PlutoniumEnergy__/graphics/icons/uranium-238-excess-neutron-capture.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "raw-material",
        order = "m[excess-neutron-capture]",
        results = {
            {name = "plutonium-239", amount = 2}
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
