data.raw['item']['MOX-fuel'].icon = '__PlutoniumEnergy__/graphics/icons/MOX-fuel.png'

if mods['bobplates'] then
    -- Disable some recipes
    data.raw['technology']['plutonium-enrichment-process'].hidden = true
    -- I'll leave this here just in case, although this shouldn't be required
    if data.raw['technology']['plutonium-atomic-bomb'] then
        data.raw['technology']['plutonium-atomic-bomb'].prerequisites = {'atomic-bomb'}
    end
    --data.raw['technology']['plutonium-processing'].effects = {} -- Broken. Why did I do this in the first place?
end

if mods['IndustrialRevolution'] then
    data.raw['ammo']['plutonium-rounds-magazine'].subgroup = 'ir2-ammo'
    data.raw['item']['plutonium-238'].subgroup = 'pure'
    data.raw['item']['plutonium-239'].subgroup = 'pure'
    data.raw['item']['plutonium-fuel'].subgroup = 'ir2-fuels'
    data.raw['item']['MOX-fuel'].order = 'ib'
    data.raw['item']['plutonium-fuel'].order = 'fb'
    data.raw['item']['used-up-MOX-fuel'].order = 'r[used-up-uranium-fuel-cell]-b'

    -- IR2 compat was moved here
    data.raw['technology']['plutonium-ammo'].unit.count = 2000
    data.raw['technology']['plutonium-ammo'].unit.time = 60
    table.insert(data.raw['technology']['plutonium-ammo'].unit.ingredients, {'utility-science-pack', 1})

    data.raw['technology']['plutonium-atomic-bomb'] = {{type='recipe', recipe='plutonium-atomic-artillery-shell'}}
end
