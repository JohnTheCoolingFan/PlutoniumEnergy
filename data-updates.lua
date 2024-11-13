if mods['IndustrialRevolution3'] then
    require('compat.IndustrialRevolution3.main')
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

if data.raw['item']['fusion-power-cell'] then
    data.raw['item']['fusion-power-cell'].icon = "__PlutoniumEnergy__/graphics/icons/fusion-power-cell.png"
end
