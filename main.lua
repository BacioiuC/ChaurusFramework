resX = 1024
resY = 480

require "core.core"
require "core.image"
require "Game.game"
require "Game.map"
require "core.StateMachine"
require "core.input"
require "core.renderer"
require "extended.animations"


core:init( )
core:seWindow(resX, resY)
core:setViewPort(ViewPort1, resX, resY, 1)
core:newLayer(Layer1, 1)

MOAISim.setStep(1/60)


core:_debugRenderLayer(1) -- Still playing around with this.


image:init( )
Game:init( )

function GameLoop( )
	while true do
        FRAME = MOAISim.getElapsedFrames()
        Game:loop( )
        coroutine.yield()
    end
end

mainThread = MOAICoroutine.new()
mainThread:run(GameLoop)






