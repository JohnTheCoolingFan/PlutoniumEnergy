data.raw['item']['MOX-fuel'].icon = '__PlutoniumEnergy__/graphics/icons/MOX-fuel.png'

if mods['bobplates'] then
    -- Disable some recipes
    table.remove(data.raw['technology']['plutonium-processing'].effects, 2)
    table.remove(data.raw['technology']['plutonium-processing'].effects, 4)
    table.remove(data.raw['technology']['MOX-fuel-reprocessing'].effects, 2)

    -- Change recipes ingredients/results
    data.raw['recipe']['MOX-fuel'].ingredients[3][1] = 'plutonium-239'
    data.raw['recipe']['MOX-fuel-reprocessing'].results[1].name = 'plutonium-239'

    -- Ammo
    data.raw['recipe']['plutonium-atomic-bomb'].ingredients[3][1] = 'plutonium-239'
end

if settings.startup['PE-disable-MOX-reactor'].value then data.raw['item']['MOX-fuel'].feul_category = 'nuclear' end
