
----------------------
-- BEGIN HACK

 ------------------------------
 -- END HACK
 --------------------------------
resX = MOAIEnvironment.screenWidth
resY = MOAIEnvironment.screenHeight
if resX == nil then resX = 1024 end
if resY == nil then resY = 768 end

-----------------------------------------
----- USER INTERFACE ----------------------
---------------------------------------------
require "gui/support/class"

gui = require "gui/gui"
resources = require "gui/support/resources"
filesystem = require "gui/support/filesystem"
inputconstants = require "gui/support/inputconstants"

--------------------------------------------
----------------------------------------------
--------------------------------------------

require "core.core"
require "core.image"
require "core.StateMachine"
require "core.input"
require "core.renderer"
require "core.math"
require "extended.animations"
require "Game.game"

app_name = "Ludumdare-26"




layermgr = require "layermgr"

core:init( )
core:seWindow(resX, resY)
core:setViewPort(ViewPort1, resX, resY, 1)
core:newLayer(Layer1, 1)

MOAISim.setStep(1/60)
MOAIGfxDevice.setPenColor ( 1, 0, 0, 1 )

layermgr.addLayer("ActionPhase",1,core:returnLayer(1))
--core:_debugRenderLayer(1) -- Still playing around with this.

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






