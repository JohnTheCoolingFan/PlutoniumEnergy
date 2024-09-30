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
subgroup_and_order('MOX-fuel-cell', 'ir-fuels', 'zz[mox-fuel]')
subgroup_and_order('used-up-MOX-fuel-cell', 'ir-fuels', 'zz[mox-fuel-used]')
subgroup_and_order('breeder-fuel-cell', 'ir-fuels', 'zz[breeder-fuel-cell]')
subgroup_and_order('used-up-breeder-fuel-cell', 'ir-fuels', 'zz[breeder-fuel-cell-used]')
subgroup_and_order('plutonium-238', 'ir-fuels', 'cc[plutonium-238]')
subgroup_and_order('plutonium-239', 'ir-fuels', 'cc[plutonium-239]')

if settings.startup['enable-plutonium-ammo'].value then
    subgroup_and_order('plutonium-rounds-magazine', 'ir-ammo', 'c-q', 'ammo')
end
