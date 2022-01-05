-- TODO: redo reactor graphics with new glow.

require "util"

data:extend({
        {
            type = 'reactor',
            name = 'MOX-reactor',
            icon = '__PlutoniumEnergy__/graphics/icons/MOX-reactor.png',
            icon_size = 64, icon_mipmaps = 4,
            flags = {'placeable-neutral', 'player-creation'},
            minable = {mining_time = 0.5, result = 'MOX-reactor'},
            max_health = 400,
            corpse = 'MOX-reactor-remnants',
            dying_explosion = 'nuclear-reactor-explosion',
            consumption = '20MW',
            neighbour_bonus = 1,
            energy_source = {
                type = 'burner',
                fuel_category = 'MOX',
                effectivity = 1,
                fuel_inventory_size = 1,
                burnt_inventory_size = 1,
                light_flicker = {
                    color = {0, 0, 0},
                    minimum_intensity = 0.7,
                    maximum_intensity = 0.95
                }
            },
            collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
            selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
            damaged_trigger_effect = data.raw['reactor']['nuclear-reactor'].damaged_trigger_effect,
            --TODO: reexamine heat pipes sprites and maybe remake them, adjust shifts
            lower_layer_picture = {
                filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/MOX-reactor-pipes.png',
                width = 96,
                height = 92,
                shift = util.by_pixel(-2, -4),
                hr_version = {
                    filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/hr-MOX-reactor-pipes.png',
                    width = 192,
                    height = 192,
                    scale = 0.5
                    shift = util.by_pixel(-1, -5)
                }
            },
            heat_lower_layer_picture = apply_heat_pipe_glow {
                filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/MOX-reactor-pipes-heated.png',
                width = 96,
                height = 96,
                shift = util.by_pixel(-3, -4),
                hr_version = {
                    filename = '__PlutoniumEnergy__/graphics/Entity/MOX-reactor/hr-MOX-reactor-pipes-heated.png',
                    width = 192,
                    height = 192,
                    scale = 0.5,
                    shift = util.by_pixel(-0.5, -4.5)
                }
            },

            picture = {
                layers = {
                    {
                        filename = '__base__/graphics/entity/nuclear-reactor/reactor.png',
                        width = 154,
                        height = 158,
                        shift = util.by_pixel(-4, -6),
                        scale = 0.6,
                        hr_version = {
                            filename = '__base__/graphics/entity/nuclear-reactor/hr-reactor.png',
                            width = 302,
                            height = 318,
                            scale = 0.3,
                            shift = util.by_pixel(-3, -7)
                        }
                    },
                    {
                        filename = '__base__/graphics/entity/nuclear-reactor/reactor-shadow.png',
                        width = 263,
                        height = 162,
                        scale = 0.6,
                        shift = {1.625, 0},
                        draw_as_shadow = true,
                        hr_version = {
                            filename = '__base__/graphics/entity/nuclear-reactor/hr-reactor-shadow.png',
                            width = 525,
                            height = 323,
                            scale = 0.3,
                            shift = {1.625, 0},
                            draw_as_shadow = true
                        }
                    }
                }
            },

            working_light_picture = {
                filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/MOX-reactor-lights-color.png',
                blend_mode = 'additive',
                draw_as_glow = true,
                width = 160,
                height = 160,
                scale = 0.6,
                shift = {-0.03125, -0.1875},
                hr_version = {
                    filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/hr-MOX-reactor-lights-color.png',
                    blend_mode = 'additive',
                    draw_as_glow = true,
                    width = 320,
                    height = 320,
                    scale = 0.3,
                    shift = {-0.03125, -0.1875}
                }
            },

            heat_buffer = {
                max_temperature = 1000,
                specific_heat = '10MJ',
                max_transfer = '10GW',
                minimum_glow_temperature = 350,
                connections = {
                    {
                        position = {-1, -1},
                        direction = defines.direction.north
                    },
                    {
                        position = {1, -1},
                        direction = defines.direction.north
                    },
                    {
                        position = {1, -1},
                        direction = defines.direction.east
                    },
                    {
                        position = {1, 1},
                        direction = defines.direction.east
                    },
                    {
                        position = {1, 1},
                        direction = defines.direction.south
                    },
                    {
                        position = {-1, 1},
                        direction = defines.direction.south
                    },
                    {
                        position = {-1, 1},
                        direction = defines.direction.west
                    },
                    {
                        position = {-1, -1},
                        direction = defines.direction.west
                    }
                },
                heat_picture = apply_heat_pipe_glow {
                    filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/MOX-reactor-pipes-heated.png',
                    width = 96,
                    height = 96,
                    shift = util.by_pixel(1, -7),
                    hr_version = {
                        filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/hr-MOX-reactor-pipes-heated.png',
                        width = 192,
                        height = 192,
                        scale = 0.5,
                        shift = util.by_pixel(3, -6.5)
                    }
                }
            },
            connection_patches_connected = {
                sheet = {
                    filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/MOX-reactor-connect-patches.png',
                    width = 32,
                    height = 32,
                    variation_count = 8,
                    hr_version = {
                        filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/hr-MOX-reactor-connect-patches.png',
                        width = 64,
                        height = 64,
                        variation_count = 8,
                    }
                }
            },
            connection_patches_disconnected = {
                sheet = {
                    filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/MOX-reactor-connect-patches.png',
                    width = 32,
                    height = 32,
                    variation_count = 8,
                    y = 32,
                    hr_version = {
                        filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/hr-MOX-reactor-connect-patches.png',
                        width = 64,
                        height = 64,
                        variation_count = 8,
                        y = 64,
                        scale = 0.5
                    }
                }
            },
            heat_connection_patches_connected = {
                sheet = {
                    filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/MOX-reactor-connect-patches-heated.png'
                    width = 32,
                    height = 32,
                    variation_count = 8
                    hr_version = {
                        filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/hr-MOX-reactor-connect-patches-heated.png'
                        width = 64,
                        height = 64,
                        variation_count = 8,
                        scale = 0.5
                    }
                }
            },
            heat_connection_patches_disconnected = {
                sheet = {
                    filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/MOX-reactor-connect-patches-heated.png'
                    width = 32,
                    height = 32,
                    variation_count = 8,
                    y = 32,
                    hr_version = {
                        filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/hr-MOX-reactor-connect-patches-heated.png'
                        width = 64,
                        height = 64,
                        variation_count = 8,
                        y = 64,
                        scale = 0.5
                    }
                }
            },

            vehicle_impact_sound = data.raw['reactor']['nuclear-reactor'].vehicle_impact_sound
            open_sound = data.raw['reactor']['nuclear-reactor'].open_sound
            close_sound = data.raw['reactor']['nuclear-reactor'].close_sound
            working_sound = data.raw['reactor']['nuclear-reactor'].working_sound
            meltdown_action = data.raw['reactor']['nuclear-reactor'].meltdown_action
        }
    })
