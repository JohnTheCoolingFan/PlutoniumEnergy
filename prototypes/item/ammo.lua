local item_sounds = require("__base__.prototypes.item_sounds")

if settings.startup['enable-plutonium-ammo'].value then
    data:extend({
        -- Ammo
        {
            type = "ammo",
            name = "plutonium-rounds-magazine",
            icon = "__PlutoniumEnergy__/graphics/icons/plutonium-rounds-magazine.png",
            icon_size = 64,
            icon_mipmaps = 4,
            ammo_category = "bullet",
            ammo_type = {
                action = {
                    type = "direct",
                    action_delivery = {
                        type = "instant",
                        source_effects = {
                            type = "create-explosion",
                            entity_name = "explosion-gunshot"
                        },
                        target_effects = {
                            {
                                type = "create-entity",
                                entity_name = "explosion-hit"
                            },
                            {
                                type = "damage",
                                damage = { amount = 36, type = "physical" }
                            }
                        }
                    }
                }
            },
            magazine_size = 10,
            subgroup = "ammo",
            order = "a[basic-clips]-d[plutonium-rounds-magazine]",
            inventory_move_sound = item_sounds.ammo_small_inventory_move,
            pick_sound = item_sounds.ammo_small_inventory_pickup,
            drop_sound = item_sounds.ammo_small_inventory_move,
            stack_size = 200,
            weight = 40 * kg
        },
        {
            type = "ammo",
            name = "plutonium-cannon-shell",
            icon = "__PlutoniumEnergy__/graphics/icons/plutonium-cannon-shell.png",
            icon_size = 64,
            icon_mipmaps = 4,
            ammo_category = "cannon-shell",
            ammo_type = {
                target_type = "direction",
                action = {
                    type = "direct",
                    action_delivery = {
                        type = "projectile",
                        projectile = "plutonium-cannon-projectile",
                        starting_speed = 1,
                        direction_deviation = 0.1,
                        range_deviation = 0.1,
                        max_range = 35,
                        source_effects = {
                            type = "create-explosion",
                            entity_name = "explosion-gunshot"
                        }
                    }
                }
            },
            subgroup = "ammo",
            order = "d[explosive-cannon-shell]-c[yplutonium]",
            inventory_move_sound = item_sounds.ammo_large_inventory_move,
            pick_sound = item_sounds.ammo_large_inventory_pickup,
            drop_sound = item_sounds.ammo_large_inventory_move,
            stack_size = 100,
            weight = 40 * kg
        },
        {
            type = "ammo",
            name = "explosive-plutonium-cannon-shell",
            icon = "__PlutoniumEnergy__/graphics/icons/explosive-plutonium-cannon-shell.png",
            icon_size = 64,
            icon_mipmaps = 4,
            ammo_category = "cannon-shell",
            ammo_type = {
                target_type = "direction",
                action = {
                    type = "direct",
                    action_delivery = {
                        type = "projectile",
                        projectile = "explosive-plutonium-cannon-projectile",
                        starting_speed = 1,
                        direction_deviation = 0.1,
                        range_deviation = 0.1,
                        max_range = 35,
                        source_effects = {
                            type = "create-explosion",
                            entity_name = "explosion-gunshot"
                        }
                    }
                }
            },
            subgroup = "ammo",
            order = "d[explosive-cannon-shell]-c[zplutonium]",
            inventory_move_sound = item_sounds.ammo_large_inventory_move,
            pick_sound = item_sounds.ammo_large_inventory_pickup,
            drop_sound = item_sounds.ammo_large_inventory_move,
            stack_size = 100,
            weight = 40 * kg
        }
    })
end
data:extend({
    {
        type = "ammo",
        name = "plutonium-atomic-artillery-shell",
        icon = "__PlutoniumEnergy__/graphics/icons/plutonium-atomic-artillery-shell.png",
        icon_size = 64,
        icon_mipmaps = 4,
        ammo_category = "nuclear-artillery",
        ammo_type = {
            target_type = "position",
            action = {
                type = "direct",
                action_delivery = {
                    type = "artillery",
                    projectile = "plutonium-atomic-artillery-projectile",
                    starting_speed = 1,
                    direction_deviation = 0,
                    range_deviation = 0,
                    source_effects = {
                        type = "create-explosion",
                        entity_name = "artillery-cannon-muzzle-flash"
                    }
                }
            }
        },
        subgroup = "ammo",
        order = "d[rocket-launcher]-c[atomic-bomb]",
        stack_size = 1,
        weight = 150 * kg
    }
})
