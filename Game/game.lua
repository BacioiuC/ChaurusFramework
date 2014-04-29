Game = {} -- MAIN CLASS

Game.modInUse = "stream"

local Grid = require ("Game.lib.jumper.grid")
-- Calls the pathfinder class
local Pathfinder = require ("Game.lib.jumper.pathfinder")



-------------------------------------------
--------- GAME FILES ----------------------
--------------------------------------------
-- needed to allow images and animations to be loaded from /mods
-- doing this to avoid having to mantain two separate versions of my /Chaurus framework from /core
require "Game.wrapper.wImage"
require "Game.wrapper.wAnim"
require "Game.wrapper.wEffect"

require "Game.include_list"

--- WOOOHOO works!
for i,v in ipairs(includeList) do

	local prePath = "mods."..Game.modInUse.."."

	if isModuleAvailable(""..prePath..""..v.."") == false then
		prePath = "Game."
		local string = ""..prePath..""..v..""
		require("Game."..v.."")
	else
		print("GOING FOR MODS")

		local string = ""..prePath..""..v..""
		require(""..prePath..""..v.."")	
	end

end

--[[require "Game.file_io"
require "Game.camera"
require "Game.map"
require "Game.influence_map"
require "Game.ui.userInterface"
require "Game.ui.action_phase.action_phase"
require "Game.ui.action_phase.ap_buttons"
require "Game.ui.mainMenu"
require "Game.ui.mainMenu_callbacks"
require "Game.ui.levelSelect"
require "Game.ui.buy_menu"
require "Game.LevelEditor.levelEditor"
require "Game.ui.leditor"
require "Game.ui.level_editor_main_menu.leditor_menu_options"
require "Game.ui.level_editor_main_menu.leditor_resize_menu"
require "Game.ui.worldMap.worldMap_ui"
require "Game.ui.action_phase.ingame_menu"
require "Game.ui.freeBattle.battle_menu"
require "Game.ui.action_phase.endBattle_Screen"
require "Game.ui.freeBattle.map_select"
require "Game.ui.freeBattle.commander_select"
require "Game.ui.intro_moai"
require "Game.ui.layoutTesting.layoutTest"
require "Game.table_work"
require "Game.units.unit"
require "Game.units.unit_textures"
require "Game.units.unit_private_functions"
require "Game.units.unit_ai"
require "Game.units.unit_type_table"
require "Game.units.ai.steve"
require "Game.units.ai.dave"
require "Game.units.ai.elenoir"
require "Game.units.ai.elena"
require "Game.units.ai.francois"
require "Game.units.ai.gharcea"
require "Game.units.ai.harrold"
require "Game.units.ai.irene"
require "Game.units.ai.juliette"
require "Game.units.winCases"
require "Game.player.player"
require "Game.worldMap.sharks"
require "Game.buildings.building"
require "Game.buildings.towns"
require "Game.info.information"

require "Game.worldMap.worldmap"

require "Game.player.player"--]]



require "core.StateMachine"
--------------------------------------
---- PATHFINDER INCLUDES -------------
---------------------------------------

require "gui/support/class"


function Game:initGui( )
	
	g:addToResourcePath(filesystem.pathJoin("resources", "fonts"))
	g:addToResourcePath(filesystem.pathJoin("resources", "gui"))
	g:addToResourcePath(filesystem.pathJoin("resources", "media"))
	g:addToResourcePath(filesystem.pathJoin("resources", "themes"))
	g:addToResourcePath(filesystem.pathJoin("resources", "layouts"))

	layermgr.addLayer("gui", 99999, g:layer())
	g:setTheme(THEME_NAME)
	g:setCurrTextStyle("default")

end

function Game:init( )


	
	image:init()
	mGrid:init( )
	anim:init(0.01)
	font:init( )
	effect:init( )
	Game:initGui( )
	initStates( )
	camera:init( )

end

function Game:update( )
	Game.worldTimer = MOAISim.getElapsedTime( )
	Game:loopPersistantKeyPressed( )
	anim:update(Game.worldTimer)
	handleStates( )
	Game:cameraUpdate( )
end


function Game:draw( )


end

function Game:touchRight( )
	--if zKey == false then
	local _st = state[currentState]
	if _st ~= "GameStatesNameGoHere" then
	end
end

function Game:keypressed( key )
	Game.keyTimer = Game.worldTimer
	local _st = state[currentState]
	if _st == "ActionPhase" then
		if key == 102 then

		end
	end

	if key == 61 then
		core:setFullscreen(true)
	elseif key == 45 then
		core:setFullscreen(false)
	end
end

function Game:loopPersistantKeyPressed( )
	if Game.persistantKey == true then
		if Game.worldTimer > Game.keyTimer + 0.5 then
			local key = Game.key
		end
	end
end

function Game:keyreleased( key )
	local _st = state[currentState]
	if _st == "ActionPhase" then
		Game.persistantKey = false
	end
end

function Game:touchPressed (_idx)

end

function Game:touchLeftReleased ( )

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

	
	

end

function Game:cameraUpdate( )

end

function Game:ViewportScale(_ammX, _ammY)
	core:returnViewPort( )[1].viewPort:setScale(core:returnVPWidth()/_ammX, -core:returnVPHeight()/_ammY)
end
--MOAIInputMgr.device.pointer:setCallback(Game.touchLocation)


function Game:initPathfinding(__grid)
	grid = Grid(__grid, false)
	_grid = Grid(__grid, false)
	pather = Pathfinder(grid, 'JPS', walkable)
	pather:setMode("ORTHOGONAL")
	
end

function Game:updatePathfinding()
	--grid = Grid(_grid) 
	--grid = Grid(_grid)
	--_grid = Grid(Game.grid)
	--pather = Pathfinder(_grid, 'JPS', walkable)
	--pather = Jumper(Game.grid, walkable, false)

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

function Game:saveOptionsState( )
	local saveFile = "config.sv"
	--table.save(tb, "map/".._name..".col")
	local result = MOAIFileSystem.checkPathExists(pathToWrite.."config/")
	if result == false then
		MOAIFileSystem.affirmPath(pathToWrite.."config/")
	end
	table.save(Game.optionControls, ""..pathToWrite.."config/"..saveFile.."" )
	print("SAVED INFO FROM OPTIONS MENU")
end

function Game:loadOptionsState( )
	local saveFile = ""..pathToWrite.."config/config.sv"
	local tb = table.load(saveFile)
	print("LOADED TABLE!!!!!")
--
	--for i,v in pairs(tb) do
		--print(""..i.."")
	--end
	local bool = false
	if tb ~= nil then
		bool = true
	end
	return tb, bool
end
