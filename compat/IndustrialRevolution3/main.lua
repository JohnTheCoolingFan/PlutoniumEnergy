log("Applying Industrial Revolution 3 compatibility tweaks")

-- Tweak Plutonium Ammo technology cost
if data.raw['technology']['plutonium-ammo'] then
    data.raw['technology']['plutonium-ammo'].unit.count = 2000
    data.raw['technology']['plutonium-ammo'].unit.time = 60
end

-- Tweak the shell icon to be consistent with IR3
data.raw['ammo']['plutonium-atomic-artillery-shell'].icon =
'__PlutoniumEnergy__/graphics/icons/plutonium-atomic-artillery-shell-IR3.png'

require('barrelling')
require('subgroup-and-order')
