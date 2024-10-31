require("util")
require("circuit-connector-sprites")

data:extend({
    {
        type = 'reactor',
        name = 'MOX-reactor',
        icon = '__PlutoniumEnergy__/graphics/icons/MOX-reactor.png',
        flags = { 'placeable-neutral', 'player-creation' },
        minable = { mining_time = 0.5, result = 'MOX-reactor' },
        max_health = 400,
        corpse = 'MOX-reactor-remnants',
        dying_explosion = 'nuclear-reactor-explosion',
        consumption = '20MW',
        neighbour_bonus = 1.5,
        energy_source = {
            type = 'burner',
            fuel_categories = { 'MOX' },
            effectivity = 1,
            fuel_inventory_size = 1,
            burnt_inventory_size = 1,
            light_flicker = {
                color = { 0, 0, 0 },
                minimum_intensity = 0.7,
                maximum_intensity = 0.95
            }
        },
        collision_box = { { -1.2, -1.2 }, { 1.2, 1.2 } },
        selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
        damaged_trigger_effect = data.raw['reactor']['nuclear-reactor'].damaged_trigger_effect,
        lower_layer_picture = {
            filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/MOX-reactor-pipes.png',
            width = 192,
            height = 188,
            scale = 0.5,
            shift = util.by_pixel(-1, -5)
        },
        heat_lower_layer_picture = apply_heat_pipe_glow {
            filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/MOX-reactor-pipes-heated.png',
            width = 192,
            height = 188,
            scale = 0.5,
            shift = util.by_pixel(-0.5, -4.5)
        },

        picture = {
            layers = {
                {
                    filename = '__base__/graphics/entity/nuclear-reactor/reactor.png',
                    width = 302,
                    height = 318,
                    scale = 0.3,
                    shift = util.by_pixel(-3, -7)
                },
                {
                    filename = '__base__/graphics/entity/nuclear-reactor/reactor-shadow.png',
                    width = 525,
                    height = 323,
                    scale = 0.25,
                    shift = { 1.625 * 0.6, 0 },
                    draw_as_shadow = true
                }
            }
        },

        working_light_picture = {
            filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/MOX-reactor-lights-color.png',
            blend_mode = 'additive',
            draw_as_glow = true,
            width = 320,
            height = 320,
            scale = 0.3,
            shift = { -0.03125, -0.1875 }
        },

        heat_buffer = {
            max_temperature = 1000,
            specific_heat = '10MJ',
            max_transfer = '10GW',
            minimum_glow_temperature = 350,
            connections = {
                {
                    position = { -1, -1 },
                    direction = defines.direction.north
                },
                {
                    position = { 1, -1 },
                    direction = defines.direction.north
                },
                {
                    position = { 1, -1 },
                    direction = defines.direction.east
                },
                {
                    position = { 1, 1 },
                    direction = defines.direction.east
                },
                {
                    position = { 1, 1 },
                    direction = defines.direction.south
                },
                {
                    position = { -1, 1 },
                    direction = defines.direction.south
                },
                {
                    position = { -1, 1 },
                    direction = defines.direction.west
                },
                {
                    position = { -1, -1 },
                    direction = defines.direction.west
                }
            },
            heat_picture = apply_heat_pipe_glow {
                filename = '__base__/graphics/entity/nuclear-reactor/reactor-heated.png',
                width = 192,
                height = 192,
                scale = 0.3,
                shift = util.by_pixel(-2, -16)
            }
        },
        connection_patches_connected = {
            sheet = {
                filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/MOX-reactor-connect-patches.png',
                width = 64,
                height = 64,
                scale = 0.5,
                variation_count = 8,
            }
        },
        connection_patches_disconnected = {
            sheet = {
                filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/MOX-reactor-connect-patches.png',
                width = 64,
                height = 64,
                variation_count = 8,
                y = 64,
                scale = 0.5
            }
        },
        heat_connection_patches_connected = {
            sheet = apply_heat_pipe_glow {
                filename =
                '__PlutoniumEnergy__/graphics/entity/MOX-reactor/MOX-reactor-connect-patches-heated.png',
                width = 64,
                height = 64,
                variation_count = 8,
                scale = 0.5
            }
        },
        heat_connection_patches_disconnected = {
            sheet = apply_heat_pipe_glow {
                filename =
                '__PlutoniumEnergy__/graphics/entity/MOX-reactor/MOX-reactor-connect-patches-heated.png',
                width = 64,
                height = 64,
                variation_count = 8,
                y = 64,
                scale = 0.5
            }
        },

        impact_category = "metal-large",
        vehicle_impact_sound = data.raw['reactor']['nuclear-reactor'].vehicle_impact_sound,
        open_sound = data.raw['reactor']['nuclear-reactor'].open_sound,
        close_sound = data.raw['reactor']['nuclear-reactor'].close_sound,
        working_sound = data.raw['reactor']['nuclear-reactor'].working_sound,
        meltdown_action = data.raw['reactor']['nuclear-reactor'].meltdown_action,

        default_temperature_signal = data.raw['reactor']['nuclear-reactor'].default_temperature_signal,
        circuit_wire_max_distance = data.raw['reactor']['nuclear-reactor'].circuit_wire_max_distance,
        circuit_connector = circuit_connector_definitions.create_single(
            universal_connector_template,
            {
                variation = 27,
                main_offset = util.by_pixel(40 * 0.6, 40 * 0.6),
                shadow_offset = util.by_pixel(45 * 0.6, 54.5 * 0.6),
                show_shadow = false
            }
        )
    },
    {
        type = 'reactor',
        name = 'breeder-reactor',
        icon = '__PlutoniumEnergy__/graphics/icons/breeder-reactor.png',
        flags = { 'placeable-neutral', 'player-creation' },
        minable = { mining_time = 0.5, result = 'breeder-reactor' },
        max_health = 750,
        corpse = 'breeder-reactor-remnants',
        dying_explosion = 'nuclear-reactor-explosion',
        consumption = "20MW",
        neighbour_bonus = 0.5,
        energy_source = {
            type = 'burner',
            fuel_categories = { 'nuclear-breeder' },
            effectivity = 1,
            fuel_inventory_size = 1,
            burnt_inventory_size = 1,
            light_flicker = {
                color = { 0, 0, 0 },
                minimum_intensity = 0.35,
                maximum_intensity = 0.6
            }
        },
        collision_box = { { -3.2, -3.2 }, { 3.2, 3.2 } },
        selection_box = { { -3.5, -3.5 }, { 3.5, 3.5 } },
        damaged_trigger_effect = data.raw['reactor']['nuclear-reactor'].damaged_trigger_effect,
        lower_layer_picture = { -- TODO: connect pipes nicely
            filename = '__PlutoniumEnergy__/graphics/entity/breeder-reactor/breeder-reactor-pipes.png',
            width = 448,
            height = 444,
            scale = 0.5,
            shift = util.by_pixel(-1, -5)
        },
        heat_lower_layer_picture = { -- TODO: connect pipes nicely
            filename = '__PlutoniumEnergy__/graphics/entity/breeder-reactor/breeder-reactor-pipes-heated.png',
            width = 448,
            height = 444,
            scale = 0.5,
            shift = util.by_pixel(-0.5, -4.5)
        },

        picture = {
            layers = {
                {
                    filename = '__base__/graphics/entity/nuclear-reactor/reactor.png',
                    width = 302,
                    height = 318,
                    shift = util.by_pixel(-5, -7),
                    scale = 0.7
                },
                {
                    filename = '__base__/graphics/entity/nuclear-reactor/reactor-shadow.png',
                    width = 525,
                    height = 323,
                    scale = 0.7,
                    shift = { 1.625 * 1.4, 0 },
                    draw_as_shadow = true
                }
            }
        },
        working_light_picture = {
            filename = '__PlutoniumEnergy__/graphics/entity/breeder-reactor/breeder-reactor-lights-color.png',
            blend_mode = 'additive',
            draw_as_glow = true,
            width = 320,
            height = 320,
            shift = { -0.03125, -0.1875 },
            scale = 0.7
        },

        heat_buffer = {
            max_temperature = 1000,
            specific_heat = '20MJ',
            max_transfer = '10GW',
            minimum_glow_temperature = 350,
            connections = {
                {
                    position = { -3, -3 },
                    direction = defines.direction.north
                },
                {
                    position = { -1, -3 },
                    direction = defines.direction.north
                },
                {
                    position = { 1, -3 },
                    direction = defines.direction.north
                },
                {
                    position = { 3, -3 },
                    direction = defines.direction.north
                },
                {
                    position = { 3, -3 },
                    direction = defines.direction.east
                },
                {
                    position = { 3, -1 },
                    direction = defines.direction.east
                },
                {
                    position = { 3, 1 },
                    direction = defines.direction.east
                },
                {
                    position = { 3, 3 },
                    direction = defines.direction.east
                },
                {
                    position = { 3, 3 },
                    direction = defines.direction.south
                },
                {
                    position = { 1, 3 },
                    direction = defines.direction.south
                },
                {
                    position = { -1, 3 },
                    direction = defines.direction.south
                },
                {
                    position = { -3, 3 },
                    direction = defines.direction.south
                },
                {
                    position = { -3, 3 },
                    direction = defines.direction.west
                },
                {
                    position = { -3, 1 },
                    direction = defines.direction.west
                },
                {
                    position = { -3, -1 },
                    direction = defines.direction.west
                },
                {
                    position = { -3, -3 },
                    direction = defines.direction.west
                }
            },

            heat_picture = apply_heat_pipe_glow {
                filename = '__base__/graphics/entity/nuclear-reactor/reactor-heated.png',
                width = 216,
                height = 256,
                scale = 0.7,
                shift = util.by_pixel(3, -6.5)
            }
        },

        connection_patches_connected = {
            sheet = {
                filename =
                "__PlutoniumEnergy__/graphics/entity/breeder-reactor/breeder-reactor-connect-patches.png",
                width = 64,
                height = 64,
                variation_count = 16,
                scale = 0.5
            }
        },
        connection_patches_disconnected = {
            sheet = {
                filename =
                "__PlutoniumEnergy__/graphics/entity/breeder-reactor/breeder-reactor-connect-patches.png",
                width = 64,
                height = 64,
                variation_count = 16,
                y = 64,
                scale = 0.5
            }
        },
        heat_connection_patches_connected = { -- TODO
            sheet = apply_heat_pipe_glow {
                filename =
                "__PlutoniumEnergy__/graphics/entity/breeder-reactor/breeder-reactor-connect-patches-heated.png",
                width = 64,
                height = 64,
                variation_count = 16,
                scale = 0.5
            }
        },
        heat_connection_patches_disconnected = { -- TODO
            sheet = apply_heat_pipe_glow {
                filename =
                "__PlutoniumEnergy__/graphics/entity/breeder-reactor/breeder-reactor-connect-patches-heated.png",
                width = 64,
                height = 64,
                variation_count = 16,
                y = 64,
                scale = 0.5
            }
        },

        impact_category = "metal-large",
        vehicle_impact_sound = data.raw['reactor']['nuclear-reactor'].vehicle_impact_sound,
        open_sound = data.raw['reactor']['nuclear-reactor'].open_sound,
        close_sound = data.raw['reactor']['nuclear-reactor'].close_sound,
        working_sound = data.raw['reactor']['nuclear-reactor'].working_sound,
        meltdown_action = data.raw['reactor']['nuclear-reactor'].meltdown_action,

        default_temperature_signal = data.raw['reactor']['nuclear-reactor'].default_temperature_signal,
        circuit_wire_max_distance = data.raw['reactor']['nuclear-reactor'].circuit_wire_max_distance,
        circuit_connector = circuit_connector_definitions.create_single(
            universal_connector_template,
            {
                variation = 27,
                main_offset = util.by_pixel(40 * 1.4, 40 * 1.4),
                shadow_offset = util.by_pixel(45 * 1.4, 54.5 * 1.4),
                show_shadow = false
            }
        )
    }
})
