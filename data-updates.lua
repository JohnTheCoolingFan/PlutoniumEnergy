if mods['IndustrialRevolution3'] then
    -- IR3 uses a barreling technology
    data.raw['technology']['plutonium-processing'].prerequisites = {
        "uranium-processing",
        "nuclear-fuel-reprocessing",
        "ir-barrelling"
    }

    if data.raw['technology']['plutonium-ammo'] then
        data.raw['technology']['plutonium-ammo'].unit.count = 2000
        data.raw['technology']['plutonium-ammo'].unit.time = 60
    end

    if data.raw['technology']['plutonium-atomic-bomb'] then
        -- Note to future self: atomic bombs are replaced by artillery shells in IR3
        data.raw['technology']['plutonium-atomic-bomb'].effects = {
            { type = 'unlock-recipe', recipe = 'plutonium-atomic-artillery-shell' } }
    end

    data.raw['ammo']['plutonium-atomic-artillery-shell'].icon =
    '__PlutoniumEnergy__/graphics/icons/plutonium-atomic-artillery-shell-IR3.png'

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

    -- IR3 uses barreling machines
    hide_recipe('advanced-nuclear-fuel-reprocessing-with-barrelling', 'plutonium-processing')
    hide_recipe('breeder-fuel-cell-reprocessing-with-barrelling', 'nuclear-breeding')

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
end

if mods['SchallRadioactiveWaste'] then
    ---@diagnostic disable: undefined-global
    SchallRadioactiveWaste_add_incineration_recipe('used-up-MOX-fuel', 22.3, 0.9)
    SchallRadioactiveWaste_add_incineration_recipe('used-up-breeder-fuel-cell', 45.0, 1.5)
    SchallRadioactiveWaste_add_incineration_recipe('plutonium-238', 3, 0.85)
    SchallRadioactiveWaste_add_incineration_recipe('plutonium-239', 700, 0.85)

    SchallRadioactiveWaste_add_radioactive_effects('plutonium-atomic-rocket', 84, 2.8, 70)

    if data.raw['artillery-projectile']['plutonium-atomic-artillery-projectile'] then
        SchallRadioactiveWaste_add_radioactive_effects('plutonium-atomic-artillery-projectile', 84, 2.8, 70)
    end
end

-- check for tech prerequisites

if not data.raw['technology']['kovarex-enrivhment-process'] then
    table.remove(data.raw['technology']['nuclear-breeding'].prerequisites, 2)
end

-- Add artillery shell damage bonus

local function affects_ammotype(effects, ammotype)
    for _, effect in pairs(effects) do
        if effect.type == "ammo-damage" and effect.ammo_category == ammotype then
            return true
        end
    end
    return false
end

for name, tech in pairs(data.raw['technology']) do
    if tech.effects ~= nil and affects_ammotype(tech.effects, "rocket") then
        table.insert(data.raw['technology'][name].effects,
            { type = "ammo-damage", ammo_category = "artillery-shell", modifier = 0.2 })
    end
end
