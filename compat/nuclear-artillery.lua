log("Nuclear artillery tweaks")

-- Add nuclear artillery to artillery guns

local function contains(table_to_search, item)
    for _, v in pairs(table_to_search) do
        if v == item then
            return true
        end
    end
    return false
end

for _, gun in pairs(data.raw['gun']) do
    if gun.attack_parameters.ammo_categories and not gun.attack_parameters.ammo_category then
        if contains(gun.attack_parameters.ammo_categories, 'artillery-shell') then
            table.insert(gun.attack_parameters.ammo_categories, 'artillery-shell')
        end
    end
    if gun.attack_parameters.ammo_category == 'artillery-shell' then
        gun.attack_parameters.ammo_categories = { 'artillery-shell', 'nuclear-artillery' }
        gun.attack_parameters.ammo_category = nil
    end
end

-- Add nuclear artillery damage bonus

local function affects_ammotype(effects, ammotype)
    for _, effect in pairs(effects) do
        if effect.type == "ammo-damage" and effect.ammo_category == ammotype then
            return effect.modifier
        end
    end
    return nil
end

if data.raw['ammo']['atomic-bomb'] and data.raw['ammo']['atomic-bomb'].ammo_type then
    local nuclear_artillery_base_ammotype
    local atomic_bomb_prototype = data.raw['ammo']['atomic-bomb']

    if atomic_bomb_prototype.ammo_category then
        nuclear_artillery_base_ammotype = { atomic_bomb_prototype.ammo_category }
    elseif atomic_bomb_prototype.ammo_type.category then
        nuclear_artillery_base_ammotype = { atomic_bomb_prototype.ammo_type.category }
    elseif atomic_bomb_prototype.ammo_type[1] then
        nuclear_artillery_base_ammotype = {}
        for _, ammotype in pairs(atomic_bomb_prototype.ammo_type) do
            table.insert(nuclear_artillery_base_ammotype, ammotype.category)
        end
    else
        log("Error: atomic bomb has no correct ammo type, not critical")
        nuclear_artillery_base_ammotype = {}
    end

    for _, ammotype in pairs(nuclear_artillery_base_ammotype) do
        for name, tech in pairs(data.raw['technology']) do
            if tech.effects ~= nil then
                local ammotype_effect = affects_ammotype(tech.effects, ammotype)
                if ammotype_effect then
                    table.insert(data.raw['technology'][name].effects,
                        { type = "ammo-damage", ammo_category = "nuclear-artillery", modifier = ammotype_effect })
                end
            end
        end
    end
end
