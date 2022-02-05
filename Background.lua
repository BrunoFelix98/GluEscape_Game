require "vector2"
require "BackgroundOOF"

Walltop = {position = vector2.new(0, 0), Length = love.graphics.getWidth() + 10, Height = love.graphics.getHeight() - 690}
Wallbottom = {position = vector2.new(0, 690), Length = love.graphics.getWidth() + 10, Height = love.graphics.getHeight()}
Midwall = {position = vector2.new(0, 350), Length = love.graphics.getWidth() + 10, Height = 20}

Section = {}

function backgroundLoad()
  BackgroundOOFload()
end
function Section.new(walls, offset)
  return {
    walls = walls,
    offset = offset
  }
end

function Section.update(section, dt)
  section.offset = section.offset - (200 * dt)
end

function Section.draw(section)
  local offset = section.offset

  for i = 1, #section.walls do
    love.graphics.setColor(section.walls[i].color)
    love.graphics.rectangle("fill", section.walls[i].x + offset, section.walls[i].y, section.walls[i].w, section.walls[i].h)
  end
  
  drawBase()
end

function drawBase(offset)
  BackgroundOOFdraw(offset)
--  love.graphics.setColor(0, 0.5 ,0)
--  love.graphics.rectangle("fill", Walltop.position.x, Walltop.position.y, Walltop.Length, Walltop.Height)
--  love.graphics.setColor(0, 0.5 ,0)
--  love.graphics.rectangle("fill", Wallbottom.position.x, Wallbottom.position.y, Wallbottom.Length, Wallbottom.Height)
--  love.graphics.setColor(0, 1 ,0)
--  love.graphics.rectangle("fill", Midwall.position.x, Midwall.position.y, Midwall.Length, Midwall.Height)
end

function drawSection0(offset)
  drawBase(offset)
end