log("Tweaking productivity restrictions")

-- Add some recipes to productivty modules limitation (which is whitelist for some reason)
local limitation_to_add = {
    'advanced-nuclear-fuel-reprocessing',
    'MOX-fuel-cell', 'MOX-fuel-cell-reprocessing',
    'plutonium-fuel',
    'breeder-fuel-cell-reprocessing',
    'used-up-uranium-fuel-cell-solution-centrifuging',
    'used-up-breeder-fuel-cell-solution-centrifuging',
    'breeder-fuel-cell',
}
for _, module in pairs(data.raw['module']) do
    if module.limitation and module.effect.productivity then
        for _, recipe in pairs(limitation_to_add) do
            table.insert(module.limitation, recipe)
        end
    end
end

for _, recipe_name in pairs(limitation_to_add) do
    if data.raw['recipe'][recipe_name] then
        data.raw['recipe'][recipe_name].allow_productivity = true
    end
end
