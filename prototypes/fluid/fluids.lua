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
		type = "fluid",
		name = "tritium-gas",
		default_temperature = 15,
		max_temperature = 100,
		heat_capacity = "0.2KJ",
		base_color = {r=0, g=0.34, b=0.6},
		flow_color = {r=0.7, g=0.7, b=0.7},
		icon = "__base__/graphics/icons/fluid/water.png",
		icon_size = 32,
		order = "a[fluid]-a[water]",
		pressure_to_speed_ratio = 0.4,
		flow_to_energy_ratio = 0.59
	},
})