data.raw['item']['MOX-fuel'].icon = '__PlutoniumEnergy__/graphics/icons/MOX-fuel.png'

if mods['bobplates'] then
    -- Disable some recipes
    data.raw['technology']['plutonium-processing'].effects.remove(2)
    data.raw['technology']['plutonium-processing'].effects.remove(4)
    data.raw['technology']['MOX-fuel-reprocessing'].effects.remove(2)

    -- Change recipes ingredients/results
    data.raw['recipe']['MOX-fuel'].ingredients[3][1] = 'plutonium-239'
    data.raw['recipe']['MOX-fuel-reprocessing'].results[1].name = 'plutinium-239'

    -- Ammo
    data.raw['recipe']['plutonium-atomic-bomb'].ingredients[3][1] = 'plutonium-239'
end
