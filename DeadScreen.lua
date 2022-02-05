require "vector2"
require "Player1"
require "Player2"
require "Turkeys"

DeadByTurkeys = false
DeadByTurkeysSprite = nil

BoomerangsHitZero = false
BoomerangsHitZeroSprite = nil

function DeadLoad()
  DeadByTurkeysSprite = love.graphics.newImage("DeadByTurkeys.png")
  BoomerangsHitZeroSprite = love.graphics.newImage("DeadByTurkeys.png")
end

function DeadUpdate(dt)
  if player1.position.x < Turkeys.position.x then
    if DeadByTurkeys == false then
      DeadByTurkeys = true
    end
  end
  if player2.position.x < Turkeys.position.x then
    if DeadByTurkeys == false then
      DeadByTurkeys = true
    end
  end
end

function DeadByTurkeysDraw()
  love.graphics.draw(DeadByTurkeysSprite, 0, 0)
end