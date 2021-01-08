require("prototypes.item.ammo")

data:extend({
	-- Common resources
	{
		type = "item",
		name = "plutonium-239",
		icon = "__PlutoniumEnergy__/graphics/icons/plutonium-239.png",
		icon_size = 64,
        icon_mipmaps = 4,
		flags = {},
		subgroup = "intermediate-product",
		order = "g[plutonium-239]",
		stack_size = 100
	},
	{
		type = "item",
		name = "plutonium-238",
		icon = "__PlutoniumEnergy__/graphics/icons/plutonium-238.png",
		icon_size = 64,
        icon_mipmaps = 4,
		flags = {},
		subgroup = "intermediate-product",
		order = "g[plutonium-238]",
		stack_size = 100
	},

    -- Plutonium nuclear fuel
    {
        type = "item",
        name = "plutonium-fuel",
        icon = "__base__/graphics/icons/nuclear-fuel.png", -- TODO
        icon_size = 64, icon_mipmaps = 4,
        pictures =
        {
            layers =
            {
                {
                    size = 64,
                    filename = "__base__/graphics/icons/nuclear-fuel.png", -- TODO
                    scale = 0.25,
                    mipmap_count = 4
                },
                {
                    draw_as_light = true,
                    flags = {"light"},
                    size = 64,
                    filename = "__base__/graphics/icons/nuclear-fuel-light.png",  -- TODO
                    scale = 0.25,
                    mipmap_count = 4
                }
            }
        },
        fuel_category = "chemical",
        fuel_value = "2.42GJ",               -- 2 times the wtored power...
        fuel_acceleration_multiplier = 1.75, -- ...only half the effects
        fuel_top_speed_multiplier = 1.075,
        -- fuel_glow_color = {r = 0.1, g = 1, b = 0.1},
        subgroup = "intermediate-product",
        order = "r[uranium-rocket-fuel]",
        stack_size = 1
    },

    -- MOX fuel
    {
        type = "item",
        name = "MOX-fuel",
        icon = "__PlutoniumEnergy__/graphics/icons/MOX-fuel.png",
        icon_size = 64,
        icon_mipmaps = 4,
        flags = {},
        subgroup = "intermediate-product",
        order = "r[uranium-processing]-b[MOX-fuel]",
        fuel_category = "MOX",
        burnt_result = "used-up-MOX-fuel",
        fuel_value = "20GJ",
        stack_size = 50
    },
    {
        type = "item",
        name = "used-up-MOX-fuel",
        icon = "__PlutoniumEnergy__/graphics/icons/used-up-MOX-fuel.png",
        icon_size = 64,
        icon_mipmaps = 4,
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
        icon_size = 64,
        icon_mipmaps = 4,
        flags = {},
        subgroup = "energy",
        order = "f[nuclear-energy]-b[MOX-reactor]",
        place_result = "MOX-reactor",
        stack_size = 10
    }
})
