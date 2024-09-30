if mods['IndustrialRevolution3'] then
    require('compat.IndustrialRevolution3')
end

if mods['SchallRadioactiveWaste'] then
    require('compat.SchallRadioactiveWaste')
end

if mods["RealisticReactors"] then
    require('compat.RealisticReactors')
end

-- check for tech prerequisites

if not data.raw['technology']['kovarex-enrivhment-process'] then
    table.remove(data.raw['technology']['nuclear-breeding'].prerequisites, 2)
end

require('compat.nuclear-artillery')
