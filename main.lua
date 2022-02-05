require "vector2"
require "Player1"
require "Player2"
require "conf"
require "Boomerang"
require "BackgroundSprited"
require "worldObjects"
require "MainMenu"
require "Cutscene"
require "score"
require "Turkeys"
require "DeadScreen"

MainMenu = true
pause = false
Instructions = false
Quit = false
Cutscene1 = false
Playing = false

local BackgroundAudio
local Running
local Wind
local PlayAudio
local Birds

DeadCount = 0

function love.load()

  MenuLoad()
  BackgroundAudio = love.audio.newSource("Glu_Background.mp3", "stream")
  BackgroundAudio:setVolume(0.30)
  DeadLoad()
  CutsceneLoad()
  BackgroundLoad()
  player1load()
  player2load()
  Running = love.audio.newSource("Running.mp3", "stream")
  Running:setVolume(0.50)
  Wind = love.audio.newSource("Wind.mp3", "stream")
  Wind:setVolume(0.55)
  PlayAudio = love.audio.newSource("Background_music.mp3","stream")
  PlayAudio:setVolume(0.70)
  Birds = love.audio.newSource("Birds.mp3", "stream")
  Birds:setVolume(0.50)
  TurkeysLoad()
  boomerangLoad()
  
end

function love.draw()
  if DeadByTurkeys == true then
    DeadByTurkeysDraw()
    Wind:setVolume(0)
    Running:setVolume(0)
    PlayAudio:setVolume(0)
    Birds:setVolume(0)
  end
  if MainMenu == true then
    MenuDraw()
    soundTimer = 0
    love.audio.play(BackgroundAudio)
    Wind:setVolume(0)
    Running:setVolume(0)
    PlayAudio:setVolume(0)
    Birds:setVolume(0)
  end
  if Playing == true then
    love.audio.play(Running)
    Running:setVolume(0.50)
    love.audio.play(Wind)
    Wind:setVolume(0.55)
    love.audio.play(PlayAudio)
    PlayAudio:setVolume(0.70)
    love.audio.play(Birds)
    Birds:setVolume(0.50)
    BackgroundDraw()
    player1draw()
    player2draw()
    boomerangDraw()
    scoreDraw()
    TurkeysDraw()
    DeadByTurkeys = false
  end
  if Instructions == true then
    InstructionsDraw()
    love.audio.play(BackgroundAudio)
  end
  if Quit == true and Instructions == false then
    love.event.quit()
  end
  if pause == true then
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Paused", love.graphics.getWidth()/2 - 35, love.graphics.getHeight()/2 - 15, 0, 1.5, 1.5)
    Running:setVolume(0)
  end
  if Cutscene1 == true then
    CutsceneDraw()
    BackgroundAudio:setVolume(0)
  end
end

function love.mousepressed(x, y, button)
  if MainMenu == true then
    if button == 1 and x > 374 and x < 899 and y > 420 and y < 495 then
      Instructions = true
      score = 0
    end
    if button == 1 and x > 374 and x < 899 and y > 300 and y < 375 then
      MainMenu = false
      Cutscene1 = true
      DeadByTurkeys = false
    end
    if button == 1 and x > 374 and x < 899 and y > 540 and y < 610 then
      Quit = true
    end
    if button == 1 and x > 535 and x < 755 and y > 655 and y < 700 then
      Instructions = false
    end
  end
end

function love.keypressed(key, scancode, isrepeat)
  if key == "p" and MainMenu == false and Cutscene1 == false and DeadByTurkeys == false then
    if pause == false then
      pause = true
    else
      pause = false
    end
  end
  if key == "escape" then
    Playing = false
    Cutscene1 = false
    soundTimer = 0
    MainMenu = true
  end
  if key == "escape" and DeadByTurkeys == true then
    Playing = false
    Cutscene1 = false
    soundTimer = 0
    MainMenu = true
    DeadByTurkeys = false
    DeadCount = 0
    love.load()
    objectsoffset = 0
    BGoffset = 0
    love.event.quit("restart")
  end
end

function love.update(dt)
  DeadUpdate(dt)
  if soundTimer > 260 then
    Cutscene1 = false
    Playing = true
    if DeadCount > 0 then
      DeadByTurkeys = false
    end
  end
  if Cutscene1 == true then
    CutsceneUpdate(dt)
    DeadByTurkeys = false
  end
  if Playing == true then
    if pause == false then
      BackgroundUpdate(dt)
      boomerangUpdate(dt)
      player1update(dt)
      player2update(dt)
      scoreUpdate(dt)
      TurkeysUpdate(dt)
    end
  end
  if DeadByTurkeys == true then
    Playing = false
    pause = false
    Cutscene1 = false
    soundTimer = 0
    DeadCount = DeadCount + 1
  end
  if MainMenu == true then
    DeadByTurkeys = false
  end
  if Cutscene1 == true then
    DeadByTurkeys = false
  end
  if Playing == true then
    DeadByTurkeys = false
  end
end

function GetBoxCollisionDirection(x1,y1,w1,h1,x2,y2,w2,h2)
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
  local playerdir = vector2.normalize(vector2.sub(vector2.new(x1,y1), vector2.new(x2,y2)))
  local collisiondir
  
  if overlapx > overlapy then
  collisiondir = vector2.normalize(vector2.new(0, playerdir.y * overlapy))
  elseif overlapx < overlapy then
  collisiondir = vector2.normalize(vector2.new(playerdir.x * overlapx, 0))
  else collisiondir = vector2.normalize(vector2.new(playerdir.x * overlapx, playerdir.y * overlapy))
  end
  return collisiondir
end

function GetBoxCollisionDirection2(x1,y1,w1,h1,x2,y2,w2,h2)
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
  local playerdir = vector2.normalize(vector2.sub(vector2.new(x1,y1), vector2.new(x2,y2)))
  local collisiondir
  
  if overlapx > overlapy then
    collisiondir = vector2.normalize(vector2.new(0, playerdir.y * overlapy))
  elseif overlapx < overlapy then
    collisiondir = vector2.normalize(vector2.new(playerdir.x * overlapx, 0))
  else collisiondir = vector2.normalize(vector2.new(playerdir.x * overlapx, playerdir.y * overlapy))
  end
  return collisiondir
end

function love.keyreleased(key, scancode)
  if (key == "w" or key == "s") then
    player1CheckForStop()
  elseif (key == "up" or key == "down") then
    player2CheckForStop()
  end
end