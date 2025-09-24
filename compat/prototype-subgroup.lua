log("Tweaking item and recipe subgroups")

local function num_to_char(num)
    return string.char(string.byte('a') + num - 1)
end

local function create_subgroups(target_subgroup, subgroups)
    local base_subgroup = data.raw['item-subgroup'][target_subgroup]
    local base_order = base_subgroup.order
    local base_group = base_subgroup.group
    base_subgroup.order = base_order .. 'a'

    local subgroup_prototypes = {}

    for i, subgroup in pairs(subgroups) do
        local order_suffix = num_to_char(i + 1)
        local subgroup_order = base_order .. order_suffix
        log("Adding subgroup `" .. subgroup.name .. '`')
        subgroup.type = 'item-subgroup'
        subgroup.group = base_group
        subgroup.order = subgroup_order
        table.insert(subgroup_prototypes, subgroup)
    end

    data:extend(subgroup_prototypes)
end

create_subgroups(data.raw['item']['uranium-fuel-cell'].subgroup, {
    {
        name = 'nuclear-uranium'
    },
    {
        name = 'nuclear-plutonium'
    },
    {
        name = 'nuclear-breeding'
    }
})

-- Lists of items and recipes to replace subgroups of

-- Recipes that need to have the subgroup of nuclear fuel recipe
local nuclear_fuel_list_recipes = {
    'plutonium-fuel'
}
-- Recipes that need to have the subgroup of uranium fuel cell recipe
local uranium_fuel_cell_list_recipes = {
    --'kovarex-enrichment-process',
    'advanced-nuclear-fuel-reprocessing',
    'advanced-nuclear-fuel-reprocessing-with-barrelling',
    'uranium-fuel-cell-waste-solution-centrifuging',
    --'MOX-fuel-cell',
    --'MOX-fuel-reprocessing',
    --'breeder-fuel-cell',
    --'breeder-fuel-cell-from-uranium-cell',
    --'breeder-fuel-cell-from-MOX-fuel-cell',
    --'breeder-fuel-cell-reprocessing',
    --'breeder-fuel-cell-reprocessing-with-barrelling',
    --'breeder-fuel-cell-waste-solution-centrifuging',
}
-- Items that need to have the subgroup of nuclear fuel item
local nuclear_fuel_list_items = {
    'plutonium-fuel'
}
-- Items that need to have the subgroup of uranium fuel cell
local uranium_fuel_cell_list_items = {
    'used-up-uranium-fuel-cell'
    --'MOX-fuel',
    --'breeder-fuel-cell'
}
local uranium_list_items = {
    'plutonium-239',
    'plutonium-238',
}


-- Function definitions

-- Replace subgroup of a prototype
local function replace_subgroup(prototype_type, replace_with, targets_list)
    for _, name in pairs(targets_list) do
        if data.raw[prototype_type][name] then
            if data.raw[prototype_type][name].subgroup ~= replace_with then
                log("Replacing subgroup of " .. prototype_type .. " named `" .. name .. "` with `" .. replace_with .. "`")
                data.raw[prototype_type][name].subgroup = replace_with
            else
                log("Warning: prototype already has target subgroup: " .. prototype_type .. "." .. name)
            end
        else
            log("Warning: prototype does not exist in `data.raw` or has target subgroup: "
                .. prototype_type .. "." .. name)
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
replace_item_subgroup('nuclear-uranium', { 'uranium-fuel-cell' })
replace_recipe_subgroup('nuclear-uranium', { 'uranium-fuel-cell' })
replace_recipe_subgroup('nuclear-uranium', { 'nuclear-fuel-reprocessing' })

local nuclear_fuel_recipe_subgroup = data.raw['recipe']['nuclear-fuel'].subgroup
local uranium_fuel_cell_recipe_subgroup = data.raw['recipe']['nuclear-fuel-reprocessing'].subgroup

local nuclear_fuel_item_subgroup = data.raw['item']['nuclear-fuel'].subgroup
local uranium_fuel_cell_item_subgroup = data.raw['item']['uranium-fuel-cell'].subgroup
local uranium_item_subgroup = data.raw['item']['uranium-238'].subgroup

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
if uranium_item_subgroup then
    replace_item_subgroup(uranium_item_subgroup, uranium_list_items)
end
