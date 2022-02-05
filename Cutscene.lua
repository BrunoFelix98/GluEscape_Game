require "vector2"
require "conf"

local Timer = 90
soundTimer = 90

local Village
local SpeakingVillage
local TurkeyStopped
local TurkeySpeak
local Players

local speaking = false
local Turkeyspeaking = false
local Playersspeaking = false
local Playersspeaking2 = false
local Turkeyspeaking2 = false
local Sniff
local GluAudio


function CutsceneLoad()
  Village = love.graphics.newImage("Background_Trailer.png")
  SpeakingVillage = love.graphics.newImage("Background_Trailer2.png")
  TurkeyStopped = love.graphics.newImage("Background_Trailer_TurkeyStopped.png")
  TurkeySpeak = love.graphics.newImage("Background_Trailer_TurkeySpeaking.png")
  Players = love.graphics.newImage("Background_Trailer_Players.png")
  Players2 = love.graphics.newImage("Background_Trailer_Players2.png")
  Sniff = love.audio.newSource("Sniff.mp3", "static")
  GluAudio = love.audio.newSource("Glu_Audio.mp3", "static")
  GluAudio:setVolume(0.1)
end

function CutsceneDraw()
  if speaking == false then
    love.graphics.draw(Village, 0, 0)
  end
  if speaking == true then
    love.graphics.draw(SpeakingVillage, 0, 0)
  end
  if Turkeyspeaking == true then
    love.graphics.draw(TurkeyStopped, 0, 0)
  end
  if Turkeyspeaking2 == true then
    love.graphics.draw(TurkeySpeak, 0, 0)
    love.audio.play(GluAudio)
  end
  if Playersspeaking == true then
    love.graphics.draw(Players, 0, 0)
  end
  if Playersspeaking2 == true then
    love.graphics.draw(Players2, 0, 0)
  end
end

function CutsceneUpdate(dt)
  Timer = Timer + 10 * dt
  soundTimer = soundTimer + 20 * dt

  if Timer > 100 then
    speaking = true
  end
  if speaking == true then
    Turkeyspeaking = true
  end
  for i = 1, 1, 1 do
    if soundTimer > 150 and soundTimer < 200 then
      Turkeyspeaking2 = true
      Turkeyspeaking = false
    end
    if soundTimer > 200 then
      Turkeyspeaking2 = false
      Turkeyspeaking = false
      Playersspeaking = true
    end
    if soundTimer > 210 then
      Playersspeaking2 = true
      love.audio.play(Sniff)
    end
    if soundTimer > 230 then
      Playersspeaking2 = false
      love.audio.stop(Sniff)
    end
    if soundTimer > 250 then
      Playersspeaking = false
      speaking = false
    end
  end
end