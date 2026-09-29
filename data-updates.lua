if mods['IndustrialRevolution3'] then
    require('compat.IndustrialRevolution3.main')
end

if mods['SchallRadioactiveWaste'] then
    require('compat.SchallRadioactiveWaste')
end

if mods["RealisticReactors"] then
    require('compat.RealisticReactors')
end

if mods['RITEG'] then
    require('compat.RITEG')
end

-- check for tech prerequisites

if not data.raw['technology']['kovarex-enrivhment-process'] then
    data.raw['technology']['plutonium-processing'].prerequisites[1] = 'uranium-processing'
end

--require('compat.nuclear-artillery')

if data.raw['item']['fusion-power-cell'] then
    data.raw['item']['fusion-power-cell'].icon = "__PlutoniumEnergy__/graphics/icons/fusion-power-cell.png"
end
