log("Space Exploration compatibility tweaks")

-- Space Exploration compatibility tweaks, originally by Polish DeathCare

local data_util = require('__space-exploration__.data_util')

if not se_delivery_cannon_recipes then se_delivery_cannon_recipes = {} end

se_delivery_cannon_recipes['plutonium-239'] = { name = 'plutonium-239' }
se_delivery_cannon_recipes['plutonium-238'] = { name = 'plutonium-238' }

if not se_delivery_cannon_ammo_recipes then se_delivery_cannon_ammo_recipes = {} end

se_delivery_cannon_ammo_recipes['plutonium-atomic-artillery-shell'] = {
    type = 'ammo',
    name = 'plutonium-atomic-artillery-shell',
    amount = 1,
    ingredients = {
        { 'plutonium-atomic-artillery-shell',                       1 },
        { data_util.mod_prefix .. 'delivery-cannon-weapon-capsule', 1 }
    }
}
