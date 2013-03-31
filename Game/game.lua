Game = {}


function Game:init( )
	self.gameTable = {}
	map:init( )
	map:loadTiles( )
	map:generate( )

end



function Game:update( )

end
