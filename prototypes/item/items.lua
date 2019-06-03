require("prototypes.item.ammo")

data:extend({
	-- Common resources
	{
		type = "item",
		name = "PE-plutonium-239",
		icon = "__PlutoniumEnergy__/graphics/icons/plutonium-239.png",
		icon_size = 32,
		flags = {},
		subgroup = "intermediate-product",
		order = "g[plutonium-239]",
		stack_size = 100
	},
	{
		type = "item",
		name = "PE-plutonium-238",
		icon = "__PlutoniumEnergy__/graphics/icons/plutonium-238.png",
		icon_size = 32,
		flags = {},
		subgroup = "intermediate-product",
		order = "g[plutonium-238]",
		stack_size = 100
	},

	-- MOX fuel
	{
		type = "item",
		name = "MOX-fuel",
		icon = "__PlutoniumEnergy__/graphics/icons/MOX-fuel.png",
		icon_size = 32,
		flags = {},
		subgroup = "intermediate-product",
		order = "r[uranium-processing]-b[MOX-fuel]",
		fuel_category = "PE-MOX",
		burnt_result = "used-up-MOX-fuel",
		fuel_value = "20GJ",
		stack_size = 50
	},
	{
		type = "item",
		name = "used-up-MOX-fuel",
		icon = "__PlutoniumEnergy__/graphics/icons/used-up-MOX-fuel.png",
		icon_size = 32,
		flags = {},
		subgroup = "intermediate-product",
		order = "i[used-up-MOX-fuel]",
		stack_size = 50
	},

	-- Machines
	{
		type = "item",
		name = "MOX-reactor",
		icon = "__PlutoniumEnergy__/graphics/icons/MOX-reactor.png",
		icon_size = 32,
		flags = {},
		subgroup = "energy",
		order = "f[nuclear-energy]-b[MOX-reactor]",
		place_result = "MOX-reactor",
		stack_size = 10
	},
	{
		type = "item",
		name = "industrial-reactor",
		icon = "__PlutoniumEnergy__/graphics/icons/industrial-reactor.png",
		icon_size = 32,
		flags = {},
		subgroup = "production-machine",
		order = "g[industrial-reactor]",
		place_result = "industrial-reactor",
		stack_size = 50
	}
})
