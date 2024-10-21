require 'util'

local remnants = {}


local MOX_reactor = util.table.deepcopy(data.raw['corpse']['nuclear-reactor-remnants'])

MOX_reactor.name = 'MOX-reactor-remnants'
MOX_reactor.icon = '__PlutoniumEnergy__/graphics/icons/MOX-reactor.png'
MOX_reactor.animation.filename = '__PlutoniumEnergy__/graphics/entity/MOX-reactor/remnants/hr-MOX-reactor-remnants.png'
MOX_reactor.animation.scale = 0.6 * 0.5

table.insert(remnants, MOX_reactor)

local breeder_reactor = util.table.deepcopy(data.raw['corpse']['nuclear-reactor-remnants'])

breeder_reactor.name = 'breeder-reactor-remnants'
breeder_reactor.icon = '__PlutoniumEnergy__/graphics/icons/breeder-reactor.png'
breeder_reactor.animation.scale = 1.4 * 0.5

table.insert(remnants, breeder_reactor)


data:extend(remnants)
