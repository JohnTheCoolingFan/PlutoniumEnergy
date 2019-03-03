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

--[[
{
    type = "reactor",
    name = "nuclear-reactor",
    icon  = "__base__/graphics/icons/nuclear-reactor.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "nuclear-reactor"},
    max_health = 500,
    corpse = "big-remnants",
    consumption = "40MW",
    neighbour_bonus = 1,
    energy_source =
    {
      type = "burner",
      fuel_category = "nuclear",
      effectivity = 1,
      fuel_inventory_size = 1,
      burnt_inventory_size = 1
    },
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    --the collision box of a reactor is increased by this on the sides where it connects to another reactor:
    --neighbour_collision_increase = 0.25,
    lower_layer_picture =
    {
      filename = "__base__/graphics/entity/nuclear-reactor/reactor-pipes.png",
      width = 160,
      height = 160,
      shift = { -0.03125, -0.1875 },
      hr_version =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-pipes.png",
        width = 320,
        height = 320,
        scale = 0.5,
        shift = { -0.03125, -0.1875 }
      }
    },

    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/nuclear-reactor/reactor.png",
          width = 160,
          height = 160,
          shift = { -0.03125, -0.1875 },
          hr_version =
          {
            filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor.png",
            width = 320,
            height = 320,
            scale = 0.5,
            shift = { -0.03125, -0.1875 }
          }
        },
        {
          filename = "__base__/graphics/entity/nuclear-reactor/reactor-shadow.png",
          width = 263,
          height = 162,
          shift = { 1.625 , 0 },
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-shadow.png",
            width = 525,
            height = 323,
            scale = 0.5,
            shift = { 1.625, 0 },
            draw_as_shadow = true
          }
        }
      }
    },

    working_light_picture =
    {
      filename = "__base__/graphics/entity/nuclear-reactor/reactor-lights-color.png",
      width = 160,
      height = 160,
      shift = { -0.03125, -0.1875 },
      blend_mode = "additive",
      hr_version =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-lights-color.png",
        width = 320,
        height = 320,
        scale = 0.5,
        shift = { -0.03125, -0.1875 },
        blend_mode = "additive"
      }
    },

    light = {intensity = 0.6, size = 9.9, shift = {0.0, 0.0}, color = {r = 0.0, g = 1.0, b = 0.0}},

    heat_buffer =
    {
      max_temperature = 1000,
      specific_heat = "10MJ",
      max_transfer = "10GW",
      connections =
      {
        {
          position = {-2, -2},
          direction = defines.direction.north
        },
        {
          position = {0, -2},
          direction = defines.direction.north
        },
        {
          position = {2, -2},
          direction = defines.direction.north
        },
        {
          position = {2, -2},
          direction = defines.direction.east
        },
        {
          position = {2, 0},
          direction = defines.direction.east
        },
        {
          position = {2, 2},
          direction = defines.direction.east
        },
        {
          position = {2, 2},
          direction = defines.direction.south
        },
        {
          position = {0, 2},
          direction = defines.direction.south
        },
        {
          position = {-2, 2},
          direction = defines.direction.south
        },
        {
          position = {-2, 2},
          direction = defines.direction.west
        },
        {
          position = {-2, 0},
          direction = defines.direction.west
        },
        {
          position = {-2, -2},
          direction = defines.direction.west
        }
      }
    },

    connection_patches_connected =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches.png",
        width = 32,
        height = 32,
        variation_count = 12,
        hr_version =
        {
          filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-connect-patches.png",
          width = 64,
          height = 64,
          variation_count = 12,
          scale = 0.5
        }
      }
    },

    connection_patches_disconnected =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches.png",
        width = 32,
        height = 32,
        variation_count = 12,
        y = 32,
        hr_version =
        {
          filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-connect-patches.png",
          width = 64,
          height = 64,
          variation_count = 12,
          y = 64,
          scale = 0.5
        }
      }
    },

    connection_patches =
    {
      north =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/connection-patch-north.png",
        width = 160,
        height = 15,
        shift = util.by_pixel(0, -72.5)
      },
      east =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/connection-patch-east.png",
        width = 15,
        height = 160,
        shift = util.by_pixel(72.5, 0)
      },
      south =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/connection-patch-south.png",
        width = 160,
        height = 15,
        shift = util.by_pixel(0, 72.5)
      },
      west =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/connection-patch-west.png",
        width = 15,
        height = 160,
        shift = util.by_pixel(-72.5, 0)
      }
    },

    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},

    meltdown_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
              repeat_count = 100,
              type = "create-trivial-smoke",
              smoke_name = "nuclear-smoke",
              offset_deviation = {{-1, -1}, {1, 1}},
              starting_frame = 3,
              starting_frame_deviation = 5,
              starting_frame_speed = 0,
              starting_frame_speed_deviation = 5,
              speed_from_center = 0.5
          },
          {
            type = "create-entity",
            entity_name = "explosion"
          },
          {
            type = "damage",
            damage = {amount = 400, type = "explosion"}
          },
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              target_entities = false,
              trigger_from_target = true,
              repeat_count = 2000,
              radius = 35,
              action_delivery =
              {
                type = "projectile",
                projectile = "atomic-bomb-wave",
                starting_speed = 0.5
              }
            }
          }
        }
      }
    }
  }
