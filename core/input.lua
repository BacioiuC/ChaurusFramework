input = {}

function input:init( )
	self.inputTable = {}
	print ( MOAIInputMgr.configuration )
	print( "pana mea, seems to be workin'")
end

function input:update( )
	

end

function input:isMouseDown( )

end

function input.onKeyboardEvent ( key, down )

	if down == true then
		Game:keypressed( key )
	elseif down == false then
		Game:keyreleased( key )
	end
	print(" "..key.."")

end



function input.onPointerEvent ( x, y )
	--print ( "pointer: "..x.." "..y.."" )
	Game.touchLocation( x, y )
end




function input.onMouseLeftEvent ( down )

	if down == true then
		g:injectMouseButtonDown(inputconstants.LEFT_MOUSE_BUTTON)
		
		Game:touchPressed ( )
    	
    
	else
		g:injectMouseButtonUp(inputconstants.LEFT_MOUSE_BUTTON)
		Game:touchReleased ( )
		
	end
end

function input.onMouseRightEvent( down )
	if down == true then
		--g:injectMouseButtonDown(inputconstants.LEFT_MOUSE_BUTTON)
		
		Game:touchRight ( )
    	
    
	else
		--g:injectMouseButtonUp(inputconstants.LEFT_MOUSE_BUTTON)
		Game:touchReleased ( )
		
	end
end



function input.touchEvent( eventType, idx, x, y, tapCount )
	if eventType == MOAITouchSensor.TOUCH_DOWN then
		
		input.onPointerEvent(x, y)
		Game.touchLocation( x, y )

		input.onMouseLeftEvent(true)
		Game:touchPressed ( )
	else

	end
end

if  MOAIEnvironment.osBrand == "Windows" then
	MOAIInputMgr.device.keyboard:setCallback ( input.onKeyboardEvent )
	MOAIInputMgr.device.pointer:setCallback ( input.onPointerEvent )
	MOAIInputMgr.device.mouseLeft:setCallback ( input.onMouseLeftEvent )
	MOAIInputMgr.device.mouseRight:setCallback ( input.onMouseRightEvent )
else
	MOAIInputMgr.device.touch:setCallback ( input.touchEvent )
end

 --