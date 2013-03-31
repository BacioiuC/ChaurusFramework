Game = {}

-- Do all the initialisations and loadings here
-- [[ for love2D users: picture this as love.load() ]]
function Game:init( )
	self.gameTable = {}

	image:newTexture("media/pimp.png",1,"PIMP")
	image:newTexture("media/water.png",1,"WATER_TEX")

	map:init( )
	map:generate( )

end

-- All simulations and math stuff here
-- [[ Love2D users, this works like love.update. (Note that you can still draw in this function.. still, better not) ]]
function Game:update( )
	map:randomValues( )
end

-- Handle the rendering here
-- [[ Love2D users, this works like love.draw()]]
function Game:draw( )
	map:draw( )
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