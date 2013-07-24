mGrid = {}


function mGrid:init( )
	self._gridTable = {}
	self._width = 0
	self._height = 0
	self._tileSize = 0
	self._x = 0
	self._y = 0

	self.grid = nil

	self._texture = nil
	self._image = nil
	self._textureTable = {}



end

function mGrid:new(_width, _height, _tileSize, _image, _optionalGridTile, _string)
	self._textureTable[#self._gridTable+1] = image:newDeckTexture(_image, 1, "".._image.."", _tileSize)
	local temp = {
		id = #self._gridTable + 1,
		width = _width,
		height = _height,
		tileSize = _tileSize,

		image = image:newDeckImage(self._textureTable[#self._gridTable+1], self._x, self._y),
		grid = MOAIGrid.new(),
		x = math.random(1, 200),
		y = math.random(1, 200),
	}
	table.insert(self._gridTable, temp)

	if _string == "hex" then
		--temp.grid:setSize(temp.width, temp.height, temp.tileSize, temp.tileSize)
		temp.grid:initHexGrid(temp.width, temp.height, 32, -2, -16)
	else
		temp.grid:setSize(temp.width, temp.height, temp.tileSize, temp.tileSize)
	end
	

	--self.grid = MOAIGrid.new ()
	--self.grid:setSize ( self._width, self._height, self._tileSize, self._tileSize)
	local _value = nil
	if _optionalGridTile == nil then
		_value = 1
	else
		_value = _optionalGridTile
	end
		for _x = 1, temp.width do
			for _y = 1, temp.height do
				temp.grid:setTile(_x, _y, _value)
				temp.grid:setTileFlags(_x, _y,  0x40000000)
			end
		end
	--else

	--end

	image:setGrid(temp.image, temp.grid)




end

function mGrid:setDeck(_id, _deckID, _tileSize)

	
	--image:setTexture(self._gridTable[_id].image, self._textureTable[_deckID])
	image:removeProp(self._gridTable[_id].image)
	self._gridTable[_id].image = image:newDeckImage(self._textureTable[_deckID], 0, 0)
	self._gridTable[_id].grid = MOAIGrid.new()
	self._gridTable[_id].grid:setSize(1, 1, _tileSize, _tileSize  )
	--self._gridTable[_id].grid:setTile(1, 1, 1)
	image:setGrid(self._gridTable[_id].image, self._gridTable[_id].grid)
	map.gridSize = _tileSize
	
end

function mGrid:setTiles(_id, _table)
	for _y = 1, #_table do
		for _x = 1, #_table[_y] do
			self._gridTable[_id].grid:setTile(_x, _y, _table[_y][_x])
			self._gridTable[_id].grid:setTileFlags(_x, _y,  0x40000000)
		end
	end
end

function mGrid:setPos(_id, _x, _y)
	self._gridTable[_id].x = _x
	self._gridTable[_id].y = _y
	mGrid:update(_id)
end

function mGrid:updatePos(_id, _x, _y)
	self._gridTable[_id].x = self._gridTable[_id].x + _x
	self._gridTable[_id].y = self._gridTable[_id].y + _y	
	mGrid:update(_id)
end


function mGrid:updateTile(_id, _x, _y, _value)
	self._gridTable[_id].grid:setTile(_x, _y, _value)
	self._gridTable[_id].grid:setTileFlags(_x, _y, 0x40000000 )
end

function mGrid:mouseOverTile(_x, _y)
	if self._gridTable[_id].grid:getTile(_x, _y) ~= 0 or self._gridTable[_id].grid:getTile(_x, _y) ~= nil then
		return true
	end
	return false

end

function mGrid:update(_id)
	image:updateImage(self._gridTable[_id].image, self._gridTable[_id].x, self._gridTable[_id].y)
end

function mGrid:destroy( )
	self._gridTable[_id].grid = nil
end

function mGrid:returnNrGrids( )
	return #self._gridTable
end

function mGrid:getLocalTable(_id)
	local exTable = {}
	local table = self._gridTable[_id]

	for x = 1, table.width do
		exTable[x] = {}
		for y = 1, table.height do
			exTable[x][y] = table.grid:getTile(x, y)
		end
	end

	return exTable
end