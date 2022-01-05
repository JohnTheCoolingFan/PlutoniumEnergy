-- TODO: redo reactor graphics with new glow.

require "util"

local entities = {}

local MOX_reactor = util.table.deepcopy(data.raw["reactor"]["nuclear-reactor"])

MOX_reactor.name = "MOX-reactor"
MOX_reactor.icon = "__PlutoniumEnergy__/graphics/icons/MOX-reactor.png"
MOX_reactor.minable.result = "MOX-reactor"
MOX_reactor.max_health = 400
MOX_reactor.corpse = 'MOX-reactor-remnants'

MOX_reactor.consumption = "20MW"
MOX_reactor.energy_source.fuel_category = "MOX"

MOX_reactor.collision_box = {{-1.2, -1.2}, {1.2, 1.2}}
MOX_reactor.selection_box = {{-1.5, -1.5}, {1.5, 1.5}}

--TODO: reexamine heat pipes sprites and maybe remake them, adjust shifts
local lower_layer = MOX_reactor.lower_layer_picture
lower_layer.filename = "__PlutoniumEnergy__/graphics/entity/MOX-reactor/MOX-reactor-pipes.png"
lower_layer.width = 96
lower_layer.height = 92
lower_layer.hr_version.filename = "__PlutoniumEnergy__/graphics/entity/MOX-reactor/hr-MOX-reactor-pipes.png"
lower_layer.hr_version.width = 192
lower_layer.hr_version.height = 192


-- Might error because uses local variables
MOX_reactor.heat_lower_layer_picture = apply_heat_pipe_glow
{
    filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/MOX-reactor-pipes-heated.png',
    width = 96,
    height = 96,
    shift = util.by_pixel(-3, -4),
    hr_version = {
        filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/hr-MOX-reactor-pipes-heated.png',
        width = 192,
        height = 192,
        scale = 0.5,
        shift = util.by_pixel(-0.5, -4.5)
    }
}
MOX_reactor.heat_buffer.heat_picture = apply_heat_pipe_glow
{
    filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/MOX-reactor-pipes-heated.png',
    width = 96,
    height = 96,
    shift = util.by_pixel(1, -7),
    hr_version = {
        filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/hr-MOX-reactor-pipes-heated.png',
        width = 192,
        height = 192,
        scale = 0.5,
        shift = util.by_pixel(3, -6.5)
    }
}

MOX_reactor.picture.layers[1].scale = 0.6
MOX_reactor.picture.layers[1].shift = util.by_pixel(-4, -6)
MOX_reactor.picture.layers[1].hr_version.scale = 0.3
MOX_reactor.picture.layers[1].hr_version.shift = util.by_pixel(-3, -7)
MOX_reactor.picture.layers[2].scale = 0.6
MOX_reactor.picture.layers[2].hr_version.scale = 0.3

MOX_reactor.working_light_picture.filename = "__PlutoniumEnergy__/graphics/entity/MOX-reactor/MOX-reactor-lights-color.png"
MOX_reactor.working_light_picture.scale = 0.6
MOX_reactor.working_light_picture.hr_version.filename = "__PlutoniumEnergy__/graphics/entity/MOX-reactor/hr-MOX-reactor-lights-color.png"
MOX_reactor.working_light_picture.hr_version.scale = 0.3

MOX_reactor.heat_buffer.connections = {
    {
        position = {-1, -1},
        direction = defines.direction.north
    },
    {
        position = {1, -1},
        direction = defines.direction.north
    },
    {
        position = {1, -1},
        direction = defines.direction.east
    },
    {
        position = {1, 1},
        direction = defines.direction.east
    },
    {
        position = {1, 1},
        direction = defines.direction.south
    },
    {
        position = {-1, 1},
        direction = defines.direction.south
    },
    {
        position = {-1, 1},
        direction = defines.direction.west
    },
    {
        position = {-1, -1},
        direction = defines.direction.west
    }
}

local patches_pic_con = MOX_reactor.connection_patches_connected.sheet
patches_pic_con.filename = "__PlutoniumEnergy__/graphics/entity/MOX-reactor/MOX-reactor-connect-patches.png"
patches_pic_con.hr_version.filename = "__PlutoniumEnergy__/graphics/entity/MOX-reactor/hr-MOX-reactor-connect-patches.png"

local patches_pic_discon = MOX_reactor.connection_patches_disconnected.sheet
patches_pic_discon.filename = "__PlutoniumEnergy__/graphics/entity/MOX-reactor/MOX-reactor-connect-patches.png"
patches_pic_discon.hr_version.filename = "__PlutoniumEnergy__/graphics/entity/MOX-reactor/hr-MOX-reactor-connect-patches.png"

local patches_pic_con_heat = MOX_reactor.heat_connection_patches_connected.sheet
patches_pic_con_heat.layers[1].filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/MOX-reactor-connect-patches-heated.png'
patches_pic_con_heat.layers[1].hr_version.filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/hr-MOX-reactor-connect-patches-heated.png'

local patches_pic_discon_heat = MOX_reactor.heat_connection_patches_disconnected.sheet
patches_pic_discon_heat.layers[1].filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/MOX-reactor-connect-patches-heated.png'
patches_pic_discon_heat.layers[1].hr_version.filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/hr-MOX-reactor-connect-patches-heated.png'
table.insert(entities, MOX_reactor)


data:extend(entities)
