require "vector2"

local background
local Instructions
local Play
local Quit
local Logo
local P1
local P2
local Back
local P1Movement
local P1Throw
local P1Share
local P2Movement
local P2Throw
local P2Share
local TurkeyDeath

function MenuLoad()
  background = love.graphics.newImage("Main_Menu_Background.png")
  Instructions = love.graphics.newImage("Main_Menu_Instructions_Button.png")
  Play = love.graphics.newImage("Main_Menu_Play_Button.png")
  Quit = love.graphics.newImage("Main_Menu_Quit_Button.png")
  Logo = love.graphics.newImage("Glu_Escape_Logo.png")
  P2Share = love.graphics.newImage("Main_Menu_P2_Share.png")
  P2Throw = love.graphics.newImage("Main_Menu_P2_Throw.png")
  P2Movement = love.graphics.newImage("Main_Menu_P2_Movement.png")
  P1Share = love.graphics.newImage("Main_Menu_P1_Share.png")
  P1Throw = love.graphics.newImage("Main_Menu_P1_Throw.png")
  P1Movement = love.graphics.newImage("Main_Menu_P1_Movement.png")
  Back = love.graphics.newImage("Main_Menu_Back_Button.png")
  P2 = love.graphics.newImage("Main_Menu_P2.png")
  P1 = love.graphics.newImage("Main_Menu_P1.png")
  TurkeyDeath = love.graphics.newImage("Main_Menu_TurkeyDeath.png")
end

function MenuDraw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(background, 0, 0)
  love.graphics.draw(Instructions, love.graphics.getWidth()/2 - Instructions:getWidth()/2, 420)
  love.graphics.draw(Play, love.graphics.getWidth()/2 - Instructions:getWidth()/2, 300)
  love.graphics.draw(Quit, love.graphics.getWidth()/2 - Instructions:getWidth()/2, 540)
  love.graphics.draw(Logo, love.graphics.getWidth()/2 - Logo:getWidth()/2, 70)
end

function InstructionsDraw()
  love.graphics.draw(background, 0, 0)
  love.graphics.draw(Logo, love.graphics.getWidth()/2 - Logo:getWidth()/2, 70)
  love.graphics.draw(P1, 40, 250)
  love.graphics.draw(P1Share, 40, 565)
  love.graphics.draw(P1Throw, 40, 460)
  love.graphics.draw(P1Movement, 40, 355)
  love.graphics.draw(P2, 720, 250)
  love.graphics.draw(P2Share, 720, 565)
  love.graphics.draw(P2Throw, 720, 460)
  love.graphics.draw(P2Movement, 720, 355)
  love.graphics.draw(Back, 535, 655)
end

function TurkeyDeathDraw()
  love.graphics.draw(TurkeyDeath, 0 ,0)
  love.graphics.draw(Back, 535, 655)
end