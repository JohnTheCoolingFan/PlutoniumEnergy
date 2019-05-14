local ammo = {}

if mods["AtomicArtillery"] then
    local plutonium_atomic_artillery_shell = util.table.deepcopy(data.raw["recipe"]["atomic-artillery-shell"])
    plutonium_atomic_artillery_shell.name = "plutonium-atomic-artillery-shell"
    plutonium_atomic_artillery_shell.ingredients = {
        {"plutonium-atomic-bomb", 1},
        {"exploive-plutonium-cannon-shell", 3},
        {"rocket-control-unit", 2},
        {"radar", 1}
    }
    plutonium_atomic_artillery_shell.result = "plutonium-atomic-artillery-shell"
end

data:extend(ammo)

data:extend({
    -- Ammo
	{
		type = "recipe",
		name = "plutonium-rounds-magazine",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
			{"piercing-rounds-magazine", 1},
			{"plutonium-238", 1}
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
			{"plutonium-238", 15},
			{"plutonium-239", 10}
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
			{"plutonium-238", 1}
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
			{"plutonium-238", 1}
		},
		result = "explosive-plutonium-cannon-shell"
	}
})
