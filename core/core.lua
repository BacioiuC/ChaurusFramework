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

	MOAISim.openWindow(app_name,screenWidth,screenHeight)
	--font = MOAIFont.new ()
	--font:loadFromTTF ( "tahomabd.ttf")
end

function core:setViewPort(_viewPort, _viewPortWidth, _viewPortHeight, _scaleRatio)
	viewportWidth, viewportHeight = MOAIGfxDevice.getViewSize()
	local temp = {
		id = #self.viewPortTable + 1,
		viewPort = _viewPort,
		width = _viewPortWidth,
		height = _viewPortHeight,
		offsetX = 1,
		offsetY = 1,
		scaleRation = _scaleRatio,
	}
	table.insert(self.viewPortTable, temp)

	unitsX = _viewPortWidth*4--512
	unitsY = _viewPortHeight*4--512

	self.viewPortTable[#self.viewPortTable].viewPort = MOAIViewport.new()
	self.viewPortTable[#self.viewPortTable].viewPort:setSize(self.viewPortTable[#self.viewPortTable].width,self.viewPortTable[#self.viewPortTable].height)
	--self.viewPortTable[#self.viewPortTable].viewPort:setScale(self.viewPortTable[#self.viewPortTable].width, -self.viewPortTable[#self.viewPortTable].height )
	--self.viewPortTable[#self.viewPortTable].viewPort:setScale(1, 1)
	-- Scaling set to 1x1 units
	
	self.viewPortTable[#self.viewPortTable].viewPort:setScale(unitsX,-unitsY)
	self.viewPortTable[#self.viewPortTable].viewPort:setOffset(-1,1)
end

function core:offsetViewport(_x, _y)
	core:returnViewPort()[1].viewPort:setOffset(_x, _y)
end

function core:returnViewPort( )
	return self.viewPortTable
end

function core:returnVPWidth() 
	return self.viewPortTable[1].width
end

function core:returnVPHeight( )
	return self.viewPortTable[1].height
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

function core:returnLayer(_id)
	return self.layerTable[_id].layer
end

function core:_debugRenderLayer( _id )
	MOAIRenderMgr.pushRenderPass(self.layerTable[_id].layer)
end

function core:render(_id)
	MOAIRenderMgr.setRenderTable(self.layerTable[_id].layer)
end

function core:setFullscreen(_bool)
	if _bool == true then
		MOAISim.enterFullscreenMode ()
	elseif _bool == false then
		MOAISim.exitFullscreenMode ()
	end
end