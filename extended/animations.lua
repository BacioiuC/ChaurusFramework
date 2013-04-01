animation = { }

---- Init the animation system
function animation:init( )
	self.animationTable = { }
	animationSpeed = 1
	--self.timer = love.timer.getMicroTime()
	--self.framePos = 1
end

------------------------------------------------------
-- new: loads the animation files. 
-- Parameters:
-- - _id: ID of the animation to be player
-- - _baseName - name of the .png files to be loaded.
-- 		|_ for example, if you have to load 5 frames, they must be named frame-number.png
-- 		|_ the function will load each frame into the memory like frame+_frameID+extension
-- - _frameNr: number of frames to load
--------------------------------------------------------
function animation:new( _id, _baseName, _frameNr)
	local tempHolder = { }
	tempHolder.frames = { }
	tempHolder.id = _id
	tempHolder.frameNr = _frameNr
	tempHolder.reset = true
	tempHolder.timer = MOAISim.getElapsedTime ()
	tempHolder.framePos = 1
	tempHolder.name = {}
	
	for i = 1, _frameNr do
		imageFrame, name = image:newTexture("media/animation/".._baseName..""..i..".png",1,"".._baseName..""..i.."") --love.graphics.newImage("".._baseName..""..i..".png")
		--imageFrame:setFilter("nearest","nearest")
		table.insert(tempHolder.frames, imageFrame)	
		table.insert(tempHolder.name, "".._baseName..""..i.."")	
	end
	table.insert(self.animationTable, tempHolder)
end

------------------------------------------------------
-- playAnimation: 
-- _id - id of the animation
-- _timePerFrame - for how much time do you want the
-- animation to be displayed
-- _posX, _posY: coordinates of the screen where the
-- animation should be displayed
-- The animation only plays once. To be used in conjunction
-- with getCurrentFrame() and getFrames()
------------------------------------------------------
function animation:playAnimation(_id, _timePerFrame, _posX, _posY, flip)

	if self.animationTable[_id].framePos < #self.animationTable[_id].frames then
		if MOAISim.getElapsedTime () > self.animationTable[_id].timer + _timePerFrame then
			self.animationTable[_id].framePos = self.animationTable[_id].framePos + 1
			self.animationTable[_id].timer = MOAISim.getElapsedTime ()
		end
	--else
		--self.animationTable[_id].framePos = 1	
	end
	local offsetSize = 0
	--[[if self.animationTable[_id].frames[self.animationTable[_id].framePos]:getWidth() == 32 then
		offsetSize = 0
	elseif self.animationTable[_id].frames[self.animationTable[_id].framePos]:getWidth() == 96 then
		offsetSize = 32
	end--]]
	offsetSize = 0
	
	if flip == true then
		image:renderImage(""..self.animationTable[_id].name[self.animationTable[_id].framePos].."", _posX, _posY)
	else
		image:renderImage(""..self.animationTable[_id].name[self.animationTable[_id].framePos].."", _posX, _posY)--love.graphics.draw(self.animationTable[_id].frames[self.animationTable[_id].framePos],_posX, _posY,0,1,1,offsetSize,offsetSize)		
	end		
end

function animation:setFrame(_id, frame)
	self.animationTable[_id].framePos = frame
end

function animation:getCurrentFrame(_id)
	return self.animationTable[_id].framePos
end

