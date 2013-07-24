-- TODO: Rebuild Windows HOST USING latest MOAI-DEV BRANCH!
-- MOAIEnvironment does not work on 1.4.0p

-- 

-- TODO: SOMEHOW CCTV's don't work anymore...... RANGE PROBLEM
----------------------
-- BEGIN HACK
 -- No more hack! Cleaned the fucker out!!
 ------------------------------
 -- END HACK
 --------------------------------
resX = MOAIEnvironment.screenWidth
resY = MOAIEnvironment.screenHeight
if resX == nil then resX = 1280 end
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
require "core.grid"
require "Game.game" -- THE ACTUAL MAIN FILE! MAIN LUA is AREA 51, front for area 52 :D

app_name = "Chaurus App"




layermgr = require "layermgr"

core:init( )
core:seWindow(resX, resY)
core:setViewPort(ViewPort1, resX, resY, 1)
core:newLayer(Layer1, 1)


MOAISim.setStep(1/60)
MOAIGfxDevice.setPenColor ( 1, 0, 0, 1 )

layermgr.addLayer("ActionPhase",1,core:returnLayer(1)) -- main game layer! TODO: Separate draw layers for diff states
--core:_debugRenderLayer(1) -- Still playing around with this.

Game:init( )


function GameLoop( )
	while true do
        FRAME = MOAISim.getPerformance ()
      	--print("FPS: "..FRAME.."")
        Game:loop( )
        coroutine.yield()
    end
end

mainThread = MOAICoroutine.new()
mainThread:run(GameLoop)






