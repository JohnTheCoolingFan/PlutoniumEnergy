data.raw['item']['MOX-fuel'].icon = '__PlutoniumEnergy__/graphics/icons/MOX-fuel.png'

if mods['bobplates'] then
    -- Disable some recipes
    table.remove(data.raw['technology']['plutonium-processing'].effects, 2)
    table.remove(data.raw['technology']['plutonium-processing'].effects, 4)
    table.remove(data.raw['technology']['MOX-fuel-reprocessing'].effects, 2)
end
