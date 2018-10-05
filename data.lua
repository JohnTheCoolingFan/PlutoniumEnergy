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

if mods["real-nukes"] then
	require("prototypes.nukes-integration")
end

require("prototypes.category.recipe-category")
require("prototypes.item.item")
require("prototypes.recipe.recipe")
require("prototypes.technology.technology")
require("prototypes.entity.projectiles")
require("prototypes.entity.entity")

data.raw["recipe"]["nuclear-fuel-reprocessing"].results = {{name = "uranium-238", amount = 3}, {name = "raw-plutonium", amount = 1}}