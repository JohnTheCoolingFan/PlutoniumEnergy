-- Action/trigger modification functions
local trigger_functions = {}

function trigger_functions.multiply_effect(effect, multiplier)
    if effect.repeat_count and effect.repeat_count > 1 then
        effect.repeat_count = math.floor(effect.repeat_count * multiplier)
    end
    if effect.type == "nested-result" then
        trigger_functions.multiply_action(effect.action, multiplier)
    end
    if effect.type == "damage" then
        effect.damage.amount = math.floor(effect.damage.amount * multiplier)
    end
    if effect.type == "set-tile" then
        effect.radius = effect.radius * multiplier
    end
    if effect.type == "destroy-cliffs" then
        effect.radius = effect.radius * multiplier
    end
    if effect.type == "create-decorative" then
        effect.spawn_max = math.floor(effect.spawn_max * multiplier)
        effect.spawn_max_radius = effect.spawn_max_radius * multiplier
        effect.spawn_min_radius = effect.spawn_min_radius * multiplier
    end
end

function trigger_functions.multiply_delivery(delivery, multiplier)
    if delivery.type == "projectile" then
        delivery.starting_speed = delivery.starting_speed * multiplier
    end
end

function trigger_functions.multiply_action(action, multiplier)
    if action.repeat_count and action.repeat_count > 1 then
        action.repeat_count = math.floor(action.repeat_count * multiplier)
    end
    if action.type == "area" then
        action.radius = action.radius * multiplier
    elseif action.type == "line" then
        action.range = action.range * multiplier
        action.width = action.width * multiplier
    elseif action.type == "cluster" then
        action.cluster_count = math.floor(action.cluster_count * multiplier)
        action.distance = action.distance * multiplier
    end
    if action.action_delivery then
        if action.action_delivery.target_effects and #action.action_delivery.target_effects > 0 then
            for _, effect in pairs(action.action_delivery.target_effects) do
                trigger_functions.multiply_effect(effect, multiplier)
            end
        end
        if action.action_delivery.type then
            trigger_functions.multiply_delivery(action.action_delivery, multiplier)
        end
    end
end

local sounds = require("__base__.prototypes.entity.sounds")

-- Plutonium Atomic Bomb fire entity
local atomic_bomb_fire = util.table.deepcopy(data.raw['fire']['fire-flame'])

atomic_bomb_fire.name = 'atomic-bomb-fire-flame'
atomic_bomb_fire.initial_lifetime = 2700

data:extend({ atomic_bomb_fire })

