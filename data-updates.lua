if mods['bobplates'] then
    -- Disable some recipes
    data.raw['technology']['plutonium-enrichment-process'].hidden = true
    -- I'll leave this here just in case, although this shouldn't be required
    if data.raw['technology']['plutonium-atomic-bomb'] then
        data.raw['technology']['plutonium-atomic-bomb'].prerequisites = { 'atomic-bomb' }
    end
    --data.raw['technology']['plutonium-processing'].effects = {} -- Broken. Why did I do this in the first place?
end

if mods['IndustrialRevolution3'] then
    if data.raw['technology']['plutonium-ammo'] then
        data.raw['technology']['plutonium-ammo'].unit.count = 2000
        data.raw['technology']['plutonium-ammo'].unit.time = 60
    end

    if data.raw['technology']['plutonium-atomic-bomb'] then
        -- Note to future self: atomic bombs are replaced by artillery shells in IR2
        data.raw['technology']['plutonium-atomic-bomb'].effects = {
            { type = 'unlock-recipe', recipe = 'plutonium-atomic-artillery-shell' } }
    end

    -- IR3 removes uranium-fuel, not a usable fuel for vehicles
    data.raw['recipe']['plutonium-fuel'].hidden = true
    data.raw['recipe']['plutonium-fuel'].enabled = false

    for index, effect in pairs(data.raw['technology']['plutonium-enrichment-process'].effects) do
        if effect.recipe == "plutonium-fuel" then
            table.remove(data.raw['technology']['plutonium-enrichment-process'].effects, index)
        end
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

    -- assign IR3 subgroups
    data.raw['recipe']['MOX-reactor'].subgroup = "ir-nuclear-machines"
    data.raw['recipe']['MOX-reactor'].order = "f[nuclear-energy]-a[reactor]"

    data.raw['item']['MOX-reactor'].subgroup = "ir-nuclear-machines"
    data.raw['item']['MOX-reactor'].order = "f[nuclear-energy]-a[reactor]"

    data.raw['recipe']['breeder-reactor'].subgroup = "ir-nuclear-machines"
    data.raw['recipe']['breeder-reactor'].order = "f[nuclear-energy]-a[reactor]"

    data.raw['item']['breeder-reactor'].subgroup = "ir-nuclear-machines"
    data.raw['item']['breeder-reactor'].order = "f[nuclear-energy]-a[reactor]"

    data.raw['recipe']['MOX-fuel'].subgroup = "intermediate-product"
    data.raw['recipe']['MOX-fuel'].order = "r[uranium-processing]-e[MOX-fuel-processing]"

    data.raw['item']['MOX-fuel'].subgroup = "intermediate-product"
    data.raw['item']['MOX-fuel'].order = "r[uranium-processing]-e[MOX-fuel-processing]"

    data.raw['item']['used-up-MOX-fuel'].subgroup = "intermediate-product"
    data.raw['item']['used-up-MOX-fuel'].order = 'r[used-up-uranium-fuel-cell]-b'

    data.raw['recipe']['plutonium-rounds-magazine'].subgroup = 'ir-ammo'
    data.raw['recipe']['plutonium-rounds-magazine'].order = 'c-q'

    data.raw['ammo']['plutonium-rounds-magazine'].subgroup = 'ir-ammo'
    data.raw['ammo']['plutonium-rounds-magazine'].order = 'c-q'
end

if mods['SchallRadioactiveWaste'] then
    ---@diagnostic disable: undefined-global
    SchallRadioactiveWaste_add_incineration_recipe('used-up-MOX-fuel', 22.3, 0.9)
    SchallRadioactiveWaste_add_incineration_recipe('plutonium-238', 3, 0.85)
    SchallRadioactiveWaste_add_incineration_recipe('plutonium-239', 700, 0.85)

    SchallRadioactiveWaste_add_radioactive_effects('plutonium-atomic-rocket', 84, 2.8, 70)
    if data.raw['artillery-projectile']['plutonium-atomic-artillery-projectile'] then
        SchallRadioactiveWaste_add_radioactive_effects('plutonium-atomic-artillery-projectile', 84, 2.8, 70)
    end
    if data.raw['artillery-projectile']['Schall-atomic-artillery-projectile'] then
        SchallRadioactiveWaste_add_radioactive_effects('Schall-plutonium-atomic-artillery-projectile', 84, 2.8, 70)
    end
end
