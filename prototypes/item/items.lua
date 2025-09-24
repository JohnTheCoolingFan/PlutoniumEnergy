require("prototypes.item.ammo")

data.raw['item']['heat-pipe'].order = 'f[nuclear-energy]-d[heat-pipe]'
data.raw['item']['heat-exchanger'].order = 'f[nuclear-energy]-e[heat-exchanger]'
data.raw['item']['steam-turbine'].order = 'f[nuclear-energy]-f[steam-turbine]'

data:extend({
    -- Common resources
    {
        type = "item",
        name = "plutonium-239",
        icon = "__PlutoniumEnergy__/graphics/icons/plutonium-239.png",
        icon_size = 64,
        icon_mipmaps = 4,
        pictures =
        {
            layers =
            {
                {
                    size = 64,
                    filename = "__PlutoniumEnergy__/graphics/icons/plutonium-239.png",
                    scale = 0.5,
                    mipmap_count = 4
                },
                {
                    draw_as_light = true,
                    blend_mode = "additive",
                    size = 64,
                    filename = "__base__/graphics/icons/uranium-235.png",
                    scale = 0.5,
                    tint = { r = 0.3, g = 0.3, b = 0.3, a = 0.3 },
                    mipmap_count = 4
                }
            }
        },
        subgroup = "intermediate-product",
        order = "r[uranium-238]-a[plutonium-239]",
        stack_size = 100,
    },
    {
        type = "item",
        name = "plutonium-238",
        icon = "__PlutoniumEnergy__/graphics/icons/plutonium-238.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "intermediate-product",
        order = "r[uranium-238]-b[plutonium-238]",
        stack_size = 100,
    },

    -- Plutonium nuclear fuel (the one that burns)
    {
        type = "item",
        name = "plutonium-fuel",
        icon = "__PlutoniumEnergy__/graphics/icons/plutonium-fuel.png",
        icon_size = 64,
        icon_mipmaps = 4,
        pictures =
        {
            layers =
            {
                {
                    size = 64,
                    filename = "__PlutoniumEnergy__/graphics/icons/plutonium-fuel.png",
                    scale = 0.5,
                    mipmap_count = 4
                },
                {
                    draw_as_light = true,
                    flags = { "light" },
                    size = 64,
                    filename = "__base__/graphics/icons/nuclear-fuel-light.png",
                    scale = 0.5,
                    mipmap_count = 4
                }
            }
        },
        fuel_category = "chemical",
        fuel_value = "3GJ",
        fuel_acceleration_multiplier = 3.0,
        fuel_top_speed_multiplier = 1.25,
        -- fuel_glow_color = {r = 0.1, g = 1, b = 0.1},
        subgroup = "intermediate-product",
        order = "r[uranium-processing]-f[plutonium-fuel]",
        stack_size = 1,
    },

    -- Plutonium fuel cell
    {
        type = "item",
        name = "plutonium-fuel-cell",
        icon = "__PlutoniumEnergy__/graphics/icons/plutonium-fuel-cell.png",
        icon_size = 64,
        icon_mipmaps = 4,
        pictures = {
            layers = {
                {
                    size = 64,
                    filename = "__PlutoniumEnergy__/graphics/icons/plutonium-fuel-cell.png",
                    scale = 0.5,
                    mipmap_count = 4,
                },
                {
                    draw_as_light = true,
                    flags = { "light" },
                    size = 64,
                    filename = "__base__/graphics/icons/uranium-fuel-cell-light.png",
                    scale = 0.5,
                    mipmap_count = 4
                }
            }
        },
        subgroup = "nuclear-plutonium",
        order = "r[uranium-processing]-c[plutonium-fuel-cell]",
        fuel_category = "nuclear",
        burnt_result = "depleted-plutonium-fuel-cell",
        fuel_value = "20GJ",
        fuel_glow_color = { 0, 1, 1, 0 },
        stack_size = 50,
    },
    {
        type = "item",
        name = "depleted-plutonium-fuel-cell",
        icon = "__PlutoniumEnergy__/graphics/icons/depleted-plutonium-fuel-cell.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "nuclear-plutonium",
        order = "t[depleted-plutonium-fuel-cell]",
        stack_size = 50,
    },

    -- MOX fuel cell
    {
        type = "item",
        name = "MOX-fuel-cell",
        icon = "__PlutoniumEnergy__/graphics/icons/MOX-fuel-cell.png",
        icon_size = 64,
        pictures = {
            layers = {
                {
                    size = 64,
                    filename = "__PlutoniumEnergy__/graphics/icons/MOX-fuel-cell.png",
                    scale = 0.5,
                },
                {
                    draw_as_light = true,
                    flags = { "light" },
                    size = 64,
                    filename = "__PlutoniumEnergy__/graphics/icons/MOX-fuel-cell-light.png",
                    scale = 0.5,
                }
            }
        },
        flags = {},
        subgroup = "nuclear-plutonium",
        order = "r[uranium-processing]-b[MOX-fuel-cell]",
        fuel_category = "MOX",
        burnt_result = "depleted-MOX-fuel-cell",
        fuel_value = "3GJ",
        stack_size = 100,
    },
    {
        type = "item",
        name = "depleted-MOX-fuel-cell",
        icon = "__PlutoniumEnergy__/graphics/icons/depleted-MOX-fuel-cell.png",
        icon_size = 64,
        subgroup = "nuclear-plutonium",
        order = "s[depleted-MOX-fuel-cell]",
        stack_size = 100,
    },

    -- Breeder fuel cell (nuclear)
    {
        type = 'item',
        name = 'breeder-fuel-cell',
        icon = '__PlutoniumEnergy__/graphics/icons/breeder-fuel-cell.png',
        icon_size = 64,
        icon_mipmaps = 4,
        pictures = {
            layers = {
                {
                    size = 64,
                    filename = "__PlutoniumEnergy__/graphics/icons/breeder-fuel-cell.png",
                    scale = 0.5,
                    mipmap_count = 4,
                },
                {
                    draw_as_light = true,
                    flags = { "light" },
                    size = 64,
                    filename = "__base__/graphics/icons/uranium-fuel-cell-light.png",
                    scale = 0.5,
                    mipmap_count = 4
                }
            }
        },
        subgroup = 'nuclear-breeding',
        order = 'r[uranium-processing]-b[obreeder-fuel-cell]-a[regular]',
        fuel_category = 'nuclear-breeder',
        burnt_result = 'depleted-breeder-fuel-cell',
        fuel_value = '10GJ',
        stack_size = 5,
    },
    {
        type = 'item',
        name = 'depleted-breeder-fuel-cell',
        icon = '__PlutoniumEnergy__/graphics/icons/depleted-breeder-fuel-cell.png',
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = 'nuclear-breeding',
        order = 's[depleted-xbreeder-fuel-cell]',
        stack_size = 5,
    },

    -- Machines
    {
        type = "item",
        name = "MOX-reactor",
        icon = "__PlutoniumEnergy__/graphics/icons/MOX-reactor.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "energy",
        order = "f[nuclear-energy]-b[MOX-reactor]",
        place_result = "MOX-reactor",
        stack_size = 10,
    },
    {
        type = "item",
        name = "breeder-reactor",
        icon = "__PlutoniumEnergy__/graphics/icons/breeder-reactor.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "energy",
        order = "f[nuclear-energy]-c[breeder-reactor]",
        place_result = "breeder-reactor",
        stack_size = 10,
    }
})
