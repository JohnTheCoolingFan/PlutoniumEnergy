log("Applying Industrial Revolution 3 compatibility tweaks")

-- IR3 uses a barreling technology
data.raw['technology']['plutonium-processing'].prerequisites = {
    "uranium-processing",
    "nuclear-fuel-reprocessing",
    "ir-barrelling"
}

-- Tweak Plutonium Ammo technology cost
if data.raw['technology']['plutonium-ammo'] then
    data.raw['technology']['plutonium-ammo'].unit.count = 2000
    data.raw['technology']['plutonium-ammo'].unit.time = 60
end

-- Tweak the shell icon to be consistent with IR3
data.raw['ammo']['plutonium-atomic-artillery-shell'].icon =
'__PlutoniumEnergy__/graphics/icons/plutonium-atomic-artillery-shell-IR3.png'

-- Function to hide a recipe
local function hide_recipe(name, technology_name)
    data.raw['recipe'][name].hidden = true
    data.raw['recipe'][name].enabled = false
    if technology_name ~= nil then
        for index, effect in pairs(data.raw['technology'][technology_name].effects) do
            if effect.recipe == name then
                table.remove(data.raw['technology'][technology_name].effects, index)
            end
        end
    end
end

-- IR3 uses barreling machines, so hide the convenient recipes
hide_recipe('advanced-nuclear-fuel-reprocessing-with-barrelling', 'plutonium-processing')
hide_recipe('breeder-fuel-cell-reprocessing-with-barrelling', 'nuclear-breeding')

-- Set subgroup and order to an item
local function subgroup_and_order(name, subgroup, order, item_type)
    if item_type == nil then
        item_type = 'item'
    end
    data.raw[item_type][name].subgroup = subgroup
    data.raw[item_type][name].order = order
end

-- assign IR3 subgroups to items
subgroup_and_order('MOX-reactor', 'ir-nuclear-machines', 'f[nuclear-energy]-a[mox-reactor]')
subgroup_and_order('breeder-reactor', 'ir-nuclear-machines', 'f[nuclear-energy]-a[breeder-reactor]')
subgroup_and_order('MOX-fuel', 'ir-fuels', 'zz[mox-fuel]')
subgroup_and_order('used-up-MOX-fuel', 'ir-fuels', 'zz[mox-fuel-used]')
subgroup_and_order('breeder-fuel-cell', 'ir-fuels', 'zz[breeder-fuel-cell]')
subgroup_and_order('used-up-breeder-fuel-cell', 'ir-fuels', 'zz[breeder-fuel-cell-used]')
subgroup_and_order('plutonium-238', 'ir-fuels', 'cc[plutonium-238]')
subgroup_and_order('plutonium-239', 'ir-fuels', 'cc[plutonium-239]')

if settings.startup['enable-plutonium-ammo'].value then
    subgroup_and_order('plutonium-rounds-magazine', 'ir-ammo', 'c-q', 'ammo')
end
