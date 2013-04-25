Game = {} -- MAIN CLASS


local Grid = require ("Game.lib.jumper.grid") -- The grid class
local Pathfinder = require ("Game.lib.jumper.pathfinder") -- The pathfinder lass


Game.worldTimer = MOAISim.getElapsedTime( )
Game.mouseX = 0
Game.mouseY = 0


Game.MainLayer = 1
Game.GuiLayer = 2
Game.BackgroundLayer = 3
Game.score = 0
Game.FakeTimer = 691
walkable = 1

function Game:init( )
	image:init( )

	
end


function Game:update( )
	
	
end


function Game:draw( )


end

function Game:keypressed( key )

end

function Game:keyreleased( key )

end

function Game:touchPressed ( )



end

function Game:touchReleased ( )

end

function Game.touchLocation( x, y )
	
	Game.mouseX, Game.mouseY = core:returnLayerTable( )[1].layer:wndToWorld(x, y)
	Game.msX, Game.msY = x, y
	--print("TOUCHING! ALL THE TOUCHING AT: "..x.." and "..y.."")
	
	

end

function Game:ViewportScale(_ammount)
	core:returnViewPort( )[1].viewPort:setScale(core:returnVPWidth()/_ammount, -core:returnVPHeight()/_ammount)
end
--MOAIInputMgr.device.pointer:setCallback(Game.touchLocation)

function Game:estimateGridLocation( )

end

function Game:initPathfinding( )
	grid = Grid(map.collision) 
	
	pather = Pathfinder(grid, 'ASTAR', walkable) 
end

function Game:updatePathfinding( )
	grid = Grid(map.collision) 
	
	pather = Pathfinder(grid, 'ASTAR', walkable) 
end

function Game:loop( )
	Game:update( )
	Game:draw( )
end

function Game:drop( )
	image:dropProps( )
end

function onMouseLeftEvent(down)
  if (down) then
   
  else
    
  end
end
--MOAIInputMgr.device.mouseLeft:setCallback(onMouseLeftEvent)