-- Plutonium Atomic bomb action (explosion)
local plutonium_atomic_bomb_action =
{
    type = "direct",
    action_delivery =
    {
        type = "instant",
        target_effects =
        {
            {
                type = "set-tile",
                tile_name = "nuclear-ground",
                radius = 17, -- This
                apply_projection = true,
                tile_collision_mask = { "water-tile" }
            },
            {
                type = "destroy-cliffs",
                radius = 35, -- This
                explosion = "explosion"
            },
            {
                type = "create-entity",
                entity_name = "nuke-explosion"
            },
            {
                type = "camera-effect",
                effect = "screen-burn",
                duration = 80,
                ease_in_duration = 5,
                ease_out_duration = 70,
                delay = 0,
                strength = 8,
                full_strength_max_distance = 200,
                max_distance = 2000
            },
            {
                type = "play-sound",
                sound = sounds.nuclear_explosion(0.9),
                play_on_target_position = false,
                -- min_distance = 200,
                max_distance = 2500,
                -- volume_modifier = 1,
                audible_distance_modifier = 3
            },
            {
                type = "play-sound",
                sound = sounds.nuclear_explosion_aftershock(0.4),
                play_on_target_position = false,
                -- min_distance = 200,
                max_distance = 2500,
                -- volume_modifier = 1,
                audible_distance_modifier = 3
            },
            {
                type = "damage",
                damage = { amount = 1000, type = "explosion" } -- This
            },
            {
                type = "damage",
                damage = { amount = 500, type = "physical" } -- This
            },
            {
                type = "damage",
                damage = { amount = 1000, type = "fire" } -- This
            },
            {
                type = "create-entity",
                entity_name = "huge-scorchmark",
                offsets = { { 0, -0.5 } },
                check_buildability = true
            },
            {
                type = "invoke-tile-trigger",
                repeat_count = 1
            },
            {
                type = "destroy-decoratives",
                from_render_layer = "decorative",
                to_render_layer = "object",
                include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
                include_decals = true,
                invoke_decorative_trigger = true,
                decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
                radius = 60                            -- large radius for demostrative purposes -- This
            },
            {
                type = "create-decorative",
                decorative = "nuclear-ground-patch",
                spawn_min_radius = 21.5, -- This
                spawn_max_radius = 22.5, -- This
                spawn_min = 55,          -- This
                spawn_max = 80,          -- This
                apply_projection = true,
                spread_evenly = true
            },
            {
                type = "nested-result",
                action = {
                    type = "area",
                    target_entities = false,
                    trigger_from_target = true,
                    repeat_count = 4000,
                    radius = 35,
                    action_delivery = {
                        type = "instant",
                        target_effects = {
                            type = "create-fire",
                            entity_name = "atomic-bomb-fire-flame",
                        }
                    }
                }
            },
            {
                type = "nested-result",
                action =
                {
                    type = "area",
                    target_entities = false,
                    trigger_from_target = true,
                    repeat_count = 3000, -- This
                    radius = 30,         -- This
                    action_delivery =
                    {
                        type = "projectile",
                        projectile = "atomic-bomb-ground-zero-projectile",
                        starting_speed = 0.6 * 0.8 * 2.5, -- This
                        starting_speed_deviation = nuke_shockwave_starting_speed_deviation
                    }
                }
            },
            {
                type = "nested-result",
                action =
                {
                    type = "area",
                    target_entities = false,
                    trigger_from_target = true,
                    repeat_count = 4000, -- This
                    radius = 100,        -- This
                    action_delivery =
                    {
                        type = "projectile",
                        projectile = "atomic-bomb-wave",
                        starting_speed = 0.5 * 0.7 * 2.5, -- This
                        starting_speed_deviation = nuke_shockwave_starting_speed_deviation
                    }
                }
            },
            {
                type = "nested-result",
                action =
                {
                    type = "area",
                    show_in_tooltip = false,
                    target_entities = false,
                    trigger_from_target = true,
                    repeat_count = 2500, -- This
                    radius = 60,         -- This
                    action_delivery =
                    {
                        type = "projectile",
                        projectile = "atomic-bomb-wave-spawns-cluster-nuke-explosion",
                        starting_speed = 0.5 * 0.7 * 2.1, -- This
                        starting_speed_deviation = nuke_shockwave_starting_speed_deviation
                    }
                }
            },
            {
                type = "nested-result",
                action =
                {
                    type = "area",
                    show_in_tooltip = false,
                    target_entities = false,
                    trigger_from_target = true,
                    repeat_count = 2000, -- This
                    radius = 8,          -- This
                    action_delivery =
                    {
                        type = "projectile",
                        projectile = "atomic-bomb-wave-spawns-fire-smoke-explosion",
                        starting_speed = 0.5 * 0.65 * 2.5, -- This
                        starting_speed_deviation = nuke_shockwave_starting_speed_deviation
                    }
                }
            },
            {
                type = "nested-result",
                action =
                {
                    type = "area",
                    show_in_tooltip = false,
                    target_entities = false,
                    trigger_from_target = true,
                    repeat_count = 3500, -- This
                    radius = 35,         -- This
                    action_delivery =
                    {
                        type = "projectile",
                        projectile = "atomic-bomb-wave-spawns-nuke-shockwave-explosion",
                        starting_speed = 0.5 * 0.65 * 3.5, -- This
                        starting_speed_deviation = nuke_shockwave_starting_speed_deviation
                    }
                }
            },
            {
                type = "nested-result",
                action =
                {
                    type = "area",
                    show_in_tooltip = false,
                    target_entities = false,
                    trigger_from_target = true,
                    repeat_count = 1500, -- This
                    radius = 55,         -- This
                    action_delivery =
                    {
                        type = "projectile",
                        projectile = "atomic-bomb-wave-spawns-nuclear-smoke",
                        starting_speed = 0.5 * 0.65 * 2.5, -- This
                        starting_speed_deviation = nuke_shockwave_starting_speed_deviation
                    }
                }
            },
            {
                type = "nested-result",
                action =
                {
                    type = "area",
                    show_in_tooltip = false,
                    target_entities = false,
                    trigger_from_target = true,
                    repeat_count = 25, -- This
                    radius = 15,       -- This
                    action_delivery =
                    {
                        type = "instant",
                        target_effects =
                        {
                            {
                                type = "create-entity",
                                entity_name = "nuclear-smouldering-smoke-source",
                                tile_collision_mask = { "water-tile" }
                            }
                        }
                    }
                }
            }
        }
    }
}

local projectiles = {}

-- Plutonium cannon shell explosions
local plutonium_cannon_shell_explosion = util.table.deepcopy(data.raw["explosion"]["big-explosion"])
plutonium_cannon_shell_explosion.name = "plutonium-cannon-shell-explosion"
plutonium_cannon_shell_explosion.animations[1].tint = { r = 0.1, g = 0.9, b = 0.7 }
table.insert(projectiles, plutonium_cannon_shell_explosion)

