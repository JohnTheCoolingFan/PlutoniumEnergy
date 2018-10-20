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

require "util"

local advanced_nuclear_fuel_reprocessing = util.table.deepcopy(data.raw["recipe"]["nuclear-fuel-reprocessing"])
advanced_nuclear_fuel_reprocessing.name = "advanced-nuclear-fuel-reprocessing"
advanced_nuclear_fuel_reprocessing.enabled = false
advanced_nuclear_fuel_reprocessing.ingredients = {{"used-up-uranium-fuel-cell", 10}}
advanced_nuclear_fuel_reprocessing.energy_required = 100
advanced_nuclear_fuel_reprocessing.results = {
	{
		name = "uranium-238",
		amount = 5
	},
	{
		name = "plutonium-239",
		amount = 2
	}
}
advanced_nuclear_fuel_reprocessing.order = "r[uranium-processing]-c[advanced-nuclear-fuel-reprocessing]"
advanced_nuclear_fuel_reprocessing.icon = "__PlutoniumEnergy__/graphics/icons/advanced-nuclear-fuel-reprocessing.png"
data:extend({advanced_nuclear_fuel_reprocessing})

data:extend({
	{
		type = "recipe",
		name = "plutonium-238-nuclesynthesis",
		localised_name = {"recipe-name.plutonium-238-nuclesynthesis"},
		energy_required = 10,
		enabled = false,
		category = "nucleosynthesis",
		ingredients = {{"uranium-238", 10}},
		icon = "__PlutoniumEnergy__/graphics/icons/plutonium-238-nucleosynthesis.png",
		icon_size = 32,
		subgroup = "raw-material",
		order = "l[plutonium-238-nuclesynthesis]",
		results =
		{
			{
				name = "plutonium-238",
				amount = 5
			}
		}
	},
	{
		type = "recipe",
		name = "plutonium-239-alpha-decay",
		localised_name = {"recipe-name.plutonium-239-alpha-decay"},
		energy_required = 10,
		enabled = false,
		category = "alpha-decay",
		ingredients = {{"plutonium-239", 5}},
		icon = "__PlutoniumEnergy__/graphics/icons/plutonium-239-alpha-decay.png",
		icon_size = 32,
		subgroup = "raw-material",
		order = "m[plutonium-239-decay]",
		results =
		{
			{
				name = "uranium-235",
				amount = 2
			}
		}
	},
	{
		type = "recipe",
		name = "uranium-238-excess-neutron-capture",
		localised_name = {"recipe-name.uranium-238-excess-neutron-capture"},
		energy_required = 10,
		enabled = false,
		category = "excess-neutron-capture",
		ingredients = {{"uranium-238", 10}},
		icon = "__PlutoniumEnergy__/graphics/icons/uranium-238-excess-neutron-capture.png",
		icon_size = 32,
		subgroup = "raw-material",
		order = "m[excess-neutron-capture]",
		results =
		{
			{
				name = "plutonium-239",
				amount = 2
			}
		}
	},
	{
		type = "recipe",
		name = "MOX-fuel",
		energy_required = 10,
		enabled = false,
		ingredients =
		{
			{"iron-plate", 10},
			{"uranium-235", 1},
			{"plutonium-239", 3},
			{"plutonium-238", 15}
		},
		result = "MOX-fuel",
		result_count = 10
	},
	{
		type = "recipe",
		name = "MOX-fuel-reprocessing",
		energy_required = 50,
		enabled = false,
		category = "centrifuging",
		ingredients = {{"used-up-MOX-fuel", 5}},
		icon = "__PlutoniumEnergy__/graphics/icons/MOX-fuel-reprocessing.png",
		icon_size = 32,
		subgroup = "intermediate-product",
		order = "r[uranium-processing]-c[MOX-fuel-reprocessing]",
		main_product = "",
		results =
		{
			{
				name = "plutonium-239",
				amount = 1
			},
			{
				name = "plutonium-238",
				amount = 5
			}
		},
		allow_decomposition = false
	},
	{
		type = "recipe",
		name = "MOX-reactor",
		energy_required = 8,
		enabled = false,
		ingredients =
		{
			{"concrete", 600},
			{"steel-plate", 600},
			{"advanced-circuit", 600},
			{"copper-plate", 600}
		},
		result = "MOX-reactor",
		requester_paste_multiplier = 1
	},
	{
		type = "recipe",
		name = "industrial-reactor",
		energy_required = 4,
		enabled = false,
		ingredients =
		{
			{"concrete", 150},
			{"steel-plate", 75},
			{"advanced-circuit", 120},
			{"iron-gear-wheel", 120}
		},
		result = "industrial-reactor",
		requester_paste_multiplier= 10
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