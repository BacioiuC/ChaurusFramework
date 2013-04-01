Game = {}

-- Do all the initialisations and loadings here
-- [[ for love2D users: picture this as love.load() ]]
function Game:init( )
	self.gameTable = {}

	animation:init( ) -- needed in order to create the animation table

	-- loads the Flame animation. 1 - > image ID. Second arg is path to image in the animation folder, 3rd is the number of frames
	-- that the image has
	animation:new( 1, "flame/flame_a_000", 6)
	animation:new( 2, "fireball/fireball_hit_000",9)

	image:newTexture("media/water.png",1,"WATER_TEX")

end

-- All simulations and math stuff here
-- [[ Love2D users, this works like love.update. (Note that you can still draw in this function.. still, better not) ]]
function Game:update( )
	
end

-- Handle the rendering here
-- [[ Love2D users, this works like love.draw()]]
function Game:draw( )
	
	-- loop the image. Arg 1 - ID, Arg 2 - time / frame, Arg 3 - X Position, Arg 4 - Y Position, Arg 5 - bool flip [not implemented yet]
	animation:loopAnimation(1,0.1,-100, -250,false)
	animation:loopAnimation(2,0.08, -500, -250, true)
	image:renderImage("WATER_TEX",-resX/2, resY/2-32)

	-- prints how many images are displayed in the loop
	print("Draw Calls: "..image:returnNumberOfProps( ).."")
end

function Game:loop( )
	Game:drop( )

	Game:update( )
	Game:draw( )
end

-- Everything that is rendered is dropped at this point, so rendering can begin again
-- next frame. Hack to avoid MOAI style of having a separate render loop.
function Game:drop( )
	image:dropProps( )
end