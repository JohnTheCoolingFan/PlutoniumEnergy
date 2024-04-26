-- Add some recipes to productivty modules limitation (which is whitelist for some reason)
local limitation_to_add = {
    'advanced-nuclear-fuel-reprocessing',
    'MOX-fuel', 'MOX-fuel-reprocessing',
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

local function replace_subgroup(prototype_type, replace_with, targets_list)
    for _, name in pairs(targets_list) do
        log("Replacing subgroup of "..prototype_type.." named `"..name.."` with `"..replace_with.."`")
        if data.raw[prototype_type][name] then
            data.raw[prototype_type][name].subgroup = replace_with
        else
            log("Warning: prototype does not exist in `data.raw`")
        end
    end
end

local function replace_recipe_subgroup(replace_with, targets_list)
    replace_subgroup('recipe', replace_with, targets_list)
end

local function replace_item_subgroup(replace_with, targets_list)
    replace_subgroup('item', replace_with, targets_list)
end

local nuclear_fuel_recipe_subgroup = data.raw['recipe']['nuclear-fuel'].subgroup
local uranium_fuel_cell_recipe_subgroup = data.raw['recipe']['nuclear-fuel-reprocessing'].subgroup

local nuclear_fuel_list_recipes = {
    'plutonium-fuel'
}
local uranium_fuel_cell_list_recipes = {
    'MOX-fuel',
    'breeder-fuel-cell',
    'breeder-fuel-cell-from-uranium-cell',
    'breeder-fuel-cell-from-MOX-fuel',
    'breeder-fuel-cell-reprocessing',
    'used-up-uranium-fuel-cell-solution-centrifuging',
    'used-up-breeder-fuel-cell-solution-centrifuging',
    'advanced-nuclear-fuel-reprocessing',
    'advanced-nuclear-fuel-reprocessing-with-barrelling',
    'used-up-uranium-fuel-cell-solution-centrifuging',
    'MOX-fuel-reprocessing',
    'breeder-fuel-cell-reprocessing',
    'breeder-fuel-cell-reprocessing-with-barrelling',
    'used-up-breeder-fuel-cell-solution-centrifuging'
}

if nuclear_fuel_recipe_subgroup then
    replace_recipe_subgroup(nuclear_fuel_recipe_subgroup, nuclear_fuel_list_recipes)
end
if uranium_fuel_cell_recipe_subgroup then
    replace_recipe_subgroup(uranium_fuel_cell_recipe_subgroup, uranium_fuel_cell_list_recipes)
end

local nuclear_fuel_item_subgroup = data.raw['item']['nuclear-fuel'].subgroup
local uranium_fuel_cell_item_subgroup = data.raw['item']['uranium-fuel-cell'].subgroup

local nuclear_fuel_list_items = {
    'plutonium-fuel'
}
local uranium_fuel_cell_list_items = {
    'MOX-fuel',
    'breeder-fuel-cell'
}

if nuclear_fuel_item_subgroup then
    replace_item_subgroup(nuclear_fuel_item_subgroup, nuclear_fuel_list_items)
end
if uranium_fuel_cell_item_subgroup then
    replace_item_subgroup(uranium_fuel_cell_item_subgroup, uranium_fuel_cell_list_items)
end
