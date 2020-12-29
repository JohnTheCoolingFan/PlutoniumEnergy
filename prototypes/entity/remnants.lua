require 'util'

local remnants = {}


local MOX_reactor = util.table.deepcopy(data.raw['corpse']['nuclear-reactor-remnants'])

MOX_reactor.name = 'MOX-reactor-remnants'
MOX_reactor.icon = '__PlutoniumEnergy__/graphics/icons/MOX-reactor.png'
MOX_reactor.animation.filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/remnants/MOX-reactor-remnants.png'
MOX_reactor.animation.scale = 0.6
MOX_reactor.animation.filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/remnants/hr-MOX-reactor-remnants.png'
MOX_reactor.animation.scale = 0.3

table.insert(remnants, MOX_reactor)


data:extend(remnants)
