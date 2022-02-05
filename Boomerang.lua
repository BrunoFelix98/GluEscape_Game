require "vector2"
require "Player1"
require "Player2"

boomerang = {
  position = vector2.new(300, 100),
  size = vector2.new(15, 30),
  velocity = vector2.new(0, 0),
  maxspeed = 400,
  mass = 1,
  throw = false,
  onHand1 = true,
  onHand2 = false,
  movingThrow = false,
  movingShare = false,
  collision = false,
  collision2 = false,
  touch = false,
  touch2 = false,
  ispeed = 22500
}

local rotation, BoomerangSprite
function boomerangLoad()
  BoomerangSprite = love.graphics.newImage("boomerang.png")
  rotation = 0
end
  

local returning = vector2.new(-300, 0)
local movedirection = vector2.new(0, 0)

function boomerangUpdate(dt)
local acceleration = vector2.new(0, 0)
  
  if boomerang.movingThrow == true or boomerang.movingShare == true then
  acceleration = vector2.addForce(returning, boomerang.mass, acceleration)
  end
-------------------------------------------------------------Player 1---------------------------------------------------------------------------------------- 
  if love.keyboard.isDown("g") and boomerang.throw == false and boomerang.onHand1 == true and boomerang.onHand2 == false then
    boomerang.throw = true
    boomerang.onHand1 = false
    boomerang.movingThrow = true
    boomerang.collision = true
    movedirection.x = -1
    boomerang.position.x = player1.position.x + 25
    boomerang.position.y = player1.position.y + (player1.height / 2)
    local flight = vector2.new(22000 , 0)
    acceleration = vector2.addForce(flight, boomerang.mass, acceleration)
  end
  
  if love.keyboard.isDown("h") and boomerang.throw == false and boomerang.onHand1 == true and boomerang.onHand2 == false and boomerang.movingShare == false then
    boomerang.throw = true
    boomerang.onHand1 = false
    boomerang.movingThrow = true
    boomerang.movingShare = true
    movedirection.x = -1
    boomerang.position.x = player1.position.x + 25
    boomerang.position.y = player1.position.y + (player1.height / 2)
    local flight = vector2.new(boomerang.ispeed * math.cos(math.sqrt(3)/2), boomerang.ispeed * math.sin(1/2))
    acceleration = vector2.addForce(flight, boomerang.mass, acceleration)
  end

    --print(acceleration.x)

  local futurevelocity = vector2.add(boomerang.velocity, vector2.mult(acceleration, dt))
        futurevelocity = vector2.limit(futurevelocity, boomerang.maxspeed)
  local futureposition = vector2.add(boomerang.position, vector2.mult(futurevelocity, dt))
  
  if objects ~= nil then
    local direction = GetBoxCollisionDirection(boomerang.position.x, boomerang.position.y, boomerang.size.x, boomerang.size.y, objects.position.x, objects.position.y, objects.size.x, objects.size.y)
    if boomerang.collision == true and objects.canCollide == true then
      if direction.x ~= 0 or direction.y ~= 0 then
        ------------------------------------------
        boomerang.velocity = vector2.new(-300, 0)
        ------------------------------------------
        boomerang.throw = false
        boomerang.touch = true
      else
        boomerang.touch = false
      end
    end
  end
  if objects2 ~= nil then
    local direction = GetBoxCollisionDirection(boomerang.position.x, boomerang.position.y, boomerang.size.x, boomerang.size.y, objects2.position.x, objects2.position.y, objects2.size.x, objects2.size.y)
    if boomerang.collision2 == true and objects2.canCollide == true then
      if direction.x ~= 0 or direction.y ~= 0 then
        ------------------------------------------
        boomerang.velocity = vector2.new(-300, 0)
        ------------------------------------------
        boomerang.throw = false
        boomerang.touch2 = true
      else
        boomerang.touch2 = false
      end
    end
  end
  
  for i = 1, table.getn(worldObjects), 1 do 
  local direction = GetBoxCollisionDirection(boomerang.position.x, boomerang.position.y, boomerang.size.x, boomerang.size.y, worldObjects[i].position.x, worldObjects[i].position.y, worldObjects[i].size.x, worldObjects[i].size.y)
    if boomerang.collision == true then
      if direction.x ~= 0 or direction.y ~= 0 then
        ------------------------------------------
        boomerang.velocity = vector2.new(-300, 0)
        ------------------------------------------
        boomerang.throw = false
      end
    end
  end

  for i = 1, table.getn(worldObjects2), 1 do
    local direction = GetBoxCollisionDirection(boomerang.position.x, boomerang.position.y, boomerang.size.x, boomerang.size.y, worldObjects2[i].position.x, worldObjects2[i].position.y, worldObjects2[i].size.x, worldObjects2[i].size.y)
    if boomerang.collision == true then
      if direction.x ~= 0 or direction.y ~= 0 then
        ------------------------------------------
        boomerang.velocity = vector2.new(-300, 0)
        ------------------------------------------
        boomerang.throw = false
      end
    end
  end
  
  local collisiondir1 = GetBoomerangCollisionDirection(futureposition.x, futureposition.y, boomerang.size.x, boomerang.size.y, player1.position.x, player1.position.y, player1.width, player1.height)

