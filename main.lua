
_G.Region = require("examples.lib.region")
_G.LUI = require("LUI")

local elements = require("elements")
_G.elements = elements


local m = elements.Menu(false, "hi", {}, 69)


_G.mainStyle = LUI.Style()
mainStyle.LINE_WIDTH = 4


local function getScreenView()
    return 0,0, love.graphics.getDimensions()
end


local scene = LUI.Scene()

m:setView(getScreenView())
scene:addElement(m)


function love.draw()
    scene:render()
end

function love.mousepressed(mx, my, button, istouch, presses)
    local consumed = scene:mousepressed(mx, my, button, istouch, presses)
end

function love.mousereleased(mx, my, button, istouch)
    scene:mousereleased(mx, my, button, istouch)
end

function love.mousemoved(mx, my, dx, dy, istouch)
    scene:mousemoved(mx, my, dx, dy, istouch)
end

function love.keypressed(key, sc, isrep)
    local consumed = scene:keypressed(key, sc, isrep)
end

function love.keyreleased(key, scancode)
    scene:keyreleased(key, scancode)
end

function love.textinput(text)
    local consumed = scene:textinput(text)
end

function love.wheelmoved(dx,dy)
    scene:wheelmoved(dx,dy)
end



