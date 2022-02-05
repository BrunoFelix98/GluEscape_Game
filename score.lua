require "vector2"
require "BackgroundSprited"
require "Player1"
require "Player2"

score = 0
local offset2 = 0

function scoreUpdate(dt)
  offset2 = offset2 - (200 * dt)
  if offset2 <= - 1400 then
    score = score + value + value2
  end
  if offset2 < - 1401 then
    offset2 = 0
  end
end

function scoreDraw()
  love.graphics.setColor(0, 0, 0)
  love.graphics.print("Score:", love.graphics.getWidth()/2 - 40, love.graphics.getHeight()/2 - 10, 0)
  love.graphics.print(score, love.graphics.getWidth()/2, love.graphics.getHeight()/2 - 10, 0)
end