--  print(movedirection.x)
  if boomerang.onHand1 == true and boomerang.onHand2 == false then
      boomerang.position.x = player1.position.x + player1.width/2
      boomerang.position.y = player1.position.y + player1.height/30
  end
  if boomerang.onHand1 == false and boomerang.onHand2 == false then
    returning = vector2.new(-300, 0)
  end
  if not (collisiondir1.y == 0 and collisiondir1.x == 0) then

--print(acceleration.x)
    if movedirection.x == collisiondir1.x then --side collision
      boomerang.velocity = vector2.new(0, 0)
      acceleration = vector2.new(0, 0)
      boomerang.throw = false
      boomerang.onHand1 = true
      boomerang.movingShare = false
      boomerang.movingThrow = false
      boomerang.collision = false
      returning = vector2.new(0, 0)
    end
  end
-------------------------------------------------------------Player 2----------------------------------------------------------------------------------------
  
   if love.keyboard.isDown("kp1") and boomerang.throw == false and boomerang.onHand2 == true and boomerang.onHand1 == false then
    boomerang.throw = true
    boomerang.onHand2 = false
    boomerang.movingThrow = true
    boomerang.collision2 = true
    movedirection.x = -1
    boomerang.position.x = player2.position.x + 25
    boomerang.position.y = player2.position.y + (player2.height / 2)
    local flight = vector2.new( 22000 , 0)
    acceleration = vector2.addForce(flight, boomerang.mass, acceleration)
  end
  
  if love.keyboard.isDown("kp2") and boomerang.throw == false and boomerang.onHand2 == true and boomerang.onHand1 == false and boomerang.movingShare == false then
    boomerang.throw = true
    boomerang.onHand2 = false
    boomerang.movingThrow = true
    boomerang.movingShare = true
    movedirection.x = -1
    boomerang.position.x = player2.position.x + 25
    boomerang.position.y = player2.position.y + (player2.height / 2)
    local flight = vector2.new(boomerang.ispeed * math.cos(math.sqrt(3)/2), boomerang.ispeed * -math.sin(1/2))
    acceleration = vector2.addForce(flight, boomerang.mass, acceleration)
  end

  local collisiondir2 = GetBoomerangCollisionDirection(futureposition.x, futureposition.y, boomerang.size.x, boomerang.size.y, player2.position.x, player2.position.y, player2.width, player2.height)
  
  if boomerang.onHand2 == true and boomerang.onHand1 == false then
      boomerang.position.x = player2.position.x + player2.width/2
      boomerang.position.y = player2.position.y + player2.height/30
  end
  if boomerang.onHand1 == false and boomerang.onHand2 == false then
      returning = vector2.new(-300, 0)
  end
  if not (collisiondir2.y == 0 and collisiondir2.x == 0) then

  if movedirection.x == collisiondir2.x then --side collision
      boomerang.velocity = vector2.new(0, 0)
      acceleration = vector2.new(0, 0)
      boomerang.throw = false
      boomerang.onHand2 = true
      boomerang.movingShare = false
      boomerang.movingThrow = false
      boomerang.collision2 = false
      returning = vector2.new(0, 0)
    end
  end


  
  if boomerang.position.x < -10 then
    boomerang.velocity = vector2.new(0, 0)
    acceleration = vector2.new(0, 0)
    boomerang.throw = true
  end
  
    boomerang.velocity = vector2.add(boomerang.velocity, vector2.mult(acceleration,dt))
    boomerang.velocity = vector2.limit(boomerang.velocity, boomerang.maxspeed)
    boomerang.position = vector2.add(boomerang.position, vector2.mult(boomerang.velocity, dt))
    
    
    if boomerang.throw == true then
      rotation = rotation + (300 * dt)
    else rotation = 330
    end
end

function GetBoomerangCollisionDirection(x1,y1,w1,h1,x2,y2,w2,h2)
  local xdist = math.abs((x1 + (w1 / 2)) - (x2 + (w2 / 2)))
  local ydist = math.abs((y1 + (h1 / 2)) - (y2 + (h2 / 2)))
  local combinedwidth = (w1 / 2) + (w2 / 2)
  local combinedheight = (h1 / 2) + (h2 / 2)
  
  if(xdist > combinedwidth) then
    return vector2.new(0, 0)
  end
  
  if(ydist > combinedheight) then
    return vector2.new(0, 0)
  end

  local overlapx = math.abs(xdist - combinedwidth)
  local overlapy = math.abs(ydist - combinedheight)
  local playerdir = vector2.normalize(vector2.sub(vector2.new(x1,y1),vector2.new(x2,y2)))
  local collisiondir
  
  if overlapx > overlapy then
    collisiondir = vector2.normalize(vector2.new(0, playerdir.y *overlapy))
    
  elseif overlapx < overlapy then
    collisiondir = vector2.normalize(vector2.new(playerdir.x * overlapx, 0))
  else
    collisiondir = vector2.normalize(vector2.new(playerdir.x * overlapx, playerdir.y * overlapy))
  end
    return collisiondir

end



function boomerangDraw()
    love.graphics.draw(BoomerangSprite, boomerang.position.x, boomerang.position.y, math.rad(rotation) , 0.04, 0.04, BoomerangSprite:getWidth()/2, BoomerangSprite:getHeight()/2)
  end