local plutonium_cannon_explosion = util.table.deepcopy(data.raw["explosion"]["explosion"])
plutonium_cannon_explosion.name = "plutonium-cannon-explosion"
for _, spritesheet in pairs(plutonium_cannon_explosion.animations) do
    spritesheet.tint = { r = 0.1, g = 0.9, b = 0.7 }
end
table.insert(projectiles, plutonium_cannon_explosion)


-- IR3 atomic artillery
if mods['IndustrialRevolution3'] then
    local plutonium_atomic_artillery_projectile = util.table.deepcopy(
        data.raw['artillery-projectile']['atomic-artillery-projectile']
    )

    plutonium_atomic_artillery_projectile.name = 'plutonium-atomic-artillery-projectile'
    plutonium_atomic_artillery_projectile.picture.filename =
    "__PlutoniumEnergy__/graphics/entity/plutonium-artillery-projectile/hr-plutonium-atomic-shell.png"
    plutonium_atomic_artillery_projectile.chart_picture.filename =
    "__PlutoniumEnergy__/graphics/entity/plutonium-artillery-projectile/plutonium-atomic-artillery-shoot-map-visualization.png"

    plutonium_atomic_artillery_projectile.action = plutonium_atomic_bomb_action

    table.insert(projectiles, plutonium_atomic_artillery_projectile)
end

data:extend(projectiles)

-- Rest of the prototypes
data:extend({
    -- Regular cannon projectile
    {
        type = "projectile",
        name = "plutonium-cannon-projectile",
        flags = { "not-on-map" },
        collision_box = { { -0.3, -1.1 }, { 0.3, 1.1 } },
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
                        damage = { amount = 600, type = "physical" }
                    },
                    {
                        type = "damage",
                        damage = { amount = 300, type = "explosion" }
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
    -- Explosive cannon projectile
    {
        type = "projectile",
        name = "explosive-plutonium-cannon-projectile",
        flags = { "not-on-map" },
        collision_box = { { -0.3, -1.1 }, { 0.3, 1.1 } },
        acceleration = 0,
        piercing_damage = 150,
        action = {
            type = "direct",
            action_delivery = {
                type = "instant",
                target_effects = {
                    {
                        type = "damage",
                        damage = { amount = 525, type = "physical" }
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
                                        damage = { amount = 475, type = "explosion" }
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
    },
    -- Plutonium atomic rocket (not used, replaced by atomic artillery)
    {
        type = "projectile",
        name = "plutonium-atomic-rocket",
        flags = { "not-on-map" },
        acceleration = 0.005,
        turn_speed = 0.003,
        turning_speed_increases_exponentially_with_projectile_speed = true,
        action = plutonium_atomic_bomb_action,
        --light = {intensity = 0.8, size = 15},
        animation =
        {
            filename = "__base__/graphics/entity/rocket/rocket.png",
            draw_as_glow = true,
            frame_count = 8,
            line_length = 8,
            width = 9,
            height = 35,
            shift = { 0, 0 },
            priority = "high"
        },
        shadow =
        {
            filename = "__base__/graphics/entity/rocket/rocket-shadow.png",
            frame_count = 1,
            width = 7,
            height = 24,
            priority = "high",
            shift = { 0, 0 }
        },
        smoke =
        {
            {
                name = "smoke-fast",
                deviation = { 0.15, 0.15 },
                frequency = 1,
                position = { 0, 1 },
                slow_down_factor = 1,
                starting_frame = 3,
                starting_frame_deviation = 5,
                starting_frame_speed = 0,
                starting_frame_speed_deviation = 5
            }
        }
    },
    -- Plutonium Atomic Artillery projectile, replacement for Plutonium atomic bomb
    {
        type = "projectile",
        name = "plutonium-atomic-artillery-projectile",
        flags = { "not-on-map" },
        reveal_map = true,
        map_color = { r = 0, g = 1, b = 1 },
        picture =
        {
            filename = "__PlutoniumEnergy__/graphics/entity/plutonium-artillery-projectile/hr-plutonium-atomic-shell.png",
            draw_as_glow = true,
            width = 64,
            height = 64,
            scale = 0.5
        },
        shadow =
        {
            filename = "__base__/graphics/entity/artillery-projectile/hr-shell-shadow.png",
            width = 64,
            height = 64,
            scale = 0.5
        },
        chart_picture =
        {
            filename =
            "__PlutoniumEnergy__/graphics/entity/plutonium-artillery-projectile/plutonium-atomic-artillery-shoot-map-visualization.png",
            flags = { "icon" },
            frame_count = 1,
            width = 64,
            height = 64,
            priority = "high",
            scale = 0.25
        },
        height_from_ground = 280 / 64,
        action = plutonium_atomic_bomb_action,

    }
})
