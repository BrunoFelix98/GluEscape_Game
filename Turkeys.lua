require "vector2"
require "Player1"
require "Player2"

Turkeys = {position = vector2.new(0, 64), width = 35, height = 20, sprite = nil, Timer = 0}

function TurkeysLoad()
  Turkeys.sprite = love.graphics.newImage("Animated/Done/Done3/Armature1.png")
end

function TurkeysUpdate(dt)
  Turkeys.Timer = Turkeys.Timer - (200 * dt)
  if Turkeys.Timer < - 250 then
    Turkeys.Timer = 0
  end
  if Turkeys.Timer <= - 50 then
    Turkeys.sprite = love.graphics.newImage("Animated/Done/Done3/Armature2.png")
  end
  if Turkeys.Timer <= - 100 then
    Turkeys.sprite = love.graphics.newImage("Animated/Done/Done3/Armature1.png")
  end
  if Turkeys.Timer <= - 150 then
    Turkeys.sprite = love.graphics.newImage("Animated/Done/Done3/Armature3.png")
  end
  if Turkeys.Timer <= - 200 then
    Turkeys.sprite = love.graphics.newImage("Animated/Done/Done3/Armature1.png")
  end
  if Turkeys.Timer <= - 250 then
    Turkeys.sprite = love.graphics.newImage("Animated/Done/Done3/Armature2.png")
  end
end

function TurkeysDraw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(Turkeys.sprite, Turkeys.position.x, Turkeys.position.y + 6)
  love.graphics.draw(Turkeys.sprite, Turkeys.position.x, Turkeys.position.y + 6 + Turkeys.height)
  love.graphics.draw(Turkeys.sprite, Turkeys.position.x, Turkeys.position.y + 6 + Turkeys.height * 2)
  love.graphics.draw(Turkeys.sprite, Turkeys.position.x, Turkeys.position.y + 6 + Turkeys.height * 3)
  love.graphics.draw(Turkeys.sprite, Turkeys.position.x, Turkeys.position.y + 6 + Turkeys.height * 4)
  love.graphics.draw(Turkeys.sprite, Turkeys.position.x, Turkeys.position.y + 6 + Turkeys.height * 5)
  love.graphics.draw(Turkeys.sprite, Turkeys.position.x, Turkeys.position.y + 6 + Turkeys.height * 6)
  love.graphics.draw(Turkeys.sprite, Turkeys.position.x, Turkeys.position.y + 6 + Turkeys.height * 7)
  love.graphics.draw(Turkeys.sprite, Turkeys.position.x, Turkeys.position.y + 6 + Turkeys.height * 8)
  love.graphics.draw(Turkeys.sprite, Turkeys.position.x, Turkeys.position.y + 6 + Turkeys.height * 9)
  love.graphics.draw(Turkeys.sprite, Turkeys.position.x, Turkeys.position.y + 6 + Turkeys.height * 10)
  love.graphics.draw(Turkeys.sprite, Turkeys.position.x, Turkeys.position.y + 6 + Turkeys.height * 11)
  love.graphics.draw(Turkeys.sprite, Turkeys.position.x, Turkeys.position.y + 6 + Turkeys.height * 12)
  love.graphics.draw(Turkeys.sprite, Turkeys.position.x, Turkeys.position.y + 325)
  love.graphics.draw(Turkeys.sprite, Turkeys.position.x, Turkeys.position.y + 325 + Turkeys.height)
  love.graphics.draw(Turkeys.sprite, Turkeys.position.x, Turkeys.position.y + 325 + Turkeys.height * 2)
  love.graphics.draw(Turkeys.sprite, Turkeys.position.x, Turkeys.position.y + 325 + Turkeys.height * 3)
  love.graphics.draw(Turkeys.sprite, Turkeys.position.x, Turkeys.position.y + 325 + Turkeys.height * 4)
  love.graphics.draw(Turkeys.sprite, Turkeys.position.x, Turkeys.position.y + 325 + Turkeys.height * 5)
  love.graphics.draw(Turkeys.sprite, Turkeys.position.x, Turkeys.position.y + 325 + Turkeys.height * 6)
  love.graphics.draw(Turkeys.sprite, Turkeys.position.x, Turkeys.position.y + 325 + Turkeys.height * 7)
  love.graphics.draw(Turkeys.sprite, Turkeys.position.x, Turkeys.position.y + 325 + Turkeys.height * 8)
  love.graphics.draw(Turkeys.sprite, Turkeys.position.x, Turkeys.position.y + 325 + Turkeys.height * 9)
  love.graphics.draw(Turkeys.sprite, Turkeys.position.x, Turkeys.position.y + 325 + Turkeys.height * 10)
  love.graphics.draw(Turkeys.sprite, Turkeys.position.x, Turkeys.position.y + 325 + Turkeys.height * 11)
  love.graphics.draw(Turkeys.sprite, Turkeys.position.x, Turkeys.position.y + 325 + Turkeys.height * 12)
end