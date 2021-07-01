require("prototypes.item.items")
require('prototypes.entity.remnants')
require("prototypes.entity.entities")
require("prototypes.entity.projectiles")
require("prototypes.recipe.recipes")
require("prototypes.technology.technology")
require("prototypes.categories.fuel-category")

-- TODO: Balancing, more Pu-238
-- TODO: New screenshots, better overview
-- TODO: better advanced reprocessing process (used-up fuel + acid [in chemical plant] = components)
-- TODO: SchallRadioactiveWaste. Check if integration is already there and add if not.

-- Space Exploration compatibility by Polish DeathCare
if not se_delivery_cannon_recipes then se_delivery_cannon_recipes = {} end

se_delivery_cannon_recipes["plutonium-239"] = {name="plutonium-239"}
se_delivery_cannon_recipes["plutonium-238"] = {name="plutonium-238"}
