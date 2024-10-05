require("prototypes.item.items")
require('prototypes.entity.remnants')
require("prototypes.entity.entities")
require("prototypes.entity.projectiles")
require("prototypes.entity.patch-reactor")
require("prototypes.recipe.recipes")
require("prototypes.technology.technology")
require("prototypes.categories.fuel-category")
require("prototypes.categories.ammo-category")
require("prototypes.fluid.fluids")

if mods['space-exploration'] then
    require('compat.space-exploration')
end
