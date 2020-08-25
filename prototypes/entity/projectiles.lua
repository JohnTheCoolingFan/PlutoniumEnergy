local projectiles = {}

local plutonium_cannon_shell_explosion = util.table.deepcopy(data.raw["explosion"]["big-explosion"])
plutonium_cannon_shell_explosion.name = "plutonium-cannon-shell-explosion"
plutonium_cannon_shell_explosion.animations[1].tint = {r = 0.1, g = 0.9, b = 0.7}
table.insert(projectiles, plutonium_cannon_shell_explosion)


local plutonium_cannon_explosion = util.table.deepcopy(data.raw["explosion"]["explosion"])
plutonium_cannon_explosion.name = "plutonium-cannon-explosion"
for k, v in pairs(plutonium_cannon_explosion.animations) do
    v.tint = {r = 0.1, g = 0.9, b = 0.7}
end
table.insert(projectiles, plutonium_cannon_explosion)


-- atomic rocket * 1.4
local plutonium_atomic_rocket = util.table.deepcopy(data.raw["projectile"]["atomic-rocket"])
plutonium_atomic_rocket.name = "plutonium-atomic-rocket"
plutonium_atomic_rocket.action.action_delivery.target_effects[1].radius = 17                           -- math.ceil(12 * 1.4)
plutonium_atomic_rocket.action.action_delivery.target_effects[2].radius = 13                           -- 9 * 1.4 = 12.6
plutonium_atomic_rocket.action.action_delivery.target_effects[7].damage.amount = 560                   -- 400 * 1.4
plutonium_atomic_rocket.action.action_delivery.target_effects[10].radius = 20                          -- 14 * 1.4
plutonium_atomic_rocket.action.action_delivery.target_effects[11].spawn_min_radius = 16.5 -- Rough numbers
plutonium_atomic_rocket.action.action_delivery.target_effects[11].spawn_max_radius = 17.5
plutonium_atomic_rocket.action.action_delivery.target_effects[11].spawn_min = 45
plutonium_atomic_rocket.action.action_delivery.target_effects[11].spawn_max = 60
plutonium_atomic_rocket.action.action_delivery.target_effects[12].action.repeat_count = 1400           -- 1000 * 1.4
plutonium_atomic_rocket.action.action_delivery.target_effects[12].action.radius = 10                   -- 7 * 1.4
plutonium_atomic_rocket.action.action_delivery.target_effects[12].action.action_delivery.starting_speed = 0.5*0.8 * 1.4
plutonium_atomic_rocket.action.action_delivery.target_effects[13].action.repeat_count = 1400           -- 1000 * 1.4
plutonium_atomic_rocket.action.action_delivery.target_effects[13].action.radius = 50                   -- 35 * 1.4
plutonium_atomic_rocket.action.action_delivery.target_effects[13].action.action_delivery.starting_speed = 0.5*0.7 * 1.4
plutonium_atomic_rocket.action.action_delivery.target_effects[14].action.repeat_count = 1400           -- 1000 * 1.4
plutonium_atomic_rocket.action.action_delivery.target_effects[14].action.radius = 36                   -- 26 * 1.4
plutonium_atomic_rocket.action.action_delivery.target_effects[14].action.action_delivery.starting_speed = 0.5*0.7 * 1.4
plutonium_atomic_rocket.action.action_delivery.target_effects[15].action.repeat_count = 980            -- 700 * 1.4
plutonium_atomic_rocket.action.action_delivery.target_effects[15].action.radius = 6                    -- 4 * 1.4
plutonium_atomic_rocket.action.action_delivery.target_effects[15].action.action_delivery.starting_speed = 0.5*0.65 * 1.4
plutonium_atomic_rocket.action.action_delivery.target_effects[16].action.repeat_count = 1400           -- 1000 * 1.4
plutonium_atomic_rocket.action.action_delivery.target_effects[16].action.radius = 11                   -- 8 * 1.4
plutonium_atomic_rocket.action.action_delivery.target_effects[16].action.action_delivery.starting_speed = 0.5*0.65 * 1.4
plutonium_atomic_rocket.action.action_delivery.target_effects[17].action.repeat_count = 420            -- 300 * 1.4
plutonium_atomic_rocket.action.action_delivery.target_effects[17].action.radius = 36                   -- 26 * 1.4
plutonium_atomic_rocket.action.action_delivery.target_effects[17].action.action_delivery.starting_speed = 0.5*0.65 * 1.4
plutonium_atomic_rocket.action.action_delivery.target_effects[18].action.repeat_count = 14             -- 10 * 1.4
plutonium_atomic_rocket.action.action_delivery.target_effects[18].action.radius = 11                   -- 8 * 1.4
table.insert(projectiles, plutonium_atomic_rocket)


