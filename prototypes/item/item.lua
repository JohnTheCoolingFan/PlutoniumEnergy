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

--integration
if not mods["Advanced-Atomics"] then
	data:extend({
	{
		type = "item",
		name = "plutonium-239",
		icon = "__PlutoniumEnergy__/graphics/icons/plutonium-239.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "g[plutonium-239]",
		stack_size = 100
	}
	})
else
	data.raw["recipe"]["plutonium-nucleosynthesis"].results =
    {
	  {
	    name = "plutonium-238",
	    probability = 0.3,
		amount = 5
	  },
      {
        name = "plutonium-239",
        probability = 0.1,
        amount = 3
      },
      {
        name = "uranium-238",
        probability = 0.6,
        amount = 5
      },
      {
        name = "uranium-235",
        probability = 0.99,
        amount = 42
      }
    }
end
data:extend({
	--machines
	{
		type = "item",
		name = "pluto-centrifuge",
		icon = "__PlutoniumEnergy__/graphics/icons/pluto-centrifuge.png",
		icon_size = 32,
		flags = {"goes-to-quickbar"},
		subgroup = "production-machine",
		order = "g[pluto-centrifuge]",
		place_result = "pluto-centrifuge",
		stack_size = 50
	},
	--resources
	{
		type = "item",
		name = "raw-plutonium",
		icon = "__PlutoniumEnergy__/graphics/icons/raw-plutonium.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		subgroup = "raw-resource",
		order = "g[raw-plutonium]",
		stack_size = 50
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
	--Cells
	{
		type = "item",
		name = "plutonium-fuel-cell",
		icon = "__PlutoniumEnergy__/graphics/icons/plutonium-fuel-cell.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "r[plutonium-processing]-a[plutonium-fuel-cell]",
		fuel_category = "nuclear",
		burnt_result = "used-up-plutonium-fuel-cell",
		fuel_value = "12GJ",
		stack_size = 50
	},
	
	{
		type = "item",
		name = "used-up-plutonium-fuel-cell",
		icon = "__PlutoniumEnergy__/graphics/icons/used-up-plutonium-fuel-cell.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "i[used-up-plutonium-fuel-cell]",
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