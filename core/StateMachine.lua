state = {}
_bGuiLoaded = false
function initStates( )
	state[1] = "Intro"
	state[2] = "MainMenu"
	state[3] = "Options"
	state[4] = "Levels"
	state[5] = "ActionPhase"
	state[6] = "Pause"
	state[7] = "EndScreen"
	state[8] = "Drop"
	state[9] = "LevelEditor"
	state[10] = "FreeBattle"
	currentState = 2

	_bGuiLoaded = false
	_bGameLoaded = false
end

function handleStates( )
	local _st = state[currentState]

	if _st == "Intro" then

	elseif _st == "MainMenu" then
		ammLoop( )
	elseif _st == "Options" then
		optionsMenu( )
	elseif _st == "Levels" then
		lvsLoop( )
	elseif _st == "ActionPhase" then
		apLoop( )
	elseif _st == "Pause" then

	elseif _st == "EndScreen" then
		
	elseif _st == "Drop" then

	elseif _st == "LevelEditor" then
		lvEditorLoop( )
	elseif _st == "FreeBattle" then
		freeBattleMenu( )
	else
		print("STATE OUT OF BOUNDS")
	end
end

function freeBattleMenu( )

	if _bGameLoaded == false then
		_bGameLoaded = true
	
	else
	

	end

	if _bGuiLoaded == false then
		interface:_init_map_selection( )
		
		--camera:init( )
		
		_bGuiLoaded = true

	else

		interface:_sm_updatePanel( )
		interface:_update_map_selection( )

	end
end

function optionsMenu( )
	if _bGameLoaded == false then
		_bGameLoaded = true
	else
	
	end

	if _bGuiLoaded == false then
		
		--camera:init( )
		interface:_init_commander_sel( )
		_bGuiLoaded = true

	else
		interface:_cs_updatePanels( )

	end
end

function ammLoop( )
	if _bGameLoaded == false then
		_bGameLoaded = true
	else

	end

	if _bGuiLoaded == false then
		interface:initMM( )
		--camera:init( )
		
		_bGuiLoaded = true

	else

		interface:_updateMMButtons( )

	end
end

function lvsLoop( )
	if _bGuiLoaded == false then

		--interface:initLVSelect( )

		interface:_init_worldMap( )
		interface:setup_cursors( )
		_bGuiLoaded = true
		
	else

		
		--map:update( )
		
	end

	if _bGameLoaded == false then
		anim:dropAll( )
		camera:init( )
		worldMap:init( )
		_bGameLoaded = true
	else
		camera:update( )
		worldMap:loop( )--worldMap:update( )
	end
end

function apLoop( )
	

	if _bGuiLoaded == false then
		interface:initAP( )
		interface:setup_cursors( )	

		_bGuiLoaded = true
	else


		interface:updateInLoop( )
		interface:updatePanels( )
	end

	if _bGameLoaded == false then
		Game.victory = false
		map:initAP (Game.mapFile)
		
		camera:init( )
		building:init(Game.mapFile)
		
		unit:init(Game.mapFile)
		player1.coins = player1.initialCoins
		player2.coins = player2.initialCoins
		map:setOffset(32, 16)
		map:_updateFogOfWar( )
		_bGameLoaded = true
	else
		camera:update( )

		map:update( )
		building:update( )
		unit:update( )	
	end

end

function lvEditorLoop( )

	if _bGameLoaded == false then
		
		lEditor:init( )
		
		
		_bGameLoaded = true
	else
		lEditor:update( )
		camera:update( )
		
	end


	if _bGuiLoaded == false then

		interface:level_editor_init( )
		_bGuiLoaded = true
	else
		interface:updateInLoop( )

	end
end

function drop( )
	_bGuiLoaded = false
end