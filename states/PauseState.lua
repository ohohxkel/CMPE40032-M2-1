--[[
    PauseState Class

    The PauseState is the pause screen of the game, shown upon pressing 'P' during runplay. It should
    display pause icon. 
]]

PauseState = Class{__includes = BaseState}

--local PAUSE_ICON = love.graphics.newImage('pause_icon.png')

function PauseState:init()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    self.image = love.graphics.newImage('pause.png')
    self.x = VIRTUAL_WIDTH / 2 -30
    self.y = VIRTUAL_HEIGHT / 2 -30

    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
end

function PauseState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('p') then
        gStateMachine:change('play', {
            bird = self.bird,
            pipepairs = self.pipepairs,
            lastY = self.lastY,
            timer = self.timer,
            score = self.score
        })
    end
end

function PauseState:render()
    for k,pair in pairs(self.pipepairs) do -- not necessary, but just to display game on runtime
        pair:render()
    end
    self.bird:render()
    
    love.graphics.draw(self.image, self.x,self.y)
    love.graphics.setFont(flappyFont)
    love.graphics.printf('P A U S E D !',0,50,VIRTUAL_WIDTH,'center')
    love.graphics.setFont(mediumFont)
    love.graphics.printf('Press p to Resume Game.',0,80,VIRTUAL_WIDTH,'center')

end

function PauseState:enter(params)
    self.bird = params.bird
    self.pipepairs = params.pipePairs
    self.lastY = params.lastY
    self.timer = params.timer
    self.score = params.score
end
