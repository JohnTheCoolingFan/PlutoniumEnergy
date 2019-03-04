require "util"
local entities = {}

local MOX_reactor = util.table.deepcopy(data.raw["reactor"]["nuclear-reactor"])
MOX_reactor.name = "MOX-reactor"
MOX_reactor.icon = "__PlutoniumEnergy__/graphics/icons/MOX-reactor.png"
MOX_reactor.minable.result = "MOX-reactor"
MOX_reactor.minable.mining_time = 1
MOX_reactor.max_health = 400
MOX_reactor.consumption = "20MW"
MOX_reactor.energy_source.fuel_category = "MOX"
MOX_reactor.collision_box = {{-1.2, -1.2}, {1.2, 1.2}}
MOX_reactor.selection_box = {{-1.45, -1.45}, {1.45, 1.45}}
local lower_layer = MOX_reactor.lower_layer_picture
lower_layer.filename = "__PlutoniumEnergy__/graphics/entity/MOX-reactor/MOX-reactor-pipes.png"
lower_layer.width = 96
lower_layer.height = 92
lower_layer.hr_version.filename = "__PlutoniumEnergy__/graphics/entity/MOX-reactor/hr-MOX-reactor-pipes.png"
lower_layer.hr_version.width = 192
lower_layer.hr_version.height = 192
MOX_reactor.picture.layers[1].scale = 0.6
MOX_reactor.picture.layers[1].hr_version.scale = 0.3
MOX_reactor.picture.layers[2].scale = 0.6
MOX_reactor.picture.layers[2].hr_version.scale = 0.3
MOX_reactor.working_light_picture.filename = "__PlutoniumEnergy__/graphics/entity/MOX-reactor/MOX-reactor-lights-color.png"
MOX_reactor.working_light_picture.scale = 0.6
MOX_reactor.working_light_picture.hr_version.filename = "__PlutoniumEnergy__/graphics/entity/MOX-reactor/hr-MOX-reactor-lights-color.png"
MOX_reactor.working_light_picture.hr_version.scale = 0.3
MOX_reactor.light.color = {r = 0.0, g = 0.15, b = 1.0}
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
patches_pic_con.variation_count = 12
patches_pic_con.hr_version.filename = "__PlutoniumEnergy__/graphics/entity/MOX-reactor/hr-MOX-reactor-connect-patches.png"
patches_pic_con.hr_version.variation_count = 12
local patches_pic_discon = MOX_reactor.connection_patches_disconnected.sheet
patches_pic_discon.filename = "__PlutoniumEnergy__/graphics/entity/MOX-reactor/MOX-reactor-connect-patches.png"
patches_pic_discon.variation_count = 12
patches_pic_discon.hr_version.filename = "__PlutoniumEnergy__/graphics/entity/MOX-reactor/hr-MOX-reactor-connect-patches.png"
patches_pic_discon.hr_version.variation_count = 12
table.insert(entities, MOX_reactor)

local industrial_reactor = util.table.deepcopy(data.raw["assembling-machine"]["centrifuge"])
industrial_reactor.name = "industrial-reactor"
industrial_reactor.icon = "__PlutoniumEnergy__/graphics/icons/industrial-reactor.png"
industrial_reactor.crafting_categories = {"alpha-decay", "nucleosynthesis", "excess-neutron-capture"}
industrial_reactor.energy_usage = "420kW"
industrial_reactor.module_specification.module_slots = 4
industrial_reactor.working_visualisations[1].light.color = {r = 0.0, g = 0.15, b = 1.0}
industrial_reactor.minable.result = "industrial-reactor"
indreact_anim = industrial_reactor.animation.layers
indreact_anim[1].filename = "__PlutoniumEnergy__/graphics/entity/industrial-reactor/industrial-reactor-C-light.png"
indreact_anim[1].hr_version.filename = "__PlutoniumEnergy__/graphics/entity/industrial-reactor/hr-industrial-reactor-C-light.png"
indreact_anim[2].filename = "__PlutoniumEnergy__/graphics/entity/industrial-reactor/industrial-reactor-B-light.png"
indreact_anim[2].hr_version.filename = "__PlutoniumEnergy__/graphics/entity/industrial-reactor/hr-industrial-reactor-B-light.png"
indreact_anim[3].filename = "__PlutoniumEnergy__/graphics/entity/industrial-reactor/industrial-reactor-A-light.png"
indreact_anim[3].hr_version.filename = "__PlutoniumEnergy__/graphics/entity/industrial-reactor/hr-industrial-reactor-A-light.png"
table.insert(entities, industrial_reactor)

data:extend(entities)
