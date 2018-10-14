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

local protos2 = {}

local projectile = table.deepcopy(data.raw["artillery-projectile"]["nuke-shell"])
projectile.name = "plutonium-nuke-shell"
projectile.map_color = {r=0.2, g=0.2, b=0.2}
projectile.picture.filename = "__PlutoniumEnergy__/graphics/nuke/plutonium-nuke-shell.png"
projectile.chart_picture.filename = "__PlutoniumEnergy__/graphics/nuke/plutonium-nuke-shoot-map-visualization.png"
table.insert(protos2, projectile)

local nuke = table.deepcopy(data.raw.ammo["nuke"])
nuke.name = "plutonium-nuke"
nuke.icon = "__PlutoniumEnergy__/graphics/nuke/plutonium-nuke.png"
nuke.ammo_type.action.action_delivery.projectile = "plutonium-nuke-shell"
table.insert(protos2, nuke)

table.insert(protos2, {
	type = "recipe",
	name = "plutonium-nuke",
	enabled = false,
	energy_required = 75,
	ingredients = {
		{"artillery-shell", 1},
		{"plutonium-atomic-bomb", 1}
	},
	result = "plutonium-nuke"
})
table.insert(protos2,
	{
		type = "technology",
		name = "atomic-bomb-3",
		icon_size = 128,
		icon = "__base__/graphics/technology/atomic-bomb.png",
		effects = {
			{
				type = "unlock-recipe",
				recipe = "plutonium-nuke"
			}
		},
		prerequisites = {"atomic-bomb-2", "plutonium-ammo"},
		unit = {
			count = 8000,
			ingredients = {
				{"science-pack-1", 1},
				{"science-pack-2", 1},
				{"science-pack-3", 1},
				{"military-science-pack", 1},
				{"production-science-pack", 1},
				{"high-tech-science-pack", 1}
			},
			time = 60
		},
		order = "e-a-c"
	}
)

data:extend(protos2)
