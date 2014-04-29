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
	state[11] = "LayoutStuff"
	currentState = 1

	_bGuiLoaded = false
	_bGameLoaded = false
end

function handleStates( )
	local _st = state[currentState]

	if _st == "Intro" then
		introLoop( )
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
	elseif _st == "LayoutStuff" then
		layoutTesting( )
	else
		print("STATE OUT OF BOUNDS")
	end
end

function layoutTesting( )

end

function introLoop( )
	if _bGameLoaded == false then
		_bGameLoaded = true
		print("INTRO HAPPENING!")
		print("Place a init function here :)")
	else
	

	end

	if _bGuiLoaded == false then
		--camera:init( )
		
		_bGuiLoaded = true

	else
	end
	
end

function freeBattleMenu( )

	if _bGameLoaded == false then
		_bGameLoaded = true
	
	else
	

	end

	if _bGuiLoaded == false then

		
		--camera:init( )
		
		_bGuiLoaded = true

	else



	end
end

function optionsMenu( )
	if _bGameLoaded == false then
		_bGameLoaded = true
	else
	
	end

	if _bGuiLoaded == false then
		
		--camera:init( )

		_bGuiLoaded = true

	else


	end
end

function ammLoop( )
	if _bGameLoaded == false then
		_bGameLoaded = true
	else

	end

	if _bGuiLoaded == false then

		--camera:init( )
		
		_bGuiLoaded = true

	else


	end
end

function lvsLoop( )
	if _bGuiLoaded == false then

		--interface:initLVSelect( )


		_bGuiLoaded = true
		
	else

		
		--map:update( )
		
	end

	if _bGameLoaded == false then

		_bGameLoaded = true
	else

	end
end

function apLoop( )
	

	if _bGuiLoaded == false then


		_bGuiLoaded = true
	else


	end

	if _bGameLoaded == false then

		
		--map:_setCameraToCorrectPlayerPos( )
		_bGameLoaded = true
	else

	end

end

function lvEditorLoop( )

	if _bGameLoaded == false then
		

		
		
		_bGameLoaded = true
	else

		
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