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
	{
		type = "recipe",
		name = "pluto-centrifuge",
		energy_required = 4,
		enabled = false,
		ingredients =
		{
			{"concrete", 120},
			{"steel-plate", 70},
			{"advanced-circuit", 110},
			{"iron-gear-wheel", 110},
		},
		result = "pluto-centrifuge",
		requester_paste_multiplier= 2
	},
	
	{
		type = "recipe",
		name = "plutonium-fuel-reprocessing",
		energy_required = 50,
		enabled = false,
		category = "pluto-centrifuging",
		ingredients =
			{
				{"used-up-plutonium-fuel-cell", 5}
			},
		icon = "__PlutoniumEnergy__/graphics/icons/plutonium-fuel-reprocessing.png",
		icon_size = 32,
		subgroup = "intermediate-product",
		order = "r[plutonium-processing]-b[plutonium-fuel-reprocessing]",
		main_product = "",
		results =
			{
				{
					name = "plutonium-238",
					amount = 3
				}
			},
		allow_decomposition = false
	},
	
	{
		type = "recipe",
		name = "plutonium-fuel-cell",
		energy_required = 10,
		enabled = false,
		ingredients =
			{
				{"iron-plate", 10},
				{"plutonium-239", 1},
				{"plutonium-238", 19}
			},
		result = "plutonium-fuel-cell",
		result_count = 10
	},
	
	{
		type = "recipe",
		name = "JohnTheCF-enrichment-process",
		energy_required = 50,
		enabled = false,
		category = "pluto-centrifuging",
		ingredients = {{"plutonium-239", 40}, {"plutonium-238", 5}},
		icon = "__PlutoniumEnergy__/graphics/icons/JohnTheCF-enrichment-process.png",
		icon_size = 32,
		subgroup = "intermediate-product",
		order = "r[plutonium-processing]-c[JohnTheCF-enrichment-process]",
		main_product = "",
		results =
		{
				{
					name = "plutonium-239",
					amount = 41
				},
				{
					name = "plutonium-238",
					amount = 2
				}
		},
		allow_decomposition = false
	},
	
	{
    type = "recipe",
    name = "plutonium-processing",
    energy_required = 10,
    enabled = false,
    category = "pluto-centrifuging",
    ingredients = {{"raw-plutonium", 10}},
    icon = "__PlutoniumEnergy__/graphics/icons/plutonium-processing.png",
	icon_size = 32,
    subgroup = "raw-material",
    order = "h[plutonium-processing]",
    results =
		{
			{
				name = "plutonium-239",
			probability = 0.007,
			amount = 1
			},
			{
				name = "plutonium-238",
				probability = 0.993,
				amount = 1
			}
		}
	},
	--ammo
	{
    type = "recipe",
    name = "plutonium-rounds-magazine",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"piercing-rounds-magazine", 1},
      {"plutonium-239", 1}
    },
    result = "plutonium-rounds-magazine"
	},
	{
    type = "recipe",
    name = "plutonium-atomic-bomb",
    enabled = false,
    energy_required = 50,
    ingredients =
    {
      {"processing-unit", 20},
      {"explosives", 10},
      {"plutonium-238", 30}
    },
    result = "plutonium-atomic-bomb"
	},
	{
    type = "recipe",
    name = "plutonium-cannon-shell",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"cannon-shell", 1},
      {"plutonium-239", 1}
    },
    result = "plutonium-cannon-shell"
	},
	{
    type = "recipe",
    name = "explosive-plutonium-cannon-shell",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"explosive-cannon-shell", 1},
      {"plutonium-239", 1}
    },
    result = "explosive-plutonium-cannon-shell"
	}
})