------------------------------------------------------
-- LoopAnimation: 
-- _id - id of the animation
-- _timePerFrame - for how much time do you want the
-- animation to be displayed
-- _posX, _posY: coordinates of the screen where the
-- animation should be displayed
-- NOTE: The animation loops as long time as the function
-- is called
------------------------------------------------------
function animation:loopAnimation(_id, _timePerFrame, _posX, _posY, flip)
	if self.animationTable[_id].framePos < #self.animationTable[_id].frames then
		if MOAISim.getElapsedTime () > self.animationTable[_id].timer + _timePerFrame then
			self.animationTable[_id].framePos = self.animationTable[_id].framePos + 1
			self.animationTable[_id].timer = MOAISim.getElapsedTime ()
		end
	else
		self.animationTable[_id].framePos = 1				
	end	
	
	local _frame_width, _frame_height = image:textureGetSize(""..self.animationTable[_id].name[self.animationTable[_id].framePos].."")
	--[[if self.animationTable[_id].frames[self.animationTable[_id].framePos]:getWidth() == 32 then
		offsetSize = 0
	elseif self.animationTable[_id].frames[self.animationTable[_id].framePos]:getWidth() == 96 then
		offsetSize = 32
	end--]]
	offsetSize = 0
	
	if flip == true then
		--love.graphics.draw(self.animationTable[_id].frames[self.animationTable[_id].framePos],_posX, _posY,0,-1,1,self.animationTable[_id].frames[self.animationTable[_id].framePos]:getWidth()-offsetSize,offsetSize)	
		image:renderImage(""..self.animationTable[_id].name[self.animationTable[_id].framePos].."", _posX, _posY)
	else
		image:renderImage(""..self.animationTable[_id].name[self.animationTable[_id].framePos].."", _posX, _posY)
		--love.graphics.draw(self.animationTable[_id].frames[self.animationTable[_id].framePos],_posX, _posY,0,1,1,offsetSize,offsetSize)		
	end	

end
------------------------------------------------------
-- LoopAnimationOutsideOfView: 
-- _id - id of the animation
-- _timePerFrame - for how much time do you want the
-- animation to be displayed
-- _posX, _posY: coordinates of the screen where the
-- animation should be displayed
-- _lx, _ly: Animation will be updated but only displayed if
-- _posX and _posY == _lx and _ly
-- NOTE: The animation loops as long time as the function
-- is called
------------------------------------------------------
function animation:loopAnimationOutsideOfView(_id, _timePerFrame, _posX, _posY, flip, _lx, _ly)
	if self.animationTable[_id].framePos < #self.animationTable[_id].frames then
		if MOAISim.getElapsedTime () > self.animationTable[_id].timer + _timePerFrame then
			self.animationTable[_id].framePos = self.animationTable[_id].framePos + 1
			self.animationTable[_id].timer = MOAISim.getElapsedTime ()
		end
	else
		self.animationTable[_id].framePos = 1				
	end	
	
	if _lx == _posX and _ly == _posY then
		if flip == true then
			--love.graphics.draw(self.animationTable[_id].frames[self.animationTable[_id].framePos],_posX, _posY,0,-1,1,self.animationTable[_id].frames[self.animationTable[_id].framePos]:getWidth()-offsetSize,offsetSize)	
			image:renderImage(""..self.animationTable[_id].name[self.animationTable[_id].framePos].."", _timePerFrame, _posX, _posY, false)
		else
			image:renderImage(""..self.animationTable[_id].name[self.animationTable[_id].framePos].."", _timePerFrame, _posX, _posY, true)
			--love.graphics.draw(self.animationTable[_id].frames[self.animationTable[_id].framePos],_posX, _posY,0,1,1,offsetSize,offsetSize)		
		end
	end

end

-- [[ NEED TO REPLACE LOVE2D DRAW CALLS WITH RENDER IMAGE ]]
function animation:drawSingleFrame(_id,_frame,_posX,_posY,flip)
	if flip == true then
		love.graphics.draw(self.animationTable[_id].frames[_frame],_posX, _posY,0,-1,1,self.animationTable[_id].frames[self.animationTable[_id].framePos]:getWidth(),0)	
	else
		love.graphics.draw(self.animationTable[_id].frames[_frame],_posX, _posY,0,1,1,0,0)		
	end
end
------------------------------------------------------
-- getFrames: return the total number of frames in
-- the animation.
------------------------------------------------------
function animation:getFrames(_id)
	return #self.animationTable[_id].frames
end
return animation