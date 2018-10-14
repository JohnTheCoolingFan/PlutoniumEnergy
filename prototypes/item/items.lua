--[[
Copyright (C) 2018  John The Cooling Fan

This file is part of Plutonium Energy

Plutonium Energy is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Plutonium Energy is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
--]]

data:extend({
	--common resources
	{
		type = "item",
		name = "plutonium-239",
		icon = "__PlutoniumEnergy__/graphics/icons/plutonium-239.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "g[plutonium-239]",
		stack_size = 100
	},
	{
		type = "item",
		name = "plutonium-238",
		icon = "__PlutoniumEnergy__/graphics/icons/plutonium-238.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "g[plutonium-238]",
		stack_size = 100
	},
	--[[{ Unused items.
		type = "item",
		name = "plutonium-dioxide",
		icon = "__PlutoniumEnergy__/graphics/icons/raw-plutonium.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "g[plutonium-dioxide]",
		stack_size = 100
	},
	{
		type = "item",
		name = "uranium-dioxide",
		icon = "__PlutoniumEnergy__/graphics/icons/raw-plutonium.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "g[uranium-dioxide]",
		stack_size = 100
	},
	{
		type = "item",
		name = "iodine",
		icon = "__PlutoniumEnergy__/graphics/icons/iodine.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "g[iodine]",
		stack_size = 100
	},]]
	
	--MOX fuel
	{
		type = "item",
		name = "MOX-fuel",
		icon = "__PlutoniumEnergy__/graphics/icons/MOX-fuel.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "r[plutonium-processing]-b[MOX-fuel]",
		fuel_category = "MOX",
		burnt_result = "used-up-MOX-fuel",
		fuel_value = "12GJ",
		stack_size = 50
	},
	{
		type = "item",
		name = "used-up-MOX-fuel",
		icon = "__PlutoniumEnergy__/graphics/icons/used-up-MOX-fuel.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "i[used-up-MOX-fuel]",
		stack_size = 50
	},
	
	--machines
	{
		type = "item",
		name = "MOX-reactor",
		icon = "__PlutoniumEnergy__/graphics/icons/MOX-reactor.png",
		icon_size = 32,
		flags = {"goes-to-quickbar"},
		subgroup = "energy",
		order = "f[nuclear-energy]-b[MOX-reactor]",
		place_result = "MOX-reactor",
		stack_size = 10
	},
	{
		type = "item",
		name = "industrial-reactor",
		icon = "__PlutoniumEnergy__/graphics/icons/industrial-reactor.png",
		icon_size = 32,
		flags = {"goes-to-quickbar"},
		subgroup = "production-machine",
		order = "g[industrial-reactor]",
		place_result = "industrial-reactor",
		stack_size = 50
	},
	
	--ammo
	{
		type = "ammo",
		name = "plutonium-rounds-magazine",
		icon = "__PlutoniumEnergy__/graphics/icons/plutonium-rounds-magazine.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		ammo_type =
		{
			category = "bullet",
			action =
			{
				type = "direct",
				action_delivery =
				{
					type = "instant",
					source_effects =
					{
						type = "create-explosion",
						entity_name = "explosion-gunshot"
					},
					target_effects =
					{
						{
							type = "create-entity",
							entity_name = "explosion-hit"
						},
						{
							type = "damage",
							damage = { amount = 36, type = "physical"}
						}
					}
				}
			}
		},
		magazine_size = 10,
		subgroup = "ammo",
		order = "a[basic-clips]-c[uranium-rounds-magazine]",
		stack_size = 200
	},
	{
		type = "ammo",
		name = "plutonium-cannon-shell",
		icon = "__PlutoniumEnergy__/graphics/icons/plutonium-cannon-shell.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		ammo_type =
		{
			category = "cannon-shell",
			target_type = "direction",
			action =
			{
				type = "direct",
				action_delivery =
				{
					type = "projectile",
					projectile = "plutonium-cannon-projectile",
					starting_speed = 1,
					direction_deviation = 0.1,
					range_deviation = 0.1,
					max_range = 35,
					source_effects =
					{
						type = "create-explosion",
						entity_name = "explosion-gunshot"
					}
				}
			}
		},
		subgroup = "ammo",
		order = "d[cannon-shell]-c[uranium]",
		stack_size = 200
	},
	{
		type = "ammo",
		name = "explosive-plutonium-cannon-shell",
		icon = "__PlutoniumEnergy__/graphics/icons/explosive-plutonium-cannon-shell.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		ammo_type =
		{
			category = "cannon-shell",
			target_type = "direction",
			action =
			{
				type = "direct",
				action_delivery =
				{
					type = "projectile",
					projectile = "explosive-plutonium-cannon-projectile",
					starting_speed = 1,
					direction_deviation = 0.1,
					range_deviation = 0.1,
					max_range = 35,
					source_effects =
					{
						type = "create-explosion",
						entity_name = "explosion-gunshot"
					}
				}
			}
		},
		subgroup = "ammo",
		order = "d[explosive-cannon-shell]-c[uranium]",
		stack_size = 200
	},
	{
		type = "ammo",
		name = "plutonium-atomic-bomb",
		icon = "__PlutoniumEnergy__/graphics/icons/plutonium-atomic-bomb.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		ammo_type =
		{
			range_modifier = 5,
			cooldown_modifier = 2.5,
			target_type = "position",
			category = "rocket",
			action =
			{
				type = "direct",
				action_delivery =
				{
					type = "projectile",
					projectile = "plutonium-atomic-rocket",
					starting_speed = 0.05,
					source_effects =
					{
						type = "create-entity",
						entity_name = "explosion-hit"
					}
				}
			}
		},
		subgroup = "ammo",
		order = "d[rocket-launcher]-c[atomic-bomb]",
		stack_size = 10
	}
})