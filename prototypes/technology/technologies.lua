require("ammo")

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
		icon = "__PlutoniumEnergy__/graphics/technology/MOX-fuel-reprocessing.png",
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
	}
})
