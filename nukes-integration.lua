-- For creation of used here textures used only base game textures and paint.net

local nukes = {}

local projectile = table.deepcopy(data.raw["artillery-projectile"]["nuke-shell"])
projectile.name = "plutonium-nuke-shell"
projectile.map_color = {r=0.2, g=0.2, b=0.2}
projectile.picture.filename = "__PlutoniumEnergy__/graphics/nuke/plutonium-nuke-shell.png"
projectile.chart_picture.filename = "__PlutoniumEnergy__/graphics/nuke/plutonium-nuke-map-visualization.png"
table.insert(nukes, projectile)

local nuke = table.deepcopy(data.raw.ammo["nuke"])
nuke.name = "plutonium-nuke"
nuke.icon = "__PlutoniumEnergy__/graphics/nuke/plutonium-nuke-shell.png"
nuke.ammo_type.action.action_delivery.projectile = "plutonium-nuke-shell"
table.insert(nukes, nuke)

table.insert(nukes, {
	type = "recipe",
	name = "plutonium-nuke",
	enabled = false,
	energy_required = 75,
	ingredients = {
		{"artillery-shell", 1},
		{"plutonium-atomic-bomb", 1}
	},
	result = "plutonium-nuke"
})
table.insert(nukes,
	{
		type = "technology",
		name = "atomic-bomb-3",
		icon_size = 128,
		icon = "__base__/graphics/technology/atomic-bomb.png",
		effects = {
			{
				type = "unlock-recipe",
				recipe = "plutonium-nuke"
			}
		},
		prerequisites = {"atomic-bomb-2", "plutonium-ammo"},
		unit = {
			count = 8000,
			ingredients = {
				{"science-pack-1", 1},
				{"science-pack-2", 1},
				{"science-pack-3", 1},
				{"military-science-pack", 1},
				{"production-science-pack", 1},
				{"high-tech-science-pack", 1}
			},
			time = 60
		},
		order = "e-a-c"
	}
)

data:extend(nukes)
