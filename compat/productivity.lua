log("Tweaking productivity restrictions")

-- This solves an old problem of each productivity module having a list of recipes it can be used on.
-- Recently (somewhere in 2.0) this has been changed to a setting in a recipe (big upside)
-- This file does both: adding recipes ot a module if it has recipe limitations, and
-- Adding `allow_productivity = true` to recipes as well, even though it is already set there.
--
-- Moving to a per-recipe setting only would be a good idea but that woudl mean any mod
-- adding a productivity module using limitations is potentially broken slightly.
-- In other words: API updates are hard.
--
-- Also proprs to DocJade's Baketorio vid for pointing this out, been making a fix for Baketorio
-- before patching this mod and adding the fix here.
--
--                                                                              JohnTheCoolingFan

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
