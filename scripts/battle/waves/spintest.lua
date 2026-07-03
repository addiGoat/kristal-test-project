local SpinTest, super = Class(Wave)

function SpinTest:init()
    super.init(self)

    self.time = 8
end

function SpinTest:onStart()
    local dummy = self:getAttackers()[1]

    -- local x = SCREEN_WIDTH / 2
    -- local y = SCREEN_HEIGHT / 2
    -- local bullet = self:spawnBullet("bullets/smallbullet", x, y)
    -- bullet.physics.speed = 8
    -- bullet.physics.spin = math.rad(2)


    self.timer:everyInstant(1, function()
        local x, y = Game.battle.soul.x, Game.battle.soul.y - 30
        local bullet = self:spawnBullet("smallbullet", x, y, 0, 8)

        bullet.physics.spin = math.rad(10)
    end)
end


function SpinTest:update()
    super.update(self)
end

return SpinTest
