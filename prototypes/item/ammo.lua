local ammo = {}

if mods["AtomicArtillery"] then
	local plutonium_atomic_artillery_shell = util.table.deepcopy(data.raw["ammo"]["atomic-artillery-shell"])
	plutonium_atomic_artillery_shell.name = "plutonium-atomic-artillery-shell"
	plutonium_atomic_artillery_shell.icon = "__PlutoniumEnergy__/graphics/icons/plutonium-atomic-artillery-shell.png"
	plutonium_atomic_artillery_shell.projectile = "plutonium-atomic-artillery-projectile"
	plutonium_atomic_artillery_shell.ammo_type.action.action_delivery.starting_speed = 1.1
	table.insert(ammo, plutonium_atomic_artillery_shell)
end

if ammo[1] then data:extend(ammo) end

data:extend({
    -- Ammo
	{
		type = "ammo",
		name = "plutonium-rounds-magazine",
		icon = "__PlutoniumEnergy__/graphics/icons/plutonium-rounds-magazine.png",
		icon_size = 32,
		flags = {},
		ammo_type =
		{
			category = "bullet",
			action =
			{
				type = "direct",
				action_delivery =
				{
					type = "instant",
					source_effects =
					{
						type = "create-explosion",
						entity_name = "explosion-gunshot"
					},
					target_effects =
					{
						{
							type = "create-entity",
							entity_name = "explosion-hit"
						},
						{
							type = "damage",
							damage = { amount = 36, type = "physical"}
						}
					}
				}
			}
		},
		magazine_size = 10,
		subgroup = "ammo",
		order = "a[basic-clips]-d[plutonium-rounds-magazine]",
		stack_size = 200
	},
	{
		type = "ammo",
		name = "plutonium-cannon-shell",
		icon = "__PlutoniumEnergy__/graphics/icons/plutonium-cannon-shell.png",
		icon_size = 32,
		flags = {},
		ammo_type =
		{
			category = "cannon-shell",
			target_type = "direction",
			action =
			{
				type = "direct",
				action_delivery =
				{
					type = "projectile",
					projectile = "plutonium-cannon-projectile",
					starting_speed = 1,
					direction_deviation = 0.1,
					range_deviation = 0.1,
					max_range = 35,
					source_effects =
					{
						type = "create-explosion",
						entity_name = "explosion-gunshot"
					}
				}
			}
		},
		subgroup = "ammo",
		order = "d[explosive-cannon-shell]-c[yplutonium]",
		stack_size = 200
	},
	{
		type = "ammo",
		name = "explosive-plutonium-cannon-shell",
		icon = "__PlutoniumEnergy__/graphics/icons/explosive-plutonium-cannon-shell.png",
		icon_size = 32,
		flags = {},
		ammo_type =
		{
			category = "cannon-shell",
			target_type = "direction",
			action =
			{
				type = "direct",
				action_delivery =
				{
					type = "projectile",
					projectile = "explosive-plutonium-cannon-projectile",
					starting_speed = 1,
					direction_deviation = 0.1,
					range_deviation = 0.1,
					max_range = 35,
					source_effects =
					{
						type = "create-explosion",
						entity_name = "explosion-gunshot"
					}
				}
			}
		},
		subgroup = "ammo",
		order = "d[explosive-cannon-shell]-c[zplutonium]",
		stack_size = 200
	},
	{
		type = "ammo",
		name = "plutonium-atomic-bomb",
		icon = "__PlutoniumEnergy__/graphics/icons/plutonium-atomic-bomb.png",
		icon_size = 32,
		flags = {},
		ammo_type =
		{
			range_modifier = 5,
			cooldown_modifier = 2.5,
			target_type = "position",
			category = "rocket",
			action =
			{
				type = "direct",
				action_delivery =
				{
					type = "projectile",
					projectile = "plutonium-atomic-rocket",
					starting_speed = 0.05,
					source_effects =
					{
						type = "create-entity",
						entity_name = "explosion-hit"
					}
				}
			}
		},
		subgroup = "ammo",
		order = "d[rocket-launcher]-c[atomic-bomb]",
		stack_size = 10
	}
})
