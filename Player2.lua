require "vector2"

player2 = {
 position = vector2.new(200, 540),
 velocity = vector2.new(0, 0),
 width = 25,
 height = 35,
 maxspeed = 300,
 mass = 1,
 collided = false,
 moving = false,
 direction = vector2.new(1, 0),
 acceleration = vector2.new(0, 0),
 Anim_Timer = 0
}

local frame0 = nil
local frame1 = nil
local frame2 = nil
local frame3 = nil
local frame4 = nil
local frame5 = nil
local frame6 = nil
local frame7 = nil
local frame8 = nil
local frame9 = nil
local frame10 = nil
local frame11 = nil
local frame12 = nil
local frame13 = nil
local frame14 = nil
local frame15 = nil
local frame16 = nil
local frame17 = nil
local frame18 = nil
local frame19 = nil
local frame20 = nil

local frictioncoefficient = 0

canPressUP = true
canPressDOWN = true

function getPosition1()
  return player2.position
end

function player2load()
  frame0 = love.graphics.newImage("Animated/Done/Done2/Armature_animtion0_0.png")
  frame1 = love.graphics.newImage("Animated/Done/Done2/Armature_animtion0_1.png")
  frame2 = love.graphics.newImage("Animated/Done/Done2/Armature_animtion0_2.png")
  frame3 = love.graphics.newImage("Animated/Done/Done2/Armature_animtion0_3.png")
  frame4 = love.graphics.newImage("Animated/Done/Done2/Armature_animtion0_4.png")
  frame5 = love.graphics.newImage("Animated/Done/Done2/Armature_animtion0_5.png")
  frame6 = love.graphics.newImage("Animated/Done/Done2/Armature_animtion0_6.png")
  frame7 = love.graphics.newImage("Animated/Done/Done2/Armature_animtion0_7.png")
  frame8 = love.graphics.newImage("Animated/Done/Done2/Armature_animtion0_8.png")
  frame9 = love.graphics.newImage("Animated/Done/Done2/Armature_animtion0_9.png")
  frame10 = love.graphics.newImage("Animated/Done/Done2/Armature_animtion0_10.png")
  frame11 = love.graphics.newImage("Animated/Done/Done2/Armature_animtion0_11.png")
  frame12 = love.graphics.newImage("Animated/Done/Done2/Armature_animtion0_12.png")
  frame13 = love.graphics.newImage("Animated/Done/Done2/Armature_animtion0_13.png")
  frame14 = love.graphics.newImage("Animated/Done/Done2/Armature_animtion0_14.png")
  frame15 = love.graphics.newImage("Animated/Done/Done2/Armature_animtion0_15.png")
  frame16 = love.graphics.newImage("Animated/Done/Done2/Armature_animtion0_16.png")
  frame17 = love.graphics.newImage("Animated/Done/Done2/Armature_animtion0_17.png")
  frame18 = love.graphics.newImage("Animated/Done/Done2/Armature_animtion0_18.png")
  frame19 = love.graphics.newImage("Animated/Done/Done2/Armature_animtion0_19.png")
  frame20 = love.graphics.newImage("Animated/Done/Done2/Armature_animtion0_20.png")
  love.graphics.setBackgroundColor(1, 1, 1)  
end

