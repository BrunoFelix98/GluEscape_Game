require "vector2"

player1 = {
 position = vector2.new(200, 180),
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

canPressS = true
canPressW = true

function getPosition1()
  return player1.position
end

function player1load()
  frame0 = love.graphics.newImage("Animated/Done/Armature_animtion0_0.png")
  frame1 = love.graphics.newImage("Animated/Done/Armature_animtion0_1.png")
  frame2 = love.graphics.newImage("Animated/Done/Armature_animtion0_2.png")
  frame3 = love.graphics.newImage("Animated/Done/Armature_animtion0_3.png")
  frame4 = love.graphics.newImage("Animated/Done/Armature_animtion0_4.png")
  frame5 = love.graphics.newImage("Animated/Done/Armature_animtion0_5.png")
  frame6 = love.graphics.newImage("Animated/Done/Armature_animtion0_6.png")
  frame7 = love.graphics.newImage("Animated/Done/Armature_animtion0_7.png")
  frame8 = love.graphics.newImage("Animated/Done/Armature_animtion0_8.png")
  frame9 = love.graphics.newImage("Animated/Done/Armature_animtion0_9.png")
  frame10 = love.graphics.newImage("Animated/Done/Armature_animtion0_10.png")
  frame11 = love.graphics.newImage("Animated/Done/Armature_animtion0_11.png")
  frame12 = love.graphics.newImage("Animated/Done/Armature_animtion0_12.png")
  frame13 = love.graphics.newImage("Animated/Done/Armature_animtion0_13.png")
  frame14 = love.graphics.newImage("Animated/Done/Armature_animtion0_14.png")
  frame15 = love.graphics.newImage("Animated/Done/Armature_animtion0_15.png")
  frame16 = love.graphics.newImage("Animated/Done/Armature_animtion0_16.png")
  frame17 = love.graphics.newImage("Animated/Done/Armature_animtion0_17.png")
  frame18 = love.graphics.newImage("Animated/Done/Armature_animtion0_18.png")
  frame19 = love.graphics.newImage("Animated/Done/Armature_animtion0_19.png")
  frame20 = love.graphics.newImage("Animated/Done/Armature_animtion0_20.png")
  
  love.graphics.setBackgroundColor(1, 1, 1)
end

function player1update(dt)
  player1.Anim_Timer = player1.Anim_Timer - (200 * dt)
  if player1.Anim_Timer < - 100 then
    player1.Anim_Timer = 0
  end
  if player1.Anim_Timer < - 5 then
    frame0 = frame1
  end
  if player1.Anim_Timer < - 10 then
    frame0 = frame2
  end
  if player1.Anim_Timer < - 15 then
    frame0 = frame3
  end
  if player1.Anim_Timer < - 20 then
    frame0 = frame4
  end
  if player1.Anim_Timer < - 25 then
    frame0 = frame5
  end
  if player1.Anim_Timer < - 30 then
    frame0 = frame6
  end
  if player1.Anim_Timer < - 35 then
    frame0 = frame7
  end
  if player1.Anim_Timer < - 40 then
    frame0 = frame8
  end
  if player1.Anim_Timer < - 45 then
    frame0 = frame9
  end
  if player1.Anim_Timer < - 50 then
    frame0 = frame10
  end
  if player1.Anim_Timer < - 55 then
    frame0 = frame11
  end
  if player1.Anim_Timer < - 60 then
    frame0 = frame12
  end
  if player1.Anim_Timer < - 65 then
    frame0 = frame13
  end
  if player1.Anim_Timer < - 70 then
    frame0 = frame14
  end
  if player1.Anim_Timer < - 75 then
    frame0 = frame15
  end
  if player1.Anim_Timer < - 80 then
    frame0 = frame16
  end
  if player1.Anim_Timer < - 85 then
    frame0 = frame17
  end
  if player1.Anim_Timer < - 90 then
    frame0 = frame18
  end
  if player1.Anim_Timer < - 95 then
    frame0 = frame19
  end
  if player1.Anim_Timer < - 100 then
    frame0 = frame20
  end
  
  player1.acceleration = vector2.new(0, 0)
  local friction = vector2.mult(player1.velocity, -1)
  friction = vector2.normalize(friction)
  
  if player1.moving == true then
    friction = vector2.mult(friction, frictioncoefficient)
  else
    friction = vector2.mult(friction, frictioncoefficient * 5)
  end
   
  player1.acceleration = vector2.addForce(friction, player1.mass, player1.acceleration)    
   
  if canPressW == true and love.keyboard.isDown("w") then
    local move = vector2.new(0, -1000)
    player1.acceleration = vector2.addForce(move, player1.mass, player1.acceleration)
    player1.moving = true
    player1.direction.y = 1
  end
  
  if canPressS == true and love.keyboard.isDown("s") then
    local move = vector2.new(0, 1000)
    player1.acceleration = vector2.addForce(move, player1.mass, player1.acceleration)
    player1.moving = true
    player1.direction.y = -1
  end
  
  futurevelocity = vector2.add(player1.velocity, vector2.mult(player1.acceleration, dt))
  futurevelocity = vector2.limit(player1.velocity, player1.maxspeed)
  futureposition = vector2.add(player1.position, vector2.mult(futurevelocity, dt))
  
  if objects ~= nil then
    local collisiondir1 = GetBoxCollisionDirection(futureposition.x, futureposition.y, player1.width, player1.height, objects.position.x, objects.position.y, objects.size.x, objects.size.y)
    if player1.collided == false and objects.canCollide == true then
      if collisiondir1.x ~= 0 or collisiondir1.y ~= 0 then
        if collisiondir1.y == 1 then
          player1.acceleration.y = 0 
          player1.velocity.y = 0
          player1.collided = true
          canPressS = false
          canPressW = true
        end
      else
        canPressW = true
        canPressS = true
      end
      if player1.collided == false and objects.canCollide == true then
        if collisiondir1.x ~= 0 or collisiondir1.y ~= 0 then
          if collisiondir1.y == player1.direction.y then
            player1.acceleration.y = 0
            player1.velocity.y = 0
            player1.collided = true
            canPressW = false
            canPressS = true
          end
        end
      end
      if player1.collided == false and objects.canCollide == true then
        if collisiondir1.x ~= 0 or collisiondir1.y ~= 0 then
          if player1.direction.x ~= collisiondir1.x then
            player1.velocity.x = player1.velocity.x - (1800 * dt)
            player1.position.x = player1.position.x - (100 * dt)
  --          player1.acceleration.x = 0
  --          player1.velocity.x = 0
            player1.collided = true
          end
        end
      end
    end
  end

  for i = 1, table.getn(worldObjects), 1 do
    local collisiondir1 = GetBoxCollisionDirection(futureposition.x, futureposition.y, player1.width, player1.height, worldObjects[i].position.x, worldObjects[i].position.y, worldObjects[i].size.x, worldObjects[i].size.y)
    if player1.collided == false then
      if collisiondir1.x ~= 0 or collisiondir1.y ~= 0 then
        if collisiondir1.y == 1 then
          player1.acceleration.y = 0 
          player1.velocity.y = 0
          player1.collided = true
          canPressS = false
          canPressW = true
        end
      else
        canPressW = true
        canPressS = true
      end
      if player1.collided == false then
        if collisiondir1.x ~= 0 or collisiondir1.y ~= 0 then
          if collisiondir1.y == player1.direction.y then
            player1.acceleration.y = 0
            player1.velocity.y = 0
            player1.collided = true
            canPressW = false
            canPressS = true
          end
        end
      end
      if player1.collided == false then
        if collisiondir1.x ~= 0 or collisiondir1.y ~= 0 then
          if player1.direction.x ~= collisiondir1.x then
            player1.velocity.x = player1.velocity.x - (1800 * dt)
            player1.position.x = player1.position.x - (100 * dt)
  --          player1.acceleration.x = 0
  --          player1.velocity.x = 0
            player1.collided = true
          end
        end
      end
    end
  end

  player1.velocity = vector2.add(player1.velocity, vector2.mult(player1.acceleration, dt))
  player1.velocity = vector2.limit(player1.velocity, player1.maxspeed)
  player1.position = vector2.add(player1.position, vector2.mult(player1.velocity, dt))
  
--  if player1.position.x <= PPwall() then
--    moving = false
--  end
  
  if player1.moving == false and vector2.mag(player1.velocity) <= 5 then
    player1.velocity.y = 0
  end
  
  if player1.position.y > love.graphics.getHeight()/2 - player1.height - 20 then
    player1.position.y = love.graphics.getHeight()/2 - player1.height - 20
  elseif player1.position.y < 64 then
    player1.position.y = 64
  end

  player1.collided = false
end

function player1CheckForStop()
  if love.keyboard.isDown("w") == false and love.keyboard.isDown("s") == false then
    player1.moving = false
    player1.velocity.y = 0
  end
end

function player1draw()
  love.graphics.draw(frame0, player1.position.x, player1.position.y)
end