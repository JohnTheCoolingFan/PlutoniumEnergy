data.raw['item']['MOX-fuel'].icon = '__PlutoniumEnergy__/graphics/icons/MOX-fuel.png'

if mods['bobplates'] then
    -- Disable some recipes
    data.raw['technology']['plutonium-enrichment-process'].hidden = true
    data.raw['technology']['plutonium-atomic-bomb'].prerequisites = {'atomic-bomb'}
    --data.raw['technology']['plutonium-processing'].effects = {} -- Broken. Why did I do this in the first place?
end
