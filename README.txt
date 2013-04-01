[ will write a better README a bit later ]

ChaurusFramework is mean to wrap up MOAI's base commands and to facilitate it's use. Since I come from a LUA + love2D background I find myself a bit on the awkward side
with MOAI's way of handling things. So, the goal here is to bind together Love2D's "code mentality" with MOAI's awesomeness. Note that I'm not trying to create a Love2D
wrapper for MOAI.

Features:
	- Setting up the Window, Layer and Viewport
	- Loading and displaying an image
	- Loading and playing/looping an animation (frame-by-frame)

Example of usage:
loading an image and displaying it:

Main file for your project will be Game.lua.

function Game:init( )
	image:init()
	image:newTexture("media/water.png", 1, "WATER_TEX")
	-- second parameter represents the layer on which we will draw
end

function Game:draw( )
	image:renderImage("WATER_TEX",0,0)	
end

function Game:update( )

end

