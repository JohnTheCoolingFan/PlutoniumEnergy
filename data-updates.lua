if mods['IndustrialRevolution3'] then
    -- IR3 uses a barreling technology
    data.raw['technology']['plutonium-processing'].prerequisites = { "uranium-processing", "nuclear-fuel-reprocessing",
        "ir-barrelling" }

    if data.raw['technology']['plutonium-ammo'] then
        data.raw['technology']['plutonium-ammo'].unit.count = 2000
        data.raw['technology']['plutonium-ammo'].unit.time = 60
    end

    if data.raw['technology']['plutonium-atomic-bomb'] then
        -- Note to future self: atomic bombs are replaced by artillery shells in IR3
        data.raw['technology']['plutonium-atomic-bomb'].effects = {
            { type = 'unlock-recipe', recipe = 'plutonium-atomic-artillery-shell' } }
    end

    -- IR3 uses barreling machines
    data.raw['recipe']['advanced-nuclear-fuel-reprocessing-with-barrelling'].hidden = true
    data.raw['recipe']['advanced-nuclear-fuel-reprocessing-with-barrelling'].enabled = false

    for index, effect in pairs(data.raw['technology']['plutonium-processing'].effects) do
        if effect.recipe == "advanced-nuclear-fuel-reprocessing-with-barrelling" then
            table.remove(data.raw['technology']['plutonium-processing'].effects, index)
        end
    end

    data.raw['recipe']['breeder-fuel-cell-reprocessing-with-barrelling'].hidden = true
    data.raw['recipe']['breeder-fuel-cell-reprocessing-with-barrelling'].enabled = false

    for index, effect in pairs(data.raw['technology']['nuclear-breeding'].effects) do
        if effect.recipe == "breeder-fuel-cell-reprocessing-with-barrelling" then
            table.remove(data.raw['technology']['nuclear-breeding'].effects, index)
        end
    end

    -- assign IR3 subgroups to items
    data.raw['item']['MOX-reactor'].subgroup = "ir-nuclear-machines"
    data.raw['item']['MOX-reactor'].order = "f[nuclear-energy]-a[mox-reactor]"

    data.raw['item']['breeder-reactor'].subgroup = "ir-nuclear-machines"
    data.raw['item']['breeder-reactor'].order = "f[nuclear-energy]-a[breeder-reactor]"

    data.raw['item']['MOX-fuel'].subgroup = "ir-fuels"
    data.raw['item']['MOX-fuel'].order = "zz[mox-fuel]"

    data.raw['item']['used-up-MOX-fuel'].subgroup = "ir-fuels"
    data.raw['item']['used-up-MOX-fuel'].order = "zz[mox-fuel-used]"

    data.raw['item']['breeder-fuel-cell'].subgroup = "ir-fuels"
    data.raw['item']['breeder-fuel-cell'].order = "zz[breeder-fuel-cell]"

    data.raw['item']['used-up-breeder-fuel-cell'].subgroup = "ir-fuels"
    data.raw['item']['used-up-breeder-fuel-cell'].order = "zz[breeder-fuel-cell-used]"

    data.raw['item']['plutonium-238'].subgroup = "ir-fuels"
    data.raw['item']['plutonium-238'].order = "cc[plutonium-238]"

    data.raw['item']['plutonium-239'].subgroup = "ir-fuels"
    data.raw['item']['plutonium-239'].order = "cc[plutonium-239]"

    if settings.startup['enable-plutonium-ammo'].value then
        data.raw['ammo']['plutonium-rounds-magazine'].subgroup = 'ir-ammo'
        data.raw['ammo']['plutonium-rounds-magazine'].order = 'c-q'
    end
end

if mods['SchallRadioactiveWaste'] then
    ---@diagnostic disable: undefined-global
    SchallRadioactiveWaste_add_incineration_recipe('used-up-MOX-fuel', 22.3, 0.9)
    SchallRadioactiveWaste_add_incineration_recipe('used-up-breeder-fuel-cell', 45.0, 1.5)
    SchallRadioactiveWaste_add_incineration_recipe('plutonium-238', 3, 0.85)
    SchallRadioactiveWaste_add_incineration_recipe('plutonium-239', 700, 0.85)

    SchallRadioactiveWaste_add_radioactive_effects('plutonium-atomic-rocket', 84, 2.8, 70)

    --[[
    if data.raw['artillery-projectile']['plutonium-atomic-artillery-projectile'] then
        SchallRadioactiveWaste_add_radioactive_effects('plutonium-atomic-artillery-projectile', 84, 2.8, 70)
    end
    if data.raw['artillery-projectile']['Schall-atomic-artillery-projectile'] then
        SchallRadioactiveWaste_add_radioactive_effects('Schall-plutonium-atomic-artillery-projectile', 84, 2.8, 70)
    end
    ]]
end

-- check for tech prerequisites

if not data.raw['technology']['kovarex-enrivhment-process'] then
    table.remove(data.raw['technology']['nuclear-breeding'].prerequisites, 2)
end
