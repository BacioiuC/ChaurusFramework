resX = 1024
resY = 480

require "core.core"
require "core.image"
require "Game.game"
require "Game.map"
require "core.StateMachine"
require "core.input"
require "core.renderer"


core:init( )
core:seWindow(resX, resY)
core:setViewPort(ViewPort1, resX, resY, 1)
core:newLayer(Layer1, 1)

core:_debugRenderLayer(1)





mainThread = MOAICoroutine.new()

image:init( )
--Game:init( )

image:newTexture("media/pimp.png",1,"PIMP")
image:newTexture("media/water.png",1,"WATER_TEX")
image:renderImage("PIMP",-100,0)
image:renderImage("WATER_TEX",32,32)
image:renderImage("WATER_TEX",32,64)
image:renderImage("PIMP",200,32)
--image:dropImage("PIMP")
image:renderImage("PIMP",200,100)


function GameLoop( )
	Game:update( )
end

mainThread:run(GameLoop)






