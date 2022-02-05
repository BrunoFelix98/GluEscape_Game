require "vector2"
require "conf"
require "Boomerang"
require "worldObjects"
require "Player1"
require "Player2"

sections = {}
sections2 = {}

worldObjects = {}
worldObjects2 = {}

objects = nil
objects2 = nil

local LogCount = 1

Log = nil 
Tree = nil
Bush = nil
Background = nil
BrokenLog = nil
Log2 = nil 
Tree2 = nil
Bush2 = nil
BrokenLog2 = nil
value = 0
value2 = 0

objectsoffset =  0
BGoffset = 0
local counting = 0

local px = {}
local speed = 200

function BackgroundLoad()
  Background = love.graphics.newImage("Background.png")
  Tree = love.graphics.newImage("Tree.png")
  Log = love.graphics.newImage("Log.png")
  Bush = love.graphics.newImage("Bush.png")
  BrokenLog = love.graphics.newImage("BrokenLog.png")
  Tree2 = love.graphics.newImage("Tree.png")
  Log2 = love.graphics.newImage("Log.png")
  Bush2 = love.graphics.newImage("Bush.png")
  BrokenLog2 = love.graphics.newImage("BrokenLog.png")
  for i = 60, love.graphics.getHeight(), 1 do
    px[i] = vector2.new(love.math.random(0, love.graphics.getWidth()), love.math.random(0, 5))
  end
    sections = love.math.random(1, 4)
    sections2 = love.math.random(1, 4)
end

function BackgroundUpdate(dt)
  objectsoffset = objectsoffset - (250 * dt)
  BGoffset = BGoffset - (250 * dt)

  if objectsoffset <= - 2200 then
    objectsoffset = 0
    Log = love.graphics.newImage("Log.png")
    Fence = love.graphics.newImage("Fence.png")
    if sections == 1 and Log == love.graphics.newImage("Log.png") then
      objects.canCollide = true
    end
    Log2 = love.graphics.newImage("Log.png")
    Fence2 = love.graphics.newImage("Fence.png")
    if sections2 == 1 and Log2 == love.graphics.newImage("Log.png") then
      objects2.canCollide = true
    elseif sections2 == 2 and Fence2 == love.graphics.newImage("Fence.png") then
      objects2.canCollide = true
    end
    boomerang.touch = false
    boomerang.touch2 = false
    if sections == 1 then
      sections2 = love.math.random(2, 4)
    else
      sections2 = love.math.random(1, 4)
    end
    if sections2 == 1 then
      sections = love.math.random(2, 4)
    else
      sections = love.math.random(1, 4)
    end
  end
end

