-- Add some recipes to productivty modules limitation (which is whitelist for some reason)
local limitation_to_add = {
    'advanced-nuclear-fuel-reprocessing',
    'MOX-fuel', 'MOX-fuel-reprocessing',
    'plutonium-fuel',
    'plutonium-enrichment-process',
    'used-up-uranium-fuel-cell-solution-centrifuging',
    'breeder-fuel-cell-reprocessing',
    'breeder-fuel-cell',
    'breeder-fuel-cell-from-uranium-cell',
    'breeder-fuel-cell-from-MOX-fuel'
}
for _, module in pairs(data.raw['module']) do
    if module.limitation and module.effect.productivity then
        for _, recipe in pairs(limitation_to_add) do
            table.insert(module.limitation, recipe)
        end
    end
end