if mods['bobwarfare'] then
    local plutonium_atomic_artillery_projectile = util.table.deepcopy(data.raw["artillery-projectile"]["atomic-artillery-projectile"])

    plutonium_atomic_artillery_projectile.name = "plutonium-atomic-artillery-projectile"

    plutonium_atomic_artillery_projectile.picture.filename = "__PlutoniumEnergy__/graphics/entity/plutonium-artillery-projectile/hr-plutonium-atomic-shell.png"
    plutonium_atomic_artillery_projectile.chart_picture.filename = "__PlutoniumEnergy__/graphics/entity/plutonium-artillery-projectile/plutonium-atomic-artillery-shoot-map-visualization.png"

    plutonium_atomic_artillery_projectile.action.action_delivery.target_effects[1].repeat_count = 140
    plutonium_atomic_artillery_projectile.action.action_delivery.target_effects[3].damage.amount = 560
    plutonium_atomic_artillery_projectile.action.action_delivery.target_effects[6].radius = 10
    plutonium_atomic_artillery_projectile.action.action_delivery.target_effects[7].action.repeat_count = 2800
    plutonium_atomic_artillery_projectile.action.action_delivery.target_effects[7].action.radius = 50
    --plutonium_atomic_artillery_projectile.action.action_delivery.target_effects[7].action.action_delivery.projectile = "plutonium-atomic-artillery-wave"
    table.insert(projectiles, plutonium_atomic_artillery_projectile)


    --[[local plutonium_atomic_artillery_wave = util.table.deepcopy(data.raw["projectile"]["atomic-artillery-wave"])
    plutonium_atomic_artillery_wave.name = "plutonium-atomic-artillery-wave"
    plutonium_atomic_artillery_wave.action[2].action_delivery.target_effects.damage.amount = 5600
    table.insert(projectiles, plutonium_atomic_artillery_wave)]]

elseif mods["AtomicArtillery"] then
    local plutonium_atomic_artillery_projectile = util.table.deepcopy(data.raw["artillery-projectile"]["atomic-artillery-projectile"])

    plutonium_atomic_artillery_projectile.name = "plutonium-atomic-artillery-projectile"

    plutonium_atomic_artillery_projectile.picture.filename = "__PlutoniumEnergy__/graphics/entity/plutonium-artillery-projectile/hr-plutonium-atomic-shell.png"
    plutonium_atomic_artillery_projectile.chart_picture.filename = "__PlutoniumEnergy__/graphics/entity/plutonium-artillery-projectile/plutonium-atomic-artillery-shoot-map-visualization.png"

    plutonium_atomic_artillery_projectile.action.action_delivery.target_effects[1].repeat_count = 140
    plutonium_atomic_artillery_projectile.action.action_delivery.target_effects[3].damage.amount = 2100
    plutonium_atomic_artillery_projectile.action.action_delivery.target_effects[5].action.repeat_count = 5600
    plutonium_atomic_artillery_projectile.action.action_delivery.target_effects[5].action.radius = 70
    plutonium_atomic_artillery_projectile.action.action_delivery.target_effects[5].action.action_delivery.projectile = "plutonium-atomic-artillery-wave"
    table.insert(projectiles, plutonium_atomic_artillery_projectile)


    local plutonium_atomic_artillery_wave = util.table.deepcopy(data.raw["projectile"]["atomic-artillery-wave"])
    plutonium_atomic_artillery_wave.name = "plutonium-atomic-artillery-wave"
    plutonium_atomic_artillery_wave.action[2].action_delivery.target_effects.damage.amount = 5600
    table.insert(projectiles, plutonium_atomic_artillery_wave)

end

data:extend(projectiles)

data:extend({
	{
        type = "projectile",
        name = "plutonium-cannon-projectile",
        flags = {"not-on-map"},
        collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
        acceleration = 0,
        direction_only = true,
        piercing_damage = 600,
        action = {
            type = "direct",
            action_delivery = {
                type = "instant",
                target_effects = {
                    {
                        type = "damage",
                        damage = {amount = 600 , type = "physical"}
                    },
                    {
                        type = "damage",
                        damage = {amount = 300 , type = "explosion"}
                    },
                    {
                        type = "create-entity",
                        entity_name = "plutonium-cannon-explosion"
                    }
                }
            }
        },
        final_action = {
            type = "direct",
            action_delivery = {
                type = "instant",
                target_effects = {
                    {
                        type = "create-entity",
                        entity_name = "small-scorchmark",
                        check_buildability = true
                    }
                }
            }
        },
        animation = {
            filename = "__base__/graphics/entity/bullet/bullet.png",
            frame_count = 1,
            width = 3,
            height = 50,
            priority = "high"
        }
    },
    {
        type = "projectile",
        name = "explosive-plutonium-cannon-projectile",
        flags = {"not-on-map"},
        collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
        acceleration = 0,
        piercing_damage = 150,
        action = {
            type = "direct",
            action_delivery = {
                type = "instant",
                target_effects = {
                    {
                        type = "damage",
                        damage = {amount = 525 , type = "physical"}
                    },
                    {
                        type = "create-entity",
                        entity_name = "plutonium-cannon-explosion"
                    }
                }
            }
        },
        final_action = {
            type = "direct",
            action_delivery = {
                type = "instant",
                target_effects = {
                    {
                        type = "create-entity",
                        entity_name = "plutonium-cannon-shell-explosion"
                    },
                    {
                        type = "nested-result",
                        action = {
                            type = "area",
                            radius = 4.25,
                            action_delivery = {
                                type = "instant",
                                target_effects = {
                                    {
                                        type = "damage",
                                        damage = {amount = 475, type = "explosion"}
                                    },
                                    {
                                        type = "create-entity",
                                        entity_name = "plutonium-cannon-explosion"
                                    }
                                }
                            }
                        }
                    },
                    {
                        type = "create-entity",
                        entity_name = "small-scorchmark",
                        check_buildability = true
                    }
                }
            }
        },
        animation = {
            filename = "__base__/graphics/entity/bullet/bullet.png",
            frame_count = 1,
            width = 3,
            height = 50,
            priority = "high"
        }
    }
})
