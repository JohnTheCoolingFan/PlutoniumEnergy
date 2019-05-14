for index, force in pairs(game.forces) do
	local technologies = force.technologies;
	local recipes = force.recipes;
	recipes["plutonium-atomic-artillery-shell"].enabled = technologies["plutonium-ammo"].researched
end
