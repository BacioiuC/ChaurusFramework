camera = {}
camera.x = 0
camera.y = 0
camera.scaleX = 1
camera.scaleY = 1
camera.rotation = 0
camera.sensitivity = 8

Game.mouseX = 0
Game.mouseY = 0

Game.pressedX = Game.mouseX
Game.pressedY = Game.mouseY

function camera:init( )
  -- load Joystick pos
  joyStick_base_tex = image:newTexture("Game/media/touchPressed_base.png",1,"JOySTICK_BASE")
  joyStick_top_tex = image:newTexture("Game/media/touchPressed_joystick.png",1,"JOYSTICK_TOP")

  joyStick_base = image:newImage(joyStick_base_tex, Game.mouseX,Game.mouseY)
  joyStick_top = image:newImage(joyStick_top_tex, Game.mouseX,Game.mouseY)

  image:setVisible(joyStick_base, false)
  image:setVisible(joyStick_top, false)

end

function camera:update( )
  if MouseDown == true then
    local difMouseX = (Game.pressedX - Game.mouseX)/25
    local difMouseY = (Game.pressedY - Game.mouseY)/25
   
    image:updateImage(joyStick_base, Game.pressedX, Game.pressedY)
    image:updateImage(joyStick_top, Game.mouseX, Game.mouseY)
    if Game.currentState == 5 then
      map:updateScreen(difMouseX,difMouseY)
    elseif Game.currentState == 3 then
      isoMap:updateScreen(difMouseX,difMouseY)
    end

  end
end

function camera:setJoystickVisible( )
  if Game.currentState == 5 or Game.currentState == 3 then
    image:setVisible(joyStick_base, true)
    image:setVisible(joyStick_top, true)
    Game.pressedX = Game.mouseX
    Game.pressedY = Game.mouseY
  --mouseClicked = true
  end
end

function camera:setJoystickHidden( )
  if Game.currentState == 5 or Game.currentState == 3 then
    image:setVisible(joyStick_base, false)
    image:setVisible(joyStick_top, false)
    Game.pressedX = Game.mouseX
    Game.pressedY = Game.mouseY
   -- mouseClicked = false
  end
end