--]]

local industrial_reactor = util.table.deepcopy(data.raw["assembling-machine"]["centrifuge"])
industrial_reactor.name = "industrial-reactor"
industrial_reactor.icon = "__PlutoniumEnergy__/graphics/icons/industrial-reactor.png"
industrial_reactor.crafting_categories = {"alpha-decay", "nucleosynthesis", "excess-neutron-capture"}
industrial_reactor.energy_usage = "420kW"
industrial_reactor.module_specification.module_slots = 4
industrial_reactor.working_visualisations[1].light.color = {r = 0.0, g = 0.15, b = 1.0}
industrial_reactor.minable.result = "industrial-reactor"
industrial_reactor.animation =
{
	layers =
	{
		-- C part
		{
			filename = "__PlutoniumEnergy__/graphics/entity/industrial-reactor/industrial-reactor-C-light.png",
			priority = "high",
			blend_mode = "additive",
			line_length = 8,
			width = 96,
			height = 104,
			frame_count = 64,
			shift = util.by_pixel(0, -27),

			hr_version =
			{
				filename = "__PlutoniumEnergy__/graphics/entity/industrial-reactor/hr-industrial-reactor-C-light.png",
				priority = "high",
				scale = 0.5,
				blend_mode = "additive",
				line_length = 8,
				width = 190,
				height = 207,
				frame_count = 64,
				shift = util.by_pixel(0, -27.25),
			}
		},
		-- B part
		{
			filename = "__PlutoniumEnergy__/graphics/entity/industrial-reactor/industrial-reactor-B-light.png",
			priority = "high",
			blend_mode = "additive",
			line_length = 8,
			width = 65,
			height = 103,
			frame_count = 64,
			shift = util.by_pixel(16.5, 0.5),
			hr_version =
			{
				filename = "__PlutoniumEnergy__/graphics/entity/industrial-reactor/hr-industrial-reactor-B-light.png",
				priority = "high",
				scale = 0.5,
				blend_mode = "additive",
				line_length = 8,
				width = 131,
				height = 206,
				frame_count = 64,
				shift = util.by_pixel(16.75, 0.5),
			}
		},
		-- A part
		{
			filename = "__PlutoniumEnergy__/graphics/entity/industrial-reactor/industrial-reactor-A-light.png",
			priority = "high",
			blend_mode = "additive",
			line_length = 8,
			width = 55,
			height = 98,
			frame_count = 64,
			shift = util.by_pixel(-23.5, -2),
			hr_version =
			{
				filename = "__PlutoniumEnergy__/graphics/entity/industrial-reactor/hr-industrial-reactor-A-light.png",
				priority = "high",
				scale = 0.5,
				blend_mode = "additive",
				line_length = 8,
				width = 108,
				height = 197,
				frame_count = 64,
				shift = util.by_pixel(-23.5, -1.75),
			}
		}
	}
}
table.insert(entities, industrial_reactor)
data:extend(entities)
