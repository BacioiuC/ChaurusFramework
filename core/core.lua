core = {}

function core:init( )
	self.viewPortTable = {}

	self.layerTable = {}
	self.imageTable = {}
end

function core:returnLayerTable( )
	return self.layerTable
end

function core:seWindow(_screenWidth, _screenHeight)
	local screenWidth = MOAIEnvironment.horizontalResolution
	local screenHeight = MOAIEnvironment.verticalResolution

	if screenWidth == nil then screenWidth = _screenWidth end
	if screenHeight == nil then screenHeight = _screenHeight end

	MOAISim.openWindow("Moai Game Window",screenWidth,screenHeight)

end

function core:setViewPort(_viewPort, _viewPortWidth, _viewPortHeight, _scaleRatio)
	local temp = {
		id = #self.viewPortTable + 1,
		viewPort = _viewPort,
		width = _viewPortWidth,
		height = _viewPortHeight,
		scaleRation = _scaleRatio,
	}
	table.insert(self.viewPortTable, temp)

	self.viewPortTable[#self.viewPortTable].viewPort = MOAIViewport.new()
	self.viewPortTable[#self.viewPortTable].viewPort:setSize(self.viewPortTable[#self.viewPortTable].width,self.viewPortTable[#self.viewPortTable].height)
	--self.viewPortTable[#self.viewPortTable].viewPort:setScale(self.viewPortTable[#self.viewPortTable].width, -self.viewPortTable[#self.viewPortTable].height )
	--self.viewPortTable[#self.viewPortTable].viewPort:setScale(1, 1)
	-- Scaling set to 1x1 units
	self.viewPortTable[#self.viewPortTable].viewPort:setScale(self.viewPortTable[#self.viewPortTable].width,self.viewPortTable[#self.viewPortTable].height)

end


function core:newLayer(_layerName, _parrentViewPort)
	local temp = {
		id = #self.layerTable + 1,
		name = _LayerName,
		layer = nil,
		viewPortParrent = _parrentViewPort,
	}	
	table.insert(self.layerTable, temp)
	self.layerTable[#self.layerTable].layer = MOAILayer2D.new()
	self.layerTable[#self.layerTable].layer:setViewport( self.viewPortTable[ self.layerTable[#self.layerTable].viewPortParrent ].viewPort )
end

function core:_debugRenderLayer( _id )
	MOAIRenderMgr.pushRenderPass(self.layerTable[_id].layer)
end

function core:render(_id)
	MOAIRenderMgr.setRenderTable(self.layerTable)
end