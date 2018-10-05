--[[
Copyright (C) 2018  John The Cooling Fan

This file is part of Plutonium Energy

Plutonium Energy is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Plutonium Energy is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
--]]

local plutonium_cannon_shell_explosion = util.table.deepcopy(data.raw["explosion"]["big-explosion"])
plutonium_cannon_shell_explosion.name = "plutonium-cannon-shell-explosion"
plutonium_cannon_shell_explosion.animations[1].tint = {r = 0.4, g = 0.4, b = 0.4}
data:extend({plutonium_cannon_shell_explosion})

local plutonium_cannon_explosion = util.table.deepcopy(data.raw["explosion"]["explosion"])
plutonium_cannon_explosion.name = "plutonium-cannon-explosion"
for k, v in pairs(plutonium_cannon_explosion.animations) do
  v.tint = {r = 0.4, g = 0.4, b = 0.4}
end
data:extend({plutonium_cannon_explosion})

local plutonium_atomic_explosion = util.table.deepcopy(data.raw["projectile"]["atomic-rocket"])
plutonium_atomic_explosion.name = "plutonium-atomic-rocket"
plutonium_atomic_explosion.action.action_delivery.target_effects[1].repeat_count = 150
plutonium_atomic_explosion.action.action_delivery.target_effects[3].damage.amount = 600
plutonium_atomic_explosion.action.action_delivery.target_effects[5].action.repeat_count = 3000
plutonium_atomic_explosion.action.action_delivery.target_effects[5].action.radius = 55
data:extend({plutonium_atomic_explosion})

data:extend({
	{
    type = "projectile",
    name = "plutonium-cannon-projectile",
    flags = {"not-on-map"},
    collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
    acceleration = 0,
    direction_only = true,
    piercing_damage = 600,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
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
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          }
        }
      }
    },
    animation =
    {
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
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
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
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "plutonium-cannon-shell-explosion"
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              radius = 4.25,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
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
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
    }
  },
})