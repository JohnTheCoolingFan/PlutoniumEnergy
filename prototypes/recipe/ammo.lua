local ammo_recipes = {}

if mods['bobwarfare'] then
    local plutonium_atomic_artillery_shell = util.table.deepcopy(data.raw["recipe"]["atomic-artillery-shell"])

    plutonium_atomic_artillery_shell.name = "plutonium-atomic-artillery-shell"

    plutonium_atomic_artillery_shell.normal.ingredients = {
        { "steel-plate",   8 },
        { "plastic-bar",   8 },
        { "explosives",    30 },
        { "plutonium-239", 30 }
    }
    plutonium_atomic_artillery_shell.expensive.ingredients = {
        { "steel-plate",   16 },
        { "plastic-bar",   16 },
        { "explosives",    30 },
        { "plutonium-239", 30 }
    }
    plutonium_atomic_artillery_shell.normal.result = "plutonium-atomic-artillery-shell"
    plutonium_atomic_artillery_shell.expensive.result = "plutonium-atomic-artillery-shell"
    table.insert(ammo_recipes, plutonium_atomic_artillery_shell)
elseif mods["AtomicArtillery"] or mods["AtomicArtilleryRedux"] then
    local plutonium_atomic_artillery_shell = util.table.deepcopy(data.raw["recipe"]["atomic-artillery-shell"])

    plutonium_atomic_artillery_shell.name = "plutonium-atomic-artillery-shell"

    plutonium_atomic_artillery_shell.ingredients = {
        { "plutonium-atomic-bomb",            1 },
        { "explosive-plutonium-cannon-shell", 4 },
        { "rocket-control-unit",              3 },
        { "radar",                            1 }
    }
    plutonium_atomic_artillery_shell.result = "plutonium-atomic-artillery-shell"
    table.insert(ammo_recipes, plutonium_atomic_artillery_shell)
end

if mods['SchallArtillery'] then
    local sc_plutonium_aa_sh = util.table.deepcopy(data.raw['recipe']['Schall-atomic-artillery-shell'])

    sc_plutonium_aa_sh.name = 'Schall-plutonium-atomic-artillery-shell'

    sc_plutonium_aa_sh.ingredients = {
        { 'explosive-cannon-shell', 6 },
        { 'radar',                  1 },
        { 'rocket-control-unit',    12 },
        { 'explosives',             15 },
        { 'plutonium-239',          35 }
    }
    sc_plutonium_aa_sh.result = 'Schall-plutonium-atomic-artillery-shell'
    table.insert(ammo_recipes, sc_plutonium_aa_sh)
end

if #ammo_recipes > 0 then data:extend(ammo_recipes) end

if settings.startup['enable-plutonium-ammo'].value then
    if mods["IndustrialRevolution3"] then
        --adds lead plates to the ammo recipes
        data:extend({
            {
                type = "recipe",
                name = "plutonium-rounds-magazine",
                enabled = false,
                energy_required = 10,
                ingredients = {
                    { "chromium-magazine", 1 },
                    { "lead-plate",        2 },
                    { "plutonium-238",     1 }
                },
                result = "plutonium-rounds-magazine"
            },
            {
                type = "recipe",
                name = "plutonium-cannon-shell",
                enabled = false,
                energy_required = 10,
                ingredients = {
                    { "cannon-shell",  1 },
                    { "lead-plate",    4 },
                    { "plutonium-238", 1 }
                },
                result = "plutonium-cannon-shell"
            },
            {
                type = "recipe",
                name = "explosive-plutonium-cannon-shell",
                enabled = false,
                energy_required = 10,
                ingredients = {
                    { "explosive-cannon-shell", 1 },
                    { "lead-plate",             4 },
                    { "plutonium-238",          1 }
                },
                result = "explosive-plutonium-cannon-shell"
            },
            -- makes an atomic artillery shell, IR3's replacement for an atomic bomb
            {
                type = "recipe",
                name = "plutonium-atomic-artillery-shell",
                energy_required = 60,
                ingredients = {
                    { "artillery-shell", 1 },
                    { "lead-plate",      30 },
                    { "plutonium-239",   20 }
                },
                result = "atomic-artillery-shell"
            }
        })
    else
        data:extend({
            -- Ammo
            {
                type = "recipe",
                name = "plutonium-rounds-magazine",
                enabled = false,
                energy_required = 10,
                ingredients = {
                    { "piercing-rounds-magazine", 1 },
                    { "plutonium-238",            1 }
                },
                result = "plutonium-rounds-magazine"
            },
            {
                type = "recipe",
                name = "plutonium-cannon-shell",
                enabled = false,
                energy_required = 10,
                ingredients = {
                    { "cannon-shell",  1 },
                    { "plutonium-238", 1 }
                },
                result = "plutonium-cannon-shell"
            },
            {
                type = "recipe",
                name = "explosive-plutonium-cannon-shell",
                enabled = false,
                energy_required = 10,
                ingredients = {
                    { "explosive-cannon-shell", 1 },
                    { "plutonium-238",          1 }
                },
                result = "explosive-plutonium-cannon-shell"
            }
        })
    end
end

data:extend({
    {
        type = "recipe",
        name = "plutonium-atomic-bomb",
        enabled = false,
        energy_required = 50,
        ingredients = {
            { "rocket-control-unit", 10 },
            { "explosives",          10 },
            { "plutonium-239",       35 }
        },
        result = "plutonium-atomic-bomb"
    }
})