function BackgroundDraw()
  love.graphics.setColor(1, 1, 1)
  for i = 1, 5, 1 do
    for i = 1, love.graphics.getWidth() - BGoffset, Background:getWidth() do
      love.graphics.draw(Background, i + BGoffset, 0)
    end
    if sections == 1 then
      
      --Logs--
      
      --love.graphics.draw(Log, love.graphics.getWidth() + 200 + 300 + objectsoffset, 55)
      
      if objects == nil then
        objects = createObject(love.graphics.getWidth() + 200 + 300 + objectsoffset, 55, 70, 287, "Log")
      else
        updateObject(love.graphics.getWidth() + 200 + 300 + objectsoffset, 55, 70, 287, "Log")
      end
      --print(objectsoffset)
        if boomerang.touch == true then
          Log = BrokenLog
          objects.canCollide = false
        end
        
        currentSection = 1
        value = 10
        
    elseif sections == 2 then
      --Trees--
      
      --love.graphics.draw(Tree, love.graphics.getWidth() + 200 + objectsoffset, 64, 0 , 1.5, 1.5)
      worldObjects[1] = createObject(love.graphics.getWidth() + 200 + objectsoffset, 64, 64, 64, "Tree")
      love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() + objectsoffset), 64)
      love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() * 2 + objectsoffset), 64)
      love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() * 3 + objectsoffset), 64)
      love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() * 4 + objectsoffset), 64)
      worldObjects[2] = createObject(love.graphics.getWidth() + 200 + (Tree:getWidth() * 4 + objectsoffset), 64, 64, 64, "Tree")
      --love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() + objectsoffset), 64 + Tree:getHeight())
      worldObjects[3] = createObject(love.graphics.getWidth() + 200 + (Tree:getWidth() + objectsoffset), 64 + Tree:getHeight(), 64, 64, "Tree")
      --love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() * 2 + objectsoffset), 64 + Tree:getHeight())
      worldObjects[4] = createObject(love.graphics.getWidth() + 200 + (Tree:getWidth() * 2 + objectsoffset), 64 + Tree:getHeight(), 64, 64, "Tree")
      --love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() * 3 + objectsoffset), 64 + Tree:getHeight())
      worldObjects[5] = createObject(love.graphics.getWidth() + 200 + (Tree:getWidth() * 3 + objectsoffset), 64 + Tree:getHeight(), 64, 64, "Tree")
      --Bushes--
      
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + objectsoffset, love.graphics.getHeight()/2 - 60)
      worldObjects[6] = createObject(love.graphics.getWidth() + 200 + objectsoffset, love.graphics.getHeight()/2 - 60, 64, 64, "Bush")
      love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() + objectsoffset), love.graphics.getHeight()/2 - 60)
      love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 2 + objectsoffset), love.graphics.getHeight()/2 - 60)
      love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 3 + objectsoffset), love.graphics.getHeight()/2 - 60)
      love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 4 + objectsoffset), love.graphics.getHeight()/2 - 60)
      love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 5 + objectsoffset), love.graphics.getHeight()/2 - 60)
      love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 6 + objectsoffset), love.graphics.getHeight()/2 - 60)
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 7 + objectsoffset), love.graphics.getHeight()/2 - 60)
      worldObjects[7] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() * 7 + objectsoffset), love.graphics.getHeight()/2 - 60, 64, 64, "Bush")
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight())
      worldObjects[8] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight(), 64, 64, "Bush")
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 2 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight())
      worldObjects[9] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() * 2 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight(), 64, 64, "Bush")
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 3 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight())
      worldObjects[10] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() * 3 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight(), 64, 64, "Bush")
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 4 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight())
      worldObjects[11] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() * 4 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight(), 64, 64, "Bush")
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 5 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight())
      worldObjects[12] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() * 5 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight(), 64, 64, "Bush")
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 6 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight())
      worldObjects[13] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() * 6 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight(), 64, 64, "Bush")
        currentSection = 2
        value = 5
    elseif sections == 3 then
      --BigTreesTop--
      
      --love.graphics.draw(Tree, love.graphics.getWidth() + 200 + objectsoffset, 64)
      worldObjects[1] = createObject(love.graphics.getWidth() + 200 + objectsoffset, 64, 64, 64, "Tree")
      love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() + objectsoffset), 64)
      love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() * 2 + objectsoffset), 64)
      love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() * 3 + objectsoffset), 64)
      love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() * 4 + objectsoffset), 64)
      love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() * 5 + objectsoffset), 64)
      --love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() * 6 + objectsoffset), 64)
      worldObjects[2] = createObject(love.graphics.getWidth() + 200 + (Tree:getWidth() * 6 + objectsoffset), 64, 64, 64, "Tree")
      --love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() + objectsoffset), 64 + Tree:getHeight())
      worldObjects[3] = createObject(love.graphics.getWidth() + 200 + (Tree:getWidth() + objectsoffset), 64 + Tree:getHeight(), 64, 64, "Tree")
      love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() * 2 + objectsoffset), 64 + Tree:getHeight())
      love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() * 3 + objectsoffset), 64 + Tree:getHeight())
      love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() * 4 + objectsoffset), 64 + Tree:getHeight())
      --love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() * 5 + objectsoffset), 64 + Tree:getHeight())
      worldObjects[4] = createObject(love.graphics.getWidth() + 200 + (Tree:getWidth() * 5 + objectsoffset), 64 + Tree:getHeight(), 64, 64, "Tree")
      --love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() * 2 + objectsoffset), 64 + Tree:getHeight() * 2)
      worldObjects[5] = createObject(love.graphics.getWidth() + 200 + (Tree:getWidth() * 2 + objectsoffset), 64 + Tree:getHeight() * 2, 64, 64, "Tree")
      --love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() * 3 + objectsoffset), 64 + Tree:getHeight() * 2)
      worldObjects[6] = createObject(love.graphics.getWidth() + 200 + (Tree:getWidth() * 3 + objectsoffset), 64 + Tree:getHeight() * 2, 64, 64, "Tree")
      --love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() * 4 + objectsoffset), 64 + Tree:getHeight() * 2)
      worldObjects[7] = createObject(love.graphics.getWidth() + 200 + (Tree:getWidth() * 4 + objectsoffset), 64 + Tree:getHeight() * 2, 64, 64, "Tree")
        currentSection = 3
        value = 5
    elseif sections == 4 then
      --BigBushesBottom--
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + objectsoffset, love.graphics.getHeight()/2 - 60)
      worldObjects[1] = createObject(love.graphics.getWidth() + 200 + objectsoffset, love.graphics.getHeight()/2 - 60, 40, 40, "Bush")
      love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() + objectsoffset), love.graphics.getHeight()/2 - 60)
      love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 2 + objectsoffset), love.graphics.getHeight()/2 - 60)
      love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 3 + objectsoffset), love.graphics.getHeight()/2 - 60)
      love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 4 + objectsoffset), love.graphics.getHeight()/2 - 60)
      love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 5 + objectsoffset), love.graphics.getHeight()/2 - 60)
      love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 6 + objectsoffset), love.graphics.getHeight()/2 - 60)
      love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 7 + objectsoffset), love.graphics.getHeight()/2 - 60)
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 8 + objectsoffset), love.graphics.getHeight()/2 - 60)
      worldObjects[2] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() * 8 + objectsoffset), love.graphics.getHeight()/2 - 60, 64, 64, "Bush")
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight())
      worldObjects[3] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight(), 40, 40, "Bush")
      love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 2 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight())
      love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 3 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight())
      love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 4 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight())
      love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 5 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight())
      love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 6 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight())
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 7 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight())
      worldObjects[4] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() * 7 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight(), 40, 40, "Bush")
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 2 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight() * 2)
      worldObjects[5] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() * 2 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight() * 2, 40, 40, "Bush")
      love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 3 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight() * 2)
      love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 4 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight() * 2)
      love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 5 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight() * 2)
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 6 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight() * 2)
      worldObjects[6] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() * 6 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight() * 2, 40, 40, "Bush")
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 3 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight() * 3)
      worldObjects[7] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() * 3 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight() * 3, 40, 40, "Bush")
      love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 4 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight() * 3)
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 5 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight() * 3)
      worldObjects[8] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() * 5 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight() * 3, 40, 40, "Bush")
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 4 + offset), love.graphics.getHeight()/2 - 60 - Bush:getHeight() * 4)
      worldObjects[9] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() * 4 + objectsoffset), love.graphics.getHeight()/2 - 60 - Bush:getHeight() * 4, 40, 40, "Bush")
        currentSection = 4
        value = 5
    end
    if sections2 == 1 then
      
      --Logs--
      
      --love.graphics.draw(Log, love.graphics.getWidth() + 200 + 300 + objectsoffset, love.graphics.getHeight()/2 + Bush:getHeight()/2)
      
      if objects2 == nil then
        objects2 = createObject(love.graphics.getWidth() + 200 + 300 + objectsoffset, love.graphics.getHeight()/2 + Bush:getHeight()/2, 70, 287, "Log2")
      else
        updateObject2(love.graphics.getWidth() + 200 + 300 + objectsoffset, love.graphics.getHeight()/2 + Bush:getHeight()/2, 70, 287, "Log2")
      end   
      
        if boomerang.touch2 == true then
          Log2 = BrokenLog2
          objects2.canCollide = false
        end
        
        currentSection2 = 1
        value2 = 10
        
    elseif sections2 == 2 then
      --Trees--
      --love.graphics.draw(Tree, love.graphics.getWidth() + 200 + objectsoffset, love.graphics.getHeight() - Tree:getHeight() * 2)
      worldObjects2[1] = createObject(love.graphics.getWidth() + 200 + objectsoffset, love.graphics.getHeight() - Tree:getHeight() * 2, 64, 64, "Tree2")
      love.graphics.draw(Tree2, love.graphics.getWidth() + 200 + (Tree:getWidth() + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 2)
      love.graphics.draw(Tree2, love.graphics.getWidth() + 200 + (Tree:getWidth() * 2 + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 2)
      love.graphics.draw(Tree2, love.graphics.getWidth() + 200 + (Tree:getWidth() * 3 + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 2)
      --love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() * 4 + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 2)
      worldObjects2[2] = createObject(love.graphics.getWidth() + 200 + (Tree:getWidth() * 4 + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 2, 64, 64, "Tree2")
      --love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 3)
      worldObjects2[3] = createObject(love.graphics.getWidth() + 200 + (Tree:getWidth() + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 3, 64, 64, "Tree2")
      --love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() * 2 + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 3)
      worldObjects2[4] = createObject(love.graphics.getWidth() + 200 + (Tree:getWidth() * 2 + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 3, 64, 64, "Tree2")
      --love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() * 3 + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 3)
      worldObjects2[5] = createObject(love.graphics.getWidth() + 200 + (Tree:getWidth() * 3 + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 3, 64, 64, "Tree2")
      --Bushes--
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + objectsoffset, love.graphics.getHeight()/2 + Bush:getHeight()/2)
      worldObjects2[6] = createObject(love.graphics.getWidth() + 200 + objectsoffset, love.graphics.getHeight()/2 + Bush:getHeight()/2, 40, 40, "Bush2")
      love.graphics.draw(Bush2, love.graphics.getWidth() + 200 + (Bush:getWidth() + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2)
      love.graphics.draw(Bush2, love.graphics.getWidth() + 200 + (Bush:getWidth() * 2 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2)
      love.graphics.draw(Bush2, love.graphics.getWidth() + 200 + (Bush:getWidth() * 3 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2)
      love.graphics.draw(Bush2, love.graphics.getWidth() + 200 + (Bush:getWidth() * 4 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2)
      love.graphics.draw(Bush2, love.graphics.getWidth() + 200 + (Bush:getWidth() * 5 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2)
      love.graphics.draw(Bush2, love.graphics.getWidth() + 200 + (Bush:getWidth() * 6 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2)
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 7 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2)
      worldObjects2[7] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() * 7 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2, 40, 40, "Bush2")
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 + Bush:getHeight())
      worldObjects2[8] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 + Bush:getHeight(), 40, 40, "Bush2")
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 2 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 + Bush:getHeight())
      worldObjects2[9] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() * 2 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 + Bush:getHeight(), 40, 40, "Bush2")
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 3 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 + Bush:getHeight())
      worldObjects2[10] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() * 3 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 + Bush:getHeight(), 40, 40, "Bush2")
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 4 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 + Bush:getHeight())
      worldObjects2[11] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() * 4 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 + Bush:getHeight(), 40, 40, "Bush2")
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 5 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 + Bush:getHeight())
      worldObjects2[12] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() * 5 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 + Bush:getHeight(), 40, 40, "Bush2")
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 6 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 + Bush:getHeight())
      worldObjects2[13] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() * 6 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 + Bush:getHeight(), 40, 40, "Bush2")
        currentSection2 = 2
        value2 = 5
    elseif sections2 == 3 then
      --BigTreesBottom--
      --love.graphics.draw(Tree, love.graphics.getWidth() + 200 + offset, love.graphics.getHeight() - Tree:getHeight() * 2)
      worldObjects2[1] = createObject(love.graphics.getWidth() + 200 + objectsoffset, love.graphics.getHeight() - Tree:getHeight() * 2, 64, 64, "Tree2")
      love.graphics.draw(Tree2, love.graphics.getWidth() + 200 + (Tree:getWidth() + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 2)
      love.graphics.draw(Tree2, love.graphics.getWidth() + 200 + (Tree:getWidth() * 2 + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 2)
      love.graphics.draw(Tree2, love.graphics.getWidth() + 200 + (Tree:getWidth() * 3 + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 2)
      love.graphics.draw(Tree2, love.graphics.getWidth() + 200 + (Tree:getWidth() * 4 + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 2)
      love.graphics.draw(Tree2, love.graphics.getWidth() + 200 + (Tree:getWidth() * 5 + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 2)
      --love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() * 6 + objectsoffset), love.graphics.getHeight() - Tree:getHeight())
      worldObjects2[2] = createObject(love.graphics.getWidth() + 200 + (Tree:getWidth() * 6 + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 2, 64, 64, "Tree2")
      --love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 3)
      worldObjects2[3] = createObject(love.graphics.getWidth() + 200 + (Tree:getWidth() + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 3, 64, 64, "Tree2")
      love.graphics.draw(Tree2, love.graphics.getWidth() + 200 + (Tree:getWidth() * 2 + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 3)
      love.graphics.draw(Tree2, love.graphics.getWidth() + 200 + (Tree:getWidth() * 3 + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 3)
      love.graphics.draw(Tree2, love.graphics.getWidth() + 200 + (Tree:getWidth() * 4 + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 3)
      --love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() * 5 + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 3)
      worldObjects2[4] = createObject(love.graphics.getWidth() + 200 + (Tree:getWidth() * 5 + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 3, 64, 64, "Tree2")
      --love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() * 2 + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 4)
      worldObjects2[5] = createObject(love.graphics.getWidth() + 200 + (Tree:getWidth() * 2 + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 4, 64, 64, "Tree2")
      --love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() * 3 + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 4)
      worldObjects2[6] = createObject(love.graphics.getWidth() + 200 + (Tree:getWidth() * 3 + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 4, 64, 64, "Tree2")
      --love.graphics.draw(Tree, love.graphics.getWidth() + 200 + (Tree:getWidth() * 4 + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 4)
      worldObjects2[7] = createObject(love.graphics.getWidth() + 200 + (Tree:getWidth() * 4 + objectsoffset), love.graphics.getHeight() - Tree:getHeight() * 4, 64, 64, "Tree2")
        currentSection2 = 3
        value2 = 5
    elseif sections2 == 4 then
      --BigBushesTop--
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + objectsoffset, love.graphics.getHeight()/2 + Bush:getHeight()/2)
      worldObjects2[1] = createObject(love.graphics.getWidth() + 200 + objectsoffset, love.graphics.getHeight()/2 + Bush:getHeight()/2, 40, 40, "Bush2")
      love.graphics.draw(Bush2, love.graphics.getWidth() + 200 + (Bush:getWidth() + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2)
      love.graphics.draw(Bush2, love.graphics.getWidth() + 200 + (Bush:getWidth() * 2 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2)
      love.graphics.draw(Bush2, love.graphics.getWidth() + 200 + (Bush:getWidth() * 3 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2)
      love.graphics.draw(Bush2, love.graphics.getWidth() + 200 + (Bush:getWidth() * 4 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2)
      love.graphics.draw(Bush2, love.graphics.getWidth() + 200 + (Bush:getWidth() * 5 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2)
      love.graphics.draw(Bush2, love.graphics.getWidth() + 200 + (Bush:getWidth() * 6 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2)
      love.graphics.draw(Bush2, love.graphics.getWidth() + 200 + (Bush:getWidth() * 7 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2)
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 8 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2)
      worldObjects2[2] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() * 8 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2, 40, 40, "Bush2")
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 * 3)
      worldObjects2[3] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 * 3, 40, 40, "Bush2")
      love.graphics.draw(Bush2, love.graphics.getWidth() + 200 + (Bush:getWidth() * 2 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 * 3)
      love.graphics.draw(Bush2, love.graphics.getWidth() + 200 + (Bush:getWidth() * 3 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 * 3)
      love.graphics.draw(Bush2, love.graphics.getWidth() + 200 + (Bush:getWidth() * 4 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 * 3)
      love.graphics.draw(Bush2, love.graphics.getWidth() + 200 + (Bush:getWidth() * 5 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 * 3)
      love.graphics.draw(Bush2, love.graphics.getWidth() + 200 + (Bush:getWidth() * 6 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 * 3)
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 7 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 * 3)
      worldObjects2[4] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() * 7 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 * 3, 40, 40, "Bush2")
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 2 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 * 5)
      worldObjects2[5] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() * 2 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 * 5, 40, 40, "Bush2")
      love.graphics.draw(Bush2, love.graphics.getWidth() + 200 + (Bush:getWidth() * 3 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 * 5)
      love.graphics.draw(Bush2, love.graphics.getWidth() + 200 + (Bush:getWidth() * 4 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 * 5)
      love.graphics.draw(Bush2, love.graphics.getWidth() + 200 + (Bush:getWidth() * 5 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 * 5)
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 6 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 * 5)
      worldObjects2[6] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() * 6 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 * 5, 40, 40, "Bush2")
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 3 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 * 7)
      worldObjects2[7] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() * 3 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 * 7, 40, 40, "Bush2")
      love.graphics.draw(Bush2, love.graphics.getWidth() + 200 + (Bush:getWidth() * 4 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 * 7)
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 5 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 * 7)
      worldObjects2[8] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() * 5 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 * 7, 40, 40, "Bush2")
      --love.graphics.draw(Bush, love.graphics.getWidth() + 200 + (Bush:getWidth() * 4 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 * 9)
      worldObjects2[9] = createObject(love.graphics.getWidth() + 200 + (Bush:getWidth() * 4 + objectsoffset), love.graphics.getHeight()/2 + Bush:getHeight()/2 * 9, 40, 40, "Bush2")
        currentSection2 = 4
        value2 = 5
    end
    for i = 1, love.graphics.getWidth() - BGoffset, Bush:getWidth() do
      love.graphics.draw(Bush, i + BGoffset, love.graphics.getHeight()/2 - Bush:getHeight()/2)
    end
    for i = 1, love.graphics.getWidth() - BGoffset, Tree:getWidth() do
      love.graphics.draw(Tree, i + BGoffset)
    end
    for i = 1, love.graphics.getWidth() - BGoffset, Tree:getWidth() do
      love.graphics.draw(Tree, i + BGoffset, love.graphics.getHeight() - Tree:getHeight())
    end
  end
drawWorld({objects})
drawWorld({objects2})
drawWorld(worldObjects)
drawWorld(worldObjects2)
end
