-- TODO: redo reactor graphics with new glow.

require "util"
local entities = {}

local MOX_reactor = util.table.deepcopy(data.raw["reactor"]["nuclear-reactor"])

MOX_reactor.name = "MOX-reactor"
MOX_reactor.icon = "__PlutoniumEnergy__/graphics/icons/MOX-reactor.png"
MOX_reactor.icon_size = 64
MOX_reactor.icon_mipmaps = 4
MOX_reactor.minable.result = "MOX-reactor"
MOX_reactor.max_health = 400
MOX_reactor.corpse = 'MOX-reactor-remnants'

MOX_reactor.consumption = "20MW"
MOX_reactor.energy_source.fuel_category = "MOX"

MOX_reactor.collision_box = {{-1.2, -1.2}, {1.2, 1.2}}
MOX_reactor.selection_box = {{-1.45, -1.45}, {1.45, 1.45}}

MOX_reactor.next_upgrade = nil

local lower_layer = MOX_reactor.lower_layer_picture
lower_layer.filename = "__PlutoniumEnergy__/graphics/entity/MOX-reactor/MOX-reactor-pipes.png"
lower_layer.width = 96
lower_layer.height = 92
lower_layer.hr_version.filename = "__PlutoniumEnergy__/graphics/entity/MOX-reactor/hr-MOX-reactor-pipes.png"
lower_layer.hr_version.width = 192
lower_layer.hr_version.height = 192

MOX_reactor.heat_lower_layer_picture.layers[1].filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/MOX-reactor-pipes-heated.png'
MOX_reactor.heat_lower_layer_picture.layers[1].width = 96
MOX_reactor.heat_lower_layer_picture.layers[1].height = 96
MOX_reactor.heat_lower_layer_picture.layers[1].hr_version.filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/hr-MOX-reactor-pipes-heated.png'
MOX_reactor.heat_lower_layer_picture.layers[1].hr_version.width = 192
MOX_reactor.heat_lower_layer_picture.layers[1].hr_version.height = 192

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

--MOX_reactor.light.color = {r = 0.0, g = 0.82, b = 0.9}

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

MOX_reactor.heat_buffer.heat_picture.layers[1].scale = 0.6
MOX_reactor.heat_buffer.heat_picture.layers[1].hr_version.scale = 0.3
--MOX_reactor.heat_buffer.heat_glow.scale = 0.6

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
