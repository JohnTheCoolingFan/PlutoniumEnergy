-- This file patches the vanilla reactor to have a glow that is tinted based on fuel

-- Check if Realistic Reactor Glow is present, don't tweak if it is installed.
if not mods["RealisticReactorGlow"] then
    -- Patch reactor prototype

    local nuclear_reactor = data.raw['reactor']['nuclear-reactor']

    nuclear_reactor.working_light_picture.filename =
    '__PlutoniumEnergy__/graphics/entity/nuclear-reactor/reactor-lights.png'
    nuclear_reactor.working_light_picture.width = 320
    nuclear_reactor.working_light_picture.height = 320
    nuclear_reactor.working_light_picture.scale = 0.5

    nuclear_reactor.working_light_picture.hr_version.filename =
    '__PlutoniumEnergy__/graphics/entity/nuclear-reactor/reactor-lights.png'

    nuclear_reactor.use_fuel_glow_color = true               -- should use glow color from fuel item prototype as light color and tint for working_light_picture
    nuclear_reactor.default_fuel_glow_color = { 0, 1, 0, 0 } -- just green -- color used as working_light_picture tint for fuels that don't have glow color defined
    nuclear_reactor.working_light_picture.apply_runtime_tint = true
end
