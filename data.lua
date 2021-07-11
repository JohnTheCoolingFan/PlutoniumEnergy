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

-- Space Exploration compatibility by Polish DeathCare

if mods['space-exploration'] then
    local data_util = require('__space-exploration__.data_util')

    if not se_delivery_cannon_recipes then se_delivery_cannon_recipes = {} end

    se_delivery_cannon_recipes['plutonium-239'] = {name='plutonium-239'}
    se_delivery_cannon_recipes['plutonium-238'] = {name='plutonium-238'}

    if not se_delivery_cannon_ammo_recipes then se_delivery_cannon_ammo_recipes = {} end

    se_delivery_cannon_ammo_recipes['plutonium-atomic-bomb'] = {
        type = 'ammo',
        name = 'plutonium-atomic-bomb',
        amount = 1,
        ingredients = {
            {'plutonium-atomic-bomb', 1},
            {data_util.mod_prefix..'delivery-cannon-weapon-capsule', 1}
        }
    }
end
