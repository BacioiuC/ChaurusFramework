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

function input:onKeyboardEvent ( key, down )

	if down == true then
		print ( "keyboard: "..key.." down" )
	else
		print ( "keyboard: "..key.." up")
	end
end

MOAIInputMgr.device.keyboard:setCallback ( onKeyboardEvent )

function input:onPointerEvent ( x, y )
	print ( "pointer: "..x.." "..y.."" )
end

MOAIInputMgr.device.pointer:setCallback ( onPointerEvent )


function input:onMouseLeftEvent ( down )

	if down == true then
		print( "mouse left down" )
	else
		print ( "mouse left up" )
	end
end

MOAIInputMgr.device.mouseLeft:setCallback ( onMouseLeftEvent )