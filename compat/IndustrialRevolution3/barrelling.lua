-- IR3 uses a barrelling technology and special barrelling machines, so hide the "convenience" recipes and add additional prerequisites

data.raw['technology']['plutonium-processing'].prerequisites = {
    "uranium-processing",
    "nuclear-fuel-reprocessing",
    "ir-barrelling"
}

-- Hide a recipe and remove it from technologies
local function hide_recipe(name, technology_name)
    data.raw['recipe'][name].hidden = true
    data.raw['recipe'][name].enabled = false
    if technology_name ~= nil then
        for index, effect in pairs(data.raw['technology'][technology_name].effects) do
            if effect.recipe == name then
                table.remove(data.raw['technology'][technology_name].effects, index)
            end
        end
    end
end

hide_recipe('advanced-nuclear-fuel-reprocessing-with-barrelling', 'plutonium-processing')
hide_recipe('breeder-fuel-cell-reprocessing-with-barrelling', 'nuclear-breeding')
