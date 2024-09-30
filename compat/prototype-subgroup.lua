log("Tweaking item and recipe subgroups")


-- Lists of items and recipes to replace subgroups of

-- Recipes that need to have the subgroup of nuclear fuel recipe
local nuclear_fuel_list_recipes = {
    'plutonium-fuel'
}
-- Recipes that need to have the subgroup of uranium fuel cell recipe
local uranium_fuel_cell_list_recipes = {
    'MOX-fuel-cell',
    'breeder-fuel-cell',
    'breeder-fuel-cell-from-uranium-cell',
    'breeder-fuel-cell-from-MOX-fuel-cell',
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
-- Items that need to have the subgroup of nuclear fuel item
local nuclear_fuel_list_items = {
    'plutonium-fuel'
}
-- Items that need to have the subgroup of uranium fuel cell
local uranium_fuel_cell_list_items = {
    'MOX-fuel',
    'breeder-fuel-cell'
}


-- Function definitions

-- Replace subgroup of a prototype
local function replace_subgroup(prototype_type, replace_with, targets_list)
    for _, name in pairs(targets_list) do
        log("Replacing subgroup of " .. prototype_type .. " named `" .. name .. "` with `" .. replace_with .. "`")
        if data.raw[prototype_type][name] then
            data.raw[prototype_type][name].subgroup = replace_with
        else
            log("Warning: prototype does not exist in `data.raw`")
        end
    end
end

-- Wrapper for recipes
local function replace_recipe_subgroup(replace_with, targets_list)
    replace_subgroup('recipe', replace_with, targets_list)
end

-- Wrapper for items
local function replace_item_subgroup(replace_with, targets_list)
    replace_subgroup('item', replace_with, targets_list)
end


-- Replacing action

-- Subgroups to replace with
local nuclear_fuel_recipe_subgroup = data.raw['recipe']['nuclear-fuel'].subgroup
local uranium_fuel_cell_recipe_subgroup = data.raw['recipe']['nuclear-fuel-reprocessing'].subgroup

local nuclear_fuel_item_subgroup = data.raw['item']['nuclear-fuel'].subgroup
local uranium_fuel_cell_item_subgroup = data.raw['item']['uranium-fuel-cell'].subgroup

-- And call the functions
if nuclear_fuel_recipe_subgroup then
    replace_recipe_subgroup(nuclear_fuel_recipe_subgroup, nuclear_fuel_list_recipes)
end
if uranium_fuel_cell_recipe_subgroup then
    replace_recipe_subgroup(uranium_fuel_cell_recipe_subgroup, uranium_fuel_cell_list_recipes)
end

if nuclear_fuel_item_subgroup then
    replace_item_subgroup(nuclear_fuel_item_subgroup, nuclear_fuel_list_items)
end
if uranium_fuel_cell_item_subgroup then
    replace_item_subgroup(uranium_fuel_cell_item_subgroup, uranium_fuel_cell_list_items)
end
