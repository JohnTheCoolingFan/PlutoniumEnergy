local ammo_recipes = {}

if mods['bobwarfare'] then
    local plutonium_atomic_artillery_shell = util.table.deepcopy(data.raw["recipe"]["atomic-artillery-shell"])

    plutonium_atomic_artillery_shell.name = "plutonium-atomic-artillery-shell"

    plutonium_atomic_artillery_shell.ingredients = {
        {"steel-plate", 8},
        {"plastic-bar", 8},
        {"explosives", 30},
        {"plutonium-239", 30}
    }
    plutonium_atomic_artillery_shell.result = "plutonium-atomic-artillery-shell"
    table.insert(ammo_recipes, plutonium_atomic_artillery_shell)

elseif mods["AtomicArtillery"] then
    local plutonium_atomic_artillery_shell = util.table.deepcopy(data.raw["recipe"]["atomic-artillery-shell"])

    plutonium_atomic_artillery_shell.name = "plutonium-atomic-artillery-shell"

    plutonium_atomic_artillery_shell.ingredients = {
        {"plutonium-atomic-bomb", 1},
        {"explosive-plutonium-cannon-shell", 4},
        {"rocket-control-unit", 3},
        {"radar", 1}
    }
    plutonium_atomic_artillery_shell.result = "plutonium-atomic-artillery-shell"
    table.insert(ammo_recipes, plutonium_atomic_artillery_shell)

end

if ammo_recipes[1] then data:extend(ammo_recipes) end

data:extend({
    -- Ammo
    {
        type = "recipe",
        name = "plutonium-rounds-magazine",
        enabled = false,
        energy_required = 10,
        ingredients = {
            {"piercing-rounds-magazine", 1},
            {"PE-plutonium-238", 1}
        },
        result = "plutonium-rounds-magazine"
    },
    {
        type = "recipe",
        name = "plutonium-atomic-bomb",
        enabled = false,
        energy_required = 50,
        ingredients = {
            {"processing-unit", 20},
            {"explosives", 10},
            {"PE-plutonium-238", 15},
            {"PE-plutonium-239", 10}
        },
        result = "plutonium-atomic-bomb"
    },
    {
        type = "recipe",
        name = "plutonium-cannon-shell",
        enabled = false,
        energy_required = 10,
        ingredients = {
            {"cannon-shell", 1},
            {"PE-plutonium-238", 1}
        },
        result = "plutonium-cannon-shell"
    },
    {
        type = "recipe",
        name = "explosive-plutonium-cannon-shell",
        enabled = false,
        energy_required = 10,
        ingredients = {
            {"explosive-cannon-shell", 1},
            {"PE-plutonium-238", 1}
        },
        result = "explosive-plutonium-cannon-shell"
    }
})
