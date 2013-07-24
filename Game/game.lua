Game = {} -- MAIN CLASS

-------------------------------------------
--------- GAME FILES ----------------------
--------------------------------------------
require "Game.file_io"
require "Game.camera"

--------------------------------------
---- PATHFINDER INCLUDES -------------
---------------------------------------

local Grid = require "Game.lib.jumper.grid" -- The grid class
local Pathfinder = require "Game.lib.jumper.pathfinder" -- The pathfinder lass


require "gui/support/class"



g = gui.GUI(resX, resY)

function Game:initGui( )
	
	g:addToResourcePath(filesystem.pathJoin("resources", "fonts"))
	g:addToResourcePath(filesystem.pathJoin("resources", "gui"))
	g:addToResourcePath(filesystem.pathJoin("resources", "media"))
	g:addToResourcePath(filesystem.pathJoin("resources", "themes"))
	g:addToResourcePath(filesystem.pathJoin("resources", "layouts"))

	layermgr.addLayer("gui", 99999, g:layer())
	g:setTheme("basetheme.lua")
	g:setCurrTextStyle("default")
	
end

function Game:init( )


	Game:initGui( )
	image:init()


end


function Game:update( )

	Game.worldTimer = MOAISim.getElapsedTime( )
	
	
	
end


function Game:draw( )



end

function Game:touchRight( )

end

function Game:keypressed( key )

end

function Game:keyreleased( key )

end

function Game:touchPressed ( )

end

function Game:dropUI(_gui, _resources)
	if (nil ~= _gui) then
		if (nil ~= widgets) then
        	unregisterScreenWidgets(widgets)
       	end
        _gui:layer():clear()
	end
end

function Game:touchReleased ( )

end

function Game.touchLocation( x, y )
	
	Game.mouseX, Game.mouseY = core:returnLayerTable( )[1].layer:wndToWorld(x, y)
	Game.msX, Game.msY = x, y
	--print("TOUCHING! ALL THE TOUCHING AT: "..x.." and "..y.."")
	
	g:injectMouseMove(x, y)

end

function Game:ViewportScale(_ammount)
	core:returnViewPort( )[1].viewPort:setScale(core:returnVPWidth()/_ammount, -core:returnVPHeight()/_ammount)
end
--MOAIInputMgr.device.pointer:setCallback(Game.touchLocation)


function Game:initPathfinding( )
	--grid = Grid(map.collision) 
	
	--pather = Pathfinder(grid, 'ASTAR', walkable) 
end

function Game:updatePathfinding( )
	--grid = Grid(map.collision) 
	
	--pather = Pathfinder(grid, 'ASTAR', walkable) 
end

function Game:loop( )
	Game:update( )
	Game:draw( )
end

function Game:drop( )
	
end

function onMouseLeftEvent(down)
  if (down) then
    g:injectMouseButtonDown(inputconstants.LEFT_MOUSE_BUTTON)
  else
    g:injectMouseButtonUp(inputconstants.LEFT_MOUSE_BUTTON)
  end
end