function player2update(dt)
  
  player2.Anim_Timer = player2.Anim_Timer - (200 * dt)
  if player2.Anim_Timer < - 100 then
    player2.Anim_Timer = 0
  end
  if player2.Anim_Timer < - 5 then
    frame0 = frame1
  end
  if player2.Anim_Timer < - 10 then
    frame0 = frame2
  end
  if player2.Anim_Timer < - 15 then
    frame0 = frame3
  end
  if player2.Anim_Timer < - 20 then
    frame0 = frame4
  end
  if player2.Anim_Timer < - 25 then
    frame0 = frame5
  end
  if player2.Anim_Timer < - 30 then
    frame0 = frame6
  end
  if player2.Anim_Timer < - 35 then
    frame0 = frame7
  end
  if player2.Anim_Timer < - 40 then
    frame0 = frame8
  end
  if player2.Anim_Timer < - 45 then
    frame0 = frame9
  end
  if player2.Anim_Timer < - 50 then
    frame0 = frame10
  end
  if player2.Anim_Timer < - 55 then
    frame0 = frame11
  end
  if player2.Anim_Timer < - 60 then
    frame0 = frame12
  end
  if player2.Anim_Timer < - 65 then
    frame0 = frame13
  end
  if player2.Anim_Timer < - 70 then
    frame0 = frame14
  end
  if player2.Anim_Timer < - 75 then
    frame0 = frame15
  end
  if player2.Anim_Timer < - 80 then
    frame0 = frame16
  end
  if player2.Anim_Timer < - 85 then
    frame0 = frame17
  end
  if player2.Anim_Timer < - 90 then
    frame0 = frame18
  end
  if player2.Anim_Timer < - 95 then
    frame0 = frame19
  end
  if player2.Anim_Timer < - 100 then
    frame0 = frame20
  end
  
  player2.acceleration = vector2.new(0, 0)
  local friction = vector2.mult(player2.velocity, -1)
  friction = vector2.normalize(friction)
  
  if player2.moving == true then
    friction = vector2.mult(friction, frictioncoefficient)
  else
    friction = vector2.mult(friction, frictioncoefficient * 5)
  end

  player2.acceleration = vector2.addForce(friction, player2.mass, player2.acceleration) 
    
  if canPressUP == true and love.keyboard.isDown("up") then
    local move = vector2.new(0, -1000)
    player2.acceleration = vector2.addForce(move, player2.mass, player2.acceleration)
    player2.moving = true
    player2.direction.y = 1
  end
  
  if canPressDOWN == true and love.keyboard.isDown("down") then
    local move = vector2.new(0, 1000)
    player2.acceleration = vector2.addForce(move, player2.mass, player2.acceleration)
    player2.moving = true
    player2.direction.y = -1
  end
  
  futurevelocity2 = vector2.add(player2.velocity, vector2.mult(player2.acceleration, dt))
  futurevelocity2 = vector2.limit(player2.velocity, player2.maxspeed)
  futureposition2 = vector2.add(player2.position, vector2.mult(futurevelocity, dt))
  
  if objects2 ~= nil then
    local collisiondir2 = GetBoxCollisionDirection2(futureposition2.x, futureposition2.y, player2.width, player2.height, objects2.position.x, objects2.position.y, objects2.size.x, objects2.size.y)
    if player2.collided == false and objects2.canCollide == true then
      if collisiondir2.x ~= 0 or collisiondir2.y ~= 0 then
        if collisiondir2.y == 1 then
          player2.acceleration.y = 0 
          player2.velocity.y = 0
          player2.collided = true
          canPressUP = true
        end
      else
        canPressUP = true
        canPressDOWN = true
      end
    end
    if player2.collided == false and objects2.canCollide == true then
      if collisiondir2.x ~= 0 or collisiondir2.y ~= 0 then
        if collisiondir2.y == player2.direction.y then
            player2.acceleration.y = 0
            player2.velocity.y = 0
            player2.collided = true
            canPressDOWN = true
        end
      else
        canPressUP = true
        canPressDOWN = true
      end
    end
    if player2.collided == false and objects2.canCollide == true then
      if collisiondir2.x ~= 0 or collisiondir2.y ~= 0 then
        if player2.direction.x ~= collisiondir2.x then
          player2.velocity.x = player2.velocity.x - (1800 * dt)
          player2.position.x = player2.position.x - (100 * dt)
    --          player1.acceleration.x = 0
    --          player1.velocity.x = 0
              player2.collided = true
        end
      end
    end
  end
  
  for i = 1, table.getn(worldObjects2), 1 do
    local collisiondir2 = GetBoxCollisionDirection2(futureposition2.x, futureposition2.y, player2.width, player2.height, worldObjects2[i].position.x, worldObjects2[i].position.y, worldObjects2[i].size.x, worldObjects2[i].size.y)
    if player2.collided == false then
      if collisiondir2.x ~= 0 or collisiondir2.y ~= 0 then
        if collisiondir2.y == 1 then
          player2.acceleration.y = 0 
          player2.velocity.y = 0
          player2.collided = true
          canPressUP = true
        end
      else
        canPressUP = true
        canPressDOWN = true
      end
    end
    if player2.collided == false then
      if collisiondir2.x ~= 0 or collisiondir2.y ~= 0 then
        if collisiondir2.y == player2.direction.y then
            player2.acceleration.y = 0
            player2.velocity.y = 0
            player2.collided = true
            canPressDOWN = true
        end
      else
        canPressUP = true
        canPressDOWN = true
      end
    end
    if player2.collided == false then
      if collisiondir2.x ~= 0 or collisiondir2.y ~= 0 then
        if player2.direction.x ~= collisiondir2.x then
          player2.velocity.x = player2.velocity.x - (1800 * dt)
          player2.position.x = player2.position.x - (100 * dt)
--          player1.acceleration.x = 0
--          player1.velocity.x = 0
          player2.collided = true
        end
      end
    end
  end
  
  player2.velocity = vector2.add(player2.velocity, vector2.mult(player2.acceleration, dt))
  player2.velocity = vector2.limit(player2.velocity, player2.maxspeed)
  player2.position = vector2.add(player2.position, vector2.mult(player2.velocity, dt))
  
--  if player2.position.x <= PPwall() then
--    moving = false
--  end

  if player2.moving == false and vector2.mag(player2.velocity) <= 5 then
    player2.velocity.y = 0
  end
  
  if player2.position.y < love.graphics.getHeight()/2 + 20 then
    player2.position.y = love.graphics.getHeight()/2 + 20
  elseif player2.position.y > 657 - player2.height then
    player2.position.y = 657 - player2.height
  end
  
  player2.collided = false
end

function player2CheckForStop()
  if love.keyboard.isDown("up") == false and love.keyboard.isDown("down") == false then
    player2.moving = false
    player2.velocity.y = 0
  end
end

function player2draw()
  love.graphics.draw(frame0, player2.position.x, player2.position.y)
end