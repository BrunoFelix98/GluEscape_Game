require "vector2"

function createObject(x, y, w, h, sprite)
  return {position = vector2.new(x, y), size = vector2.new(w, h), sprite = sprite, image = nil, canCollide = true}
end

function updateObject(x, y, w, h, sprite)
  objects.position.x = x
  objects.position.y = y
  objects.size.x = w
  objects.size.y = h
  objects.sprite = sprite
  objects.canCollide = true

end

function updateObject2(x, y, w, h, sprite)
  objects2.position.x = x
  objects2.position.y = y
  objects2.size.x = w
  objects2.size.y = h
  objects2.sprite = sprite
  objects2.canCollide = true
end

function drawWorld(walls)
  for i = 1, table.getn(walls), 1 do
    if walls[i].sprite == "Tree" then
      walls[i].image = Tree
    elseif walls[i].sprite == "Bush" then
      walls[i].image = Bush
    elseif walls[i].sprite == "Log" then
      walls[i].image = Log
    elseif walls[i].sprite == "Fence" then
      walls[i].image = Fence
    elseif walls[i].sprite == "Bush2" then
      walls[i].image = Bush2
    elseif walls[i].sprite == "Log2" then
      walls[i].image = Log2
    elseif walls[i].sprite == "Fence2" then
      walls[i].image = Fence2
    elseif walls[i].sprite == "Tree2" then
      walls[i].image = Tree2
    end
    love.graphics.draw(walls[i].image, walls[i].position.x, walls[i].position.y)
  end
end