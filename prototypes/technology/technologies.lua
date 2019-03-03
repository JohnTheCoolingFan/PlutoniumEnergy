data:extend({
	{
		type = "technology",
		name = "plutonium-nuclear-power",
		icon = "__PlutoniumEnergy__/graphics/technology/plutonium-nuclear-power.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "MOX-fuel"
			},
			{
				type = "unlock-recipe",
				recipe = "MOX-reactor"
			},
			{
				type = "unlock-recipe",
				recipe = "advanced-nuclear-fuel-reprocessing"
			},
			{
				type = "unlock-recipe",
				recipe = "plutonium-238-nuclesynthesis"
			},
			{
				type = "unlock-recipe",
				recipe = "industrial-reactor"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-238-excess-neutron-capture"
			}
		},
		prerequisites = {"nuclear-power"},
		unit =
		{
			ingredients =
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1}
			},
			time = 25,
			count = 1200
		},
		order = "c-a"
	},
	{
		type = "technology",
		name = "MOX-fuel-reprocessing",
		icon = "__PlutoniumEnergy__/graphics/technology/plutonium-fuel-reprocessing.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "MOX-fuel-reprocessing"
			},
			{
				type = "unlock-recipe",
				recipe = "plutonium-239-alpha-decay"
			}
		},
		prerequisites = {"plutonium-nuclear-power"},
		unit =
		{
			ingredients =
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1}
			},
			time = 25,
			count = 1500
		},
		order = "c-a"
	},

	{
		type = "technology",
		name = "plutonium-ammo",
		icon_size = 128,
		icon = "__PlutoniumEnergy__/graphics/technology/plutonium-ammo.png",
		effects = {
			{
				type = "unlock-recipe",
				recipe = "plutonium-rounds-magazine"
			},
			{
				type = "unlock-recipe",
				recipe = "plutonium-atomic-bomb"
			},
			{
				type = "unlock-recipe",
				recipe = "plutonium-cannon-shell"
			},
			{
				type = "unlock-recipe",
				recipe = "explosive-plutonium-cannon-shell"
			}
		},
		prerequisites = {"plutonium-nuclear-power", "uranium-ammo"},
		unit = {
			count = 5000,
			ingredients = {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1},
				{"military-science-pack", 1},
				{"production-science-pack", 1},
				{"utility-science-pack", 1}
			},
			time = 50
		},
		order = "e-a-c"
	}
})
