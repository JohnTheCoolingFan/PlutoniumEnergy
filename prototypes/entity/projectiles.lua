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

local plutonium_atomic_rocket = util.table.deepcopy(data.raw["projectile"]["atomic-rocket"])
plutonium_atomic_rocket.name = "plutonium-atomic-rocket"
plutonium_atomic_rocket.action.action_delivery.target_effects[1].repeat_count = 140
plutonium_atomic_rocket.action.action_delivery.target_effects[3].damage.amount = 560
plutonium_atomic_rocket.action.action_delivery.target_effects[5].action.repeat_count = 2800
plutonium_atomic_rocket.action.action_delivery.target_effects[5].action.radius = 50
table.insert(projectiles, plutonium_atomic_rocket)

if mods["AtomicArtillery"] then
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
