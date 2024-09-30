-- Add radiation shielding to recipes

for name, amount in pairs({
    ['MOX-fuel-cell'] = 10,
    ['breeder-fuel-cell'] = 10,
    ['breeder-fuel-cell-from-uranium-cell'] = 10,
    ['breeder-fuel-cell-from-MOX-fuel-cell'] = 10
}) do
    for i, ingredient in pairs(data.raw['recipe'][name].ingredients) do
        if ingredient[0] == 'iron-plate' then
            table.remove(data.raw['recipe'][name].ingredients, i)
        end
    end
    table.insert(data.raw['recipe'][name].ingredients, { 'lead-plate-special', amount })
end

data.raw['recipe']['MOX-reactor'].ingredients = {
    { "lead-plate-special", 80 },
    { "computer-mk3",       4 },
    { "heat-pipe",          4 },
    { "graphite",           60 },
}
data.raw['recipe']['breeder-reactor'].ingredients = {
    { "lead-plate-special", 200 },
    { "computer-mk3",       6 },
    { "heat-pipe",          12 },
    { "graphite",           160 },
}

local function subgroup_and_order(name, subgroup, order, item_type)
    if item_type == nil then
        item_type = 'item'
    end
    data.raw[item_type][name].subgroup = subgroup
    data.raw[item_type][name].order = order
end

subgroup_and_order('MOX-reactor', 'ir-nuclear-machines', 'f[nuclear-energy]-a[mox-reactor]', 'recipe')

subgroup_and_order('breeder-reactor', 'ir-nuclear-machines', 'f[nuclear-energy]-a[breeder-reactor]', 'recipe')

if settings.startup['enable-plutonium-ammo'].value then
    subgroup_and_order('plutonium-rounds-magazine', 'ir-ammo', 'c-q', 'recipe')
end

-- IR3 removes uranium-fuel, not a usable fuel for vehicles
data.raw['recipe']['plutonium-fuel'].hidden = true
data.raw['recipe']['plutonium-fuel'].enabled = false


-- Add steel, lead, and concrete scrap to reprocessing recipes
for name, items in pairs({
    ['MOX-fuel-cell-reprocessing'] = {
        { name = "steel-scrap",    amount_max = 3, amount_min = 1 },
        { name = "lead-scrap",     amount_max = 2, amount_min = 1 },
        { name = "concrete-scrap", amount_max = 2, amount_min = 1 }
    },

    ['breeder-fuel-cell-reprocessing'] = {
        { name = "steel-scrap",    amount_max = 6, amount_min = 3 },
        { name = "lead-scrap",     amount_max = 4, amount_min = 2 },
        { name = "concrete-scrap", amount_max = 4, amount_min = 2 }
    },

    ['advanced-nuclear-fuel-reprocessing'] = {
        { name = "steel-scrap",    amount_max = 3, amount_min = 1 },
        { name = "lead-scrap",     amount_max = 2, amount_min = 1 },
        { name = "concrete-scrap", amount_max = 2, amount_min = 1 }
    }

}) do
    for _, item in pairs(items) do
        table.insert(data.raw['recipe'][name].results, item)
    end
end

-- new subgroup, after uranium recipes
data:extend({ {
    type = 'item-subgroup',
    name = 'pe',
    group = 'ir-processing',
    order = 'zzzz',
} })
for _, name in pairs({
    'MOX-fuel-cell',
    'breeder-fuel-cell',
    'MOX-fuel-cell-reprocessing',
    'breeder-fuel-cell-reprocessing',
    'advanced-nuclear-fuel-reprocessing',
    'breeder-fuel-cell-from-MOX-fuel-cell',
    'breeder-fuel-cell-from-uranium-cell',
    'used-up-uranium-fuel-cell-solution-centrifuging',
    'used-up-breeder-fuel-cell-solution-centrifuging'
}) do
    data.raw['recipe'][name].subgroup = 'pe'
end
