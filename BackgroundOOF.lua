require "vector2"

local bush, tree, grass

local offset =  0

local px = {}
local speed = 200

function BackgroundOOFload()
  bush = love.graphics.newImage("Bush.png")
  tree = love.graphics.newImage("Tree.png")
  grass = love.graphics.newImage("Grass.png")
  for i = 60, love.graphics.getHeight(), 1 do
    px[i] = vector2.new(love.math.random(0, love.graphics.getWidth()), love.math.random(0, 5))
  end
end

function BackgroundOOFupdate(dt)
  offset = offset - (200 * dt)
  for i = 60, love.graphics.getHeight(), 1 do
    px[i].x = px[i].x - (speed * dt)
    if px[i].x < 0 - grass:getWidth() then
      px[i].x = love.graphics.getWidth()
    end
  end
end

function BackgroundOOFdraw()
  for y = 60, (love.graphics.getHeight()/2) - bush:getHeight(), 1 do
    if px[y].y == 1 then
      love.graphics.draw(grass, px[y].x, y)
    end
  end
  for y = (love.graphics.getHeight()/2) + bush:getHeight() + 10, love.graphics.getHeight() - 70, 1 do
    if px[y].y == 1 then
      love.graphics.draw(grass, px[y].x, y)
    end
  end
  for i = 1, love.graphics.getWidth() - offset, bush:getWidth() do
    love.graphics.draw(bush, i + offset, love.graphics.getHeight()/2 - bush:getHeight()/2)
  end
  for i = 1, love.graphics.getWidth() - offset, tree:getWidth() do
    love.graphics.draw(tree, i + offset, 0, 0, 1.5, 1.5)
  end
  for i = 1, love.graphics.getWidth() - offset, tree:getWidth() do
    love.graphics.draw(tree, i + offset, love.graphics.getHeight() - 20 - tree:getHeight())